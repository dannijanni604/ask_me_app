import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatelessWidget {
  const AppButton(
      {super.key,
      required this.label,
      required this.onTap,
      this.color,
      this.textColor});

  final String label;
  final VoidCallback onTap;
  final Color? color;
  final Color? textColor;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(
                color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.8)),
            color: color ?? const Color.fromARGB(255, 0, 0, 0).withOpacity(0.8),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(10.r),
            onTap: onTap,
            child: Container(
                width: 170.w,
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      // "Generate Code",
                      label,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: textColor ?? Colors.white,
                      ),
                    )
                  ],
                )),
          ),
        ),
      ],
    );
  }
}
