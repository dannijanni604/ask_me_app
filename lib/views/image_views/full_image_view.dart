import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_plus/share_plus.dart';

class FullImageView extends StatelessWidget {
  const FullImageView({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          mini: true,
          child: const Icon(
            Icons.share,
          ),
          onPressed: () {
            Share.share(image);
          },
        ),
        body: Center(
          child: CachedNetworkImage(
            height: 600.h,
            width: 360.w,
            imageUrl: image,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
