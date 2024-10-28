import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SocialBtn extends StatelessWidget {
  String image;
  Function function;
  SocialBtn({super.key, required this.image, required this.function});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: function(),
      child: Container(
        width: 52.w,
        height: 52.h,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 2, color: Colors.black)
        ),
        child: Image.asset("assets/images/ic_$image.png"),
      ),
    );
  }
}
