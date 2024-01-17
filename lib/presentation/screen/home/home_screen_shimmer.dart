import 'package:comic_app/presentation/screen/widget/shimmer/rectangle_shimmer.dart';
import 'package:comic_app/presentation/screen/widget/shimmer/section_title_shimmer.dart';
import 'package:comic_app/presentation/screen/widget/shimmer/square_shimmer.dart';
import 'package:comic_app/utils/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreenShimmer extends StatelessWidget {
  const HomeScreenShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Shimmer.fromColors(
          baseColor: slate[900]!,
          highlightColor: slate[800]!,
          child: Container(
            width: 100.w,
            height: 34.h,
            color: Colors.black,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0, top: 16.0, bottom: 8),
          child: SectionTitleShimmer(),
        ),
        SizedBox(
          width: 100.w,
          height: 28.h,
          child: ListView.separated(
              shrinkWrap: true,
              padding: const EdgeInsets.only(left: 16, top: 8),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return RectangleShimmer();
              },
              separatorBuilder: (context, index) => SizedBox(
                    width: 14.sp,
                  ),
              itemCount: 4),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: SectionTitleShimmer(),
        ),
        Expanded(
          child: GridView.builder(
            padding: EdgeInsets.only(left: 16, top: 12),
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1 / 1.5,
            ),
            itemBuilder: (context, index) {
              return SquareShimmer();
            },
            itemCount: 6,
          ),
        )
      ],
    );
  }
}
