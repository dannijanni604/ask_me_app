import 'package:ask_me/components/category_button.dart';
import 'package:ask_me/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 170.h,
            width: 360.w,
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Color.fromRGBO(194, 0, 39, 1),
                Color.fromRGBO(10, 35, 104, 1)
              ], begin: Alignment.topLeft),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(80),
              ),
            ),
            child: Center(
              child: Text(
                "ASK ME",
                style: TextStyle(color: Colors.white, fontSize: 26.sp),
              ),
            ),
          ),
          Center(
            child: GridView.count(
              shrinkWrap: true,
              padding: EdgeInsets.all(10.r),
              crossAxisCount: 2,
              mainAxisSpacing: 20.h,
              crossAxisSpacing: 20.w,
              children: [
                CategoryButton(
                  onTap: () {
                    Get.toNamed(Routes.textGenerator);
                  },
                  label: "Text Generator",
                  imageUrl: "assets/icons/textn.png",
                  colors: const [
                    Color.fromRGBO(47, 71, 79, 1),
                    Color.fromRGBO(159, 188, 198, 1),
                  ],
                ),
                CategoryButton(
                  onTap: () {
                    Get.toNamed(Routes.imageGenerator);
                  },
                  label: "Image Generator",
                  imageUrl: "assets/icons/image.png",
                  colors: const [
                    Color.fromRGBO(0, 194, 162, 1),
                    Color.fromRGBO(0, 0, 2, 1)
                  ],
                ),
                CategoryButton(
                  onTap: () {
                    Get.toNamed(Routes.codeGenerator);
                  },
                  label: "Code Generator",
                  imageUrl: "assets/icons/code.png",
                  colors: const [
                    Color.fromRGBO(85, 228, 224, 1),
                    Color.fromRGBO(29, 19, 218, 0.737),
                  ],
                ),
                CategoryButton(
                  onTap: () {
                    Get.toNamed(Routes.moreView);
                  },
                  label: "About Us",
                  imageUrl: "assets/icons/more.png",
                  colors: const [
                    Color.fromRGBO(230, 162, 16, 1),
                    Color.fromRGBO(248, 161, 190, 1),
                  ],
                ),
              ],
            ),
          ),
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
    );
  }
}
