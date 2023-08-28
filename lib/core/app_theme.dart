import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ThemeData theme = ThemeData(
  primaryColor: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.8),
  hoverColor: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.8),
  splashColor: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.8),
  iconTheme: IconThemeData(
    size: 16,
    color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.8),
  ),
  progressIndicatorTheme: ProgressIndicatorThemeData(
    color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.8),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.8),
    splashColor: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.8),
    iconSize: 16.sp,
  ),
  appBarTheme: AppBarTheme(
    color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.8),
    centerTitle: true,
    elevation: 0,
  ),
);
