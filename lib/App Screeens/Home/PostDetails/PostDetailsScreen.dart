import 'package:alkebulan/Controllers/PostController.dart';
import 'package:alkebulan/Utils/Mediaquery%20Sizer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class PostDetailScreen extends StatelessWidget {
  final PostController controller = Get.put(PostController());

  @override
  Widget build(BuildContext context) {
    final post = controller.selectedPost.value!;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Bar
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQueryHelper.width(context, 0.04),
                vertical: MediaQueryHelper.height(context, 0.02),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () => Get.back(),
                  ),
                  Row(
                    children: [
                      Icon(Icons.favorite_border,
                          size: MediaQueryHelper.width(context, 0.06)),
                      SizedBox(width: MediaQueryHelper.width(context, 0.03)),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed('postCommentsScreen');
                        },
                        child: SvgPicture.asset('assets/icons/sms.svg',
                            height: MediaQueryHelper.width(context, 0.045)),
                      ),
                      SizedBox(width: MediaQueryHelper.width(context, 0.03)),
                      Icon(Icons.bookmark_border,
                          size: MediaQueryHelper.width(context, 0.06)),
                      Icon(Icons.download_outlined,
                          size: MediaQueryHelper.width(context, 0.06)),
                    ],
                  ),
                ],
              ),
            ),

            // Post Image
            ClipRRect(
              child: Image.asset(
                post.imageUrl,
                width: double.infinity,
                height: MediaQueryHelper.height(context, 0.25),
                fit: BoxFit.fill,
              ),
            ),

            // Post Title
            Padding(
              padding: EdgeInsets.only(
                left: MediaQueryHelper.width(context, 0.05),
                right: MediaQueryHelper.width(context, 0.05),
                top: MediaQueryHelper.height(context, 0.03),
                bottom: MediaQueryHelper.height(context, 0.015),
              ),
              child: Text(
                post.title,
                style: TextStyle(
                  fontSize: MediaQueryHelper.fontSize(context, 0.05),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQueryHelper.width(context, 0.05)),
              child: SingleChildScrollView(
                child: Text(
                  'Failure to tackle inequality and unrest in South Africa could spark a revolutionary uprising',
                  style: TextStyle(
                      fontSize: MediaQueryHelper.fontSize(context, 0.04)),
                ),
              ),
            ),
            // Author & Time
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQueryHelper.width(context, 0.05)),
              child: Row(
                children: [
                  Text(
                    "${post.username}",
                    style: TextStyle(
                      fontSize: MediaQueryHelper.fontSize(context, 0.035),
                      color: Colors.blue,
                    ),
                  ),
                  Text(
                    " and ",
                    style: TextStyle(
                      fontSize: MediaQueryHelper.fontSize(context, 0.035),
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    "michel •  ${post.timeAgo} ",
                    style: TextStyle(
                      fontSize: MediaQueryHelper.fontSize(context, 0.035),
                      color: Colors.blue,
                    ),
                  ),
                  Text(
                    " 3 min read",
                    style: TextStyle(
                      fontSize: MediaQueryHelper.fontSize(context, 0.035),
                      color: const Color.fromARGB(255, 109, 108, 108),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: MediaQueryHelper.height(context, 0.015)),

            // Post Content
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQueryHelper.width(context, 0.05)),
                child: SingleChildScrollView(
                  child: Text(
                    post.description ??
                        " Capetown (CNN) - South Africa, once hailed as the Rainbow Nation for its peaceful transition from apartheid to democracy, is now grappling with deepening inequalities and political disillusionment. Despite its democratic progress, the country faces critical challenges that could push it to the brink of a revolutionary crisis similar to the Arab Spring uprisings that swept through the Middle East and North Africa in 2011. The question looms: can South Africa avert disaster, or will it face the same fate as those nations that failed to address the cries of their people? The Rising Tide of Discontent Since the end of apartheid in 1994, South Africa has made significant strides in fostering a democratic society. However, the promise of a better life for all remains largely unfulfilled for millions. Unemployment rates are staggering, with official figures often exceeding 30%, and youth unemployment is even more alarming. These numbers don’t account for the many South Africans who have simply given up on the job market. Economic inequality is another pressing issue. While a small elite has flourished, the majority of South Africans still live in poverty. The divide between the rich and the poor is stark, and this inequality has become even more apparent in the urban townships, where residents face a daily struggle for basic necessities. In contrast, the elite enjoy a level of wealth and privilege that would seem out of place in a country that prides itself on its democratic values. Corruption has become an entrenched problem in South Africa’s political landscape. Scandals involving politicians and state-owned enterprises have undermined public trust in the government. The state’s failure to provide basic services such as water, electricity, and education to large portions of the population has fueled resentment. This systemic dysfunction mirrors the grievances that sparked revolutions across the Arab world: widespread corruption, lack of accountability, and government neglect of the people’s needs.The ruling African National Congress (ANC), once a symbol of liberation and hope, has lost much of its legitimacy. The party’s internal divisions, coupled with its failure to address the deep-rooted problems in the country, have made it vulnerable to public anger. South Africans, particularly young people, are increasingly questioning the ANC’s ability to govern effectively. Social unrest is already simmering beneath the surface. In recent years, protests over issues such as poor service delivery, corruption, and land reform have become more frequent and widespread. In 2021, violent riots erupted in KwaZulu-Natal and Gauteng, marking one of the most intense periods of unrest since the end of apartheid. What began as protests against the imprisonment of former President Jacob Zuma quickly escalated into a broader uprising, with looting and destruction spreading across major cities. These riots were not isolated events; they were the result of years of frustration with the government’s inability to address the country’s pressing issues. The similarities between South Africa and the Arab Spring are impossible to ignore. In Tunisia, Egypt, and Libya, long-standing grievances over economic hardship, political repression, and corruption led to mass uprisings. Governments that failed to act swiftly and decisively found themselves caught off guard, facing the wrath of their own citizens. In South Africa, a similar sense of desperation is building, especially among the youth, who feel disconnected from the promises of the post-apartheid government. The Path Forward South Africa’s leaders must act quickly to address the root causes of discontent before the situation spirals further. The government must focus on creating jobs, reducing inequality, and rebuilding trust with the people. Effective governance, free from corruption, is essential to avoid the fate of countries that have seen their governments toppled by revolution. However, the solution does not lie solely with the government. South Africans, particularly civil society organizations and young activists, must also play an active role in demanding accountability and pushing for reforms. A collective effort is needed to ensure that the country moves toward a more inclusive and equitable future. If South Africa fails to act, it risks facing an uprising that could echo the Arab Spring, leading to political instability and social chaos. But with decisive action and a renewed commitment to justice and equality, South Africa can still avoid that fate and live up to the promise of a truly democratic nation.",
                    style: TextStyle(
                        fontSize: MediaQueryHelper.fontSize(context, 0.04)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
