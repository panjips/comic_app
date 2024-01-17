import 'package:comic_app/utils/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';

class RectangleShimmer extends StatelessWidget {
  const RectangleShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Shimmer.fromColors(
          baseColor: slate[900]!,
          highlightColor: slate[800]!,
          child: Container(
            width: 28.w,
            height: 18.h,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Shimmer.fromColors(
            baseColor: slate[900]!,
            highlightColor: slate[800]!,
            child: Container(
              width: 28.w,
              height: 16.sp,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
        ),
        Shimmer.fromColors(
          baseColor: slate[900]!,
          highlightColor: slate[800]!,
          child: Container(
            width: 8.w,
            height: 14.sp,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        )
      ],
    );
  }
}
