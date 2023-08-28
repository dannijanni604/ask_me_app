import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AboutUsView extends StatelessWidget {
  const AboutUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 20.h),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: const Icon(Icons.arrow_back_rounded)),
                      const Text(
                        "About Us",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox()
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  const Text(
                    "This application stands as a testament to the culmination of a journey brimming with ambition and determination, embarked upon during the pivotal final year of academia. As the zenith of unwavering commitment and relentless dedication, it serves as a living testament to the collaborative ingenuity of a group of visionary minds. United by a shared purpose, these exceptional individuals converged their talents, aspirations, and unwavering zeal to breathe life into this project.",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
                  ),
                  const Text(
                    "The resulting development team, a synergy of diverse skill sets and unwavering perseverance, is composed of the following remarkable individuals:",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  const Text(
                    "M. Adnan Ashraf",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                  ),
                  const Text(
                    "Waqar Younas",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                  ),
                  const Text(
                    "Zia Ahmad",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                  ),
                  SizedBox(
                      height: 60.h, child: Image.asset("assets/icons/ai.png")),
                ],
              ),
            ),
            const Expanded(child: SizedBox()),
            Container(
              width: 360.w,
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color.fromRGBO(10, 35, 104, 1),
                  Color.fromRGBO(134, 0, 27, 1),
                ], begin: Alignment.centerLeft),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(50)),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 30.h),
                child: const Text(
                    "Project Created as a Final Year Project \n All Rights Reserved",
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
