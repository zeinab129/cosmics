import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBarBtn extends StatelessWidget {
  Widget icon;
  Function onTab;
  AppBarBtn({super.key, required this.icon, required this.onTab});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 48.w,
        height: 48.h,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
                width: 2.r,
                color: Colors.black.withOpacity(0.5)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 0.5,
                offset: Offset(2, -2), // changes position of shadow
              )
            ]),
        child: IconButton(
          onPressed: () {
            onTab();
          },
          icon: icon,
        ));
  }
}
