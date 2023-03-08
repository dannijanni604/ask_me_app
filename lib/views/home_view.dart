import 'package:ask_me/components/app_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: GridView.count(
        shrinkWrap: true,
        padding: EdgeInsets.all(20),
        // primary: true,
        crossAxisCount: 2,
        mainAxisSpacing: 20.h,
        crossAxisSpacing: 20.w,
        children: [
          AppIconButton(
              label: "Text Generator",
              color: Colors.deepOrangeAccent,
              icon: Icons.text_snippet_rounded),
          AppIconButton(
              label: "Code Generator",
              color: Colors.orangeAccent,
              icon: Icons.code),
          AppIconButton(
              label: "Image Generator",
              color: Colors.black54,
              icon: Icons.image),
        ],
      )),
    );
  }
}


// Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             AppIconButton(
//                 label: "Text Generator",
//                 color: Colors.deepOrangeAccent,
//                 icon: Icons.text_snippet_rounded),
//             SizedBox(
//               height: 20.h,
//             ),
//             AppIconButton(
//                 label: "Code Generator",
//                 color: Colors.orangeAccent,
//                 icon: Icons.code),
//             SizedBox(
//               height: 20.h,
//             ),
//             AppIconButton(
//                 label: "Image Generator",
//                 color: Colors.black54,
//                 icon: Icons.image),
//           ],
//         ),