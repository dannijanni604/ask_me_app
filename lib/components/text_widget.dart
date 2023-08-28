import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_plus/share_plus.dart';
import 'app_snackbar.dart';

// ignore: must_be_immutable
class AiTextCard extends StatelessWidget {
  AiTextCard({Key? key, this.textData}) : super(key: key);

  // ignore: prefer_typing_uninitialized_variables
  var textData;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.sp),
        color: Colors.green.withOpacity(0.1),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(20.w, 5.h, 20.w, 0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    textData.text,
                    style: TextStyle(fontSize: 18.sp),
                  ),
                ),
                SizedBox(width: 10.w),
                Column(
                  children: [
                    Container(
                      height: 30.h,
                      width: 30.h,
                      decoration: BoxDecoration(
                          color: Colors.green.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(100)),
                      child: const Icon(
                        Icons.ac_unit,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    const Text("AI")
                  ],
                ),
              ],
            ),
            SizedBox(height: 30.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                    onTap: () {
                      Share.share(textData.text);
                    },
                    child: const Icon(Icons.share)),
                SizedBox(width: 20.w),
                InkWell(
                    onTap: () {
                      Clipboard.setData(ClipboardData(text: textData.text));
                      sendAlert("Message copied successfully!");
                    },
                    child: const Icon(Icons.copy)),
              ],
            ),
            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class MyTextCard extends StatelessWidget {
  MyTextCard({Key? key, this.textData}) : super(key: key);

  // ignore: prefer_typing_uninitialized_variables
  var textData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.r),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 30.h,
            width: 30.w,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.8),
                borderRadius: BorderRadius.circular(100)),
            child: const Icon(
              Icons.person,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              textData.text,
              style: const TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
