import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class PlanetListItem extends StatelessWidget {
  String name;
  String image;
  bool isLast = false;
  bool isFirst = false;
  Function function;
  int index = 0;
  PlanetListItem({super.key, required this.name, required this.image, required this.isLast, required this.isFirst, required this.function, required this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        function(index);
      },
      child: Container(
        margin: EdgeInsetsDirectional.only(start: isFirst? 24.w: 12.w, top: 4.h, bottom: 4.h, end: isLast? 24.w: 0.w),
        padding:
            EdgeInsets.only(top: 12.h, bottom: 12.h, left: 14.w, right: 14.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32.r),
          border: Border.all(width: 0.5, color: Colors.white10.withOpacity(0.05)),
          color: const Color(0XFF091522).withOpacity(0.6),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(100),
              spreadRadius: 0.5,
              offset: Offset(2, -2), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              "assets/images/planets/$image.png",
              width: 32.w,
              height: 32.h,
            ),
            Text(
              "$name",
              style: GoogleFonts.figtree(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp,
                  color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
