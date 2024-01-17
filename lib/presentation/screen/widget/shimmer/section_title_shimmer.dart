import 'package:comic_app/utils/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';

class SectionTitleShimmer extends StatelessWidget {
  const SectionTitleShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: slate[900]!,
      highlightColor: slate[800]!,
      child: Container(
        width: 45.w,
        height: 16.sp,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }
}
