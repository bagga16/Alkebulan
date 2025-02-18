import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class LiveTVController extends GetxController {
  late VideoPlayerController videoController;
  var isPlaying = true.obs;
  var isMuted = false.obs;
  var progress = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    videoController = VideoPlayerController.asset("assets/videos/2.mp4")
      ..initialize().then((_) {
        videoController.setLooping(true);
        videoController.play();
        updateProgress();
      });
  }

  void togglePlayPause() {
    if (videoController.value.isPlaying) {
      videoController.pause();
      isPlaying.value = false;
    } else {
      videoController.play();
      isPlaying.value = true;
    }
  }

  void toggleMute() {
    isMuted.value = !isMuted.value;
    videoController.setVolume(isMuted.value ? 0 : 1);
  }

  void updateProgress() {
    videoController.addListener(() {
      if (videoController.value.isInitialized) {
        progress.value = videoController.value.position.inMilliseconds /
            videoController.value.duration.inMilliseconds;
      }
    });
  }

  @override
  void onClose() {
    videoController.dispose();
    super.onClose();
  }
}
