import 'package:cached_network_image/cached_network_image.dart';
import 'package:comic_app/utils/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class RectangleCard extends StatelessWidget {
  final String? rating;
  final String? newChapter;
  final String title;
  final String thumbnail;
  const RectangleCard(
      {super.key,
      this.rating,
      required this.title,
      required this.thumbnail,
      this.newChapter});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: CachedNetworkImage(
            imageUrl: thumbnail,
            width: 28.w,
            height: 18.h,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(top: 8.sp),
          width: 28.w,
          height: 6.h,
          child: Text(
            title,
            style: TextStyle(
              fontFamily: "Poppins",
              fontWeight: FontWeight.w600,
              color: slate[300],
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        ),
        rating == null
            ? SizedBox(
                width: 28.w,
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        padding: const EdgeInsets.only(
                            top: 2, left: 4, right: 4, bottom: 2),
                        color: const Color(0xFFFDF2C6).withOpacity(0.6),
                        child: Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: const Color(0xFFBDF164),
                              size: 3.w,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 4),
                              child: Text(
                                rating!,
                                style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: slate[900],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 4),
                      child: Text(
                        newChapter!,
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.normal,
                          color: slate[600],
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : SizedBox(),
      ],
    );
  }
}
