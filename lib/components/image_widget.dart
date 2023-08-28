// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:ask_me/views/image_views/full_image_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

// ignore: must_be_immutable
class ImageCard extends StatelessWidget {
  ImageCard({Key? key, this.images}) : super(key: key);

  var images;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: MasonryGridView.builder(
          gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          mainAxisSpacing: 3,
          crossAxisSpacing: 3,
          itemCount: images.length,
          itemBuilder: (context, index) {
            return InkWell(
              splashColor: Colors.black,
              onTap: () {
                Get.to(FullImageView(image: images[index].url));
              },
              child: Card(
                child: CachedNetworkImage(
                  imageUrl: images[index].url,
                  fit: BoxFit.cover,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      SizedBox(
                          height: 150,
                          width: 150,
                          child: Shimmer.fromColors(
                            baseColor: Colors.grey.withOpacity(.3),
                            highlightColor: Colors.grey,
                            child: Container(
                              height: 220,
                              width: 130,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(4)),
                            ),
                          )),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            );
          }),
    );
  }
}
