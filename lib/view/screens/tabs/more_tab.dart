
import 'package:cosmics/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class MoreTab extends StatelessWidget {
  const MoreTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body:               Container(
        width: double.infinity,
        margin: EdgeInsetsDirectional.symmetric(horizontal: 24.w, vertical: 24.h),
        padding: EdgeInsets.only(
            top: 24.h, bottom: 24.h, left: 24.w, right: 24.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32.r),
          border: Border.all(
              width: 0.5, color: Colors.white10.withOpacity(0.05)),
          color: const Color(0XFF091522).withOpacity(0.6),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(100),
              spreadRadius: 0.5,
              offset: Offset(2, -2), // changes position of shadow
            ),
          ],
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "About App",
                style: GoogleFonts.figtree(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.sp,
                    color: AppColors.cyanColor),
              ),
              SizedBox(
                height: 12.h,
              ),
              Text(
                  "Cosmics is a fun way of Exploring and Discovering the Solar System and Outer Space. Welcome to the Space Playground",
                  style: GoogleFonts.figtree(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                    color: Colors.white,
                  )),
          
            ],
          ),
        ),
      ),
    );
  }
}
