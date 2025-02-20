import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class LiveTVController extends GetxController {
  VideoPlayerController? videoController;
  var isPlaying = false.obs;
  var isMuted = false.obs;
  var progress = 0.0.obs;
  var isFullscreen = false.obs;
  var currentVideoIndex = 0.obs;

  final List<String> liveVideos = [
    "assets/videos/3.mp4",
    "assets/videos/1.mp4",
    "assets/videos/2.mp4",
  ];

  @override
  void onInit() {
    super.onInit();
  }

  void initializeVideo(int index) {
    if (index >= liveVideos.length) return;

    disposeVideo(); // Dispose of any existing video before initializing a new one

    videoController = VideoPlayerController.asset(liveVideos[index])
      ..initialize().then((_) {
        videoController!.setLooping(true);
        playVideo();
        updateProgress();
        update();
      });
  }

  void playVideo() {
    videoController?.play();
    isPlaying.value = true;
  }

  void pauseVideo() {
    videoController?.pause();
    isPlaying.value = false;
  }

  void togglePlayPause() {
    if (videoController?.value.isPlaying ?? false) {
      pauseVideo();
    } else {
      playVideo();
    }
  }

  void toggleMute() {
    isMuted.value = !isMuted.value;
    videoController?.setVolume(isMuted.value ? 0 : 1);
  }

  void toggleFullscreen() {
    isFullscreen.value = !isFullscreen.value;
    update();
  }

  void updateProgress() {
    videoController?.addListener(() {
      if (videoController?.value.isInitialized ?? false) {
        progress.value = videoController!.value.position.inMilliseconds /
            videoController!.value.duration.inMilliseconds;
      }
    });
  }

  void switchVideo(int index) {
    if (index < liveVideos.length) {
      initializeVideo(index);
    }
  }

  void disposeVideo() {
    videoController?.pause();
    videoController?.dispose();
    videoController = null;
  }

  @override
  void onClose() {
    disposeVideo();
    super.onClose();
  }
}
