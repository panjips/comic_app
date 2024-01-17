import 'package:cached_network_image/cached_network_image.dart';
import 'package:comic_app/utils/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BannerCard extends StatelessWidget {
  final String title;
  final String thumbnail;
  const BannerCard({super.key, required this.title, required this.thumbnail});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CachedNetworkImage(
          width: 100.w,
          fit: BoxFit.cover,
          imageUrl: thumbnail,
        ),
        Container(
          width: 100.w,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                slate[950]!,
                slate[950]!.withOpacity(0.2),
              ],
            ),
          ),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: const EdgeInsets.only(left: 16.0, bottom: 16.0),
              width: 70.w,
              child: Text(
                title,
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w600,
                  fontSize: 20.sp,
                  color: slate[300],
                ),
                maxLines: 2,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
