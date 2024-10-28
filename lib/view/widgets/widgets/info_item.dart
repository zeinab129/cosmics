import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoItem extends StatelessWidget {
  String icon;
  String title;
  String subTitle;
  String info;

  InfoItem(
      {super.key,
      required this.icon,
      required this.title,
      required this.subTitle,
      required this.info});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/images/info_icons/ic_$icon.png",
          width: 48.w,
          height: 48.h,
        ),
        SizedBox(
          height: 8.h,
        ),
        Text(
          title,
          style: GoogleFonts.figtree(fontSize: 12.sp, color: Colors.white),
        ),
        Text(
          subTitle,
          style: GoogleFonts.figtree(fontSize: 12.sp, color: Colors.white),
        ),
        SizedBox(
          height: 8.h,
        ),
        Text(
          info,
          style: GoogleFonts.figtree(
              fontSize: 24.sp,
              color: Colors.white,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
