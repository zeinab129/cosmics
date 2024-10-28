import 'dart:developer';

import 'package:cosmics/core/firebase/firebase_functions.dart';
import 'package:cosmics/core/provider/my_provider.dart';
import 'package:cosmics/view/screens/signin_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/app_colors.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({super.key});

  // final List<IconData> icons = [
  //   CupertinoIcons.home,
  //   CupertinoIcons.person_fill,
  //   CupertinoIcons.settings,
  //   CupertinoIcons.info_circle_fill,
  // ];
  //
  // List<String> texts = ["Home", "Profile", "Settings", "Details"];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 90),
      color: AppColors.bgColor.withOpacity(0.8),
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: provider.userModel?.imageUrl == ""
                ? null
                : NetworkImage(provider.userModel?.imageUrl ?? ""),
            child: provider.userModel?.imageUrl == ""
                ? Image.asset("assets/images/ic_astr.png")
                : null,
          ),
          SizedBox(
            height: 8.h,
          ),
          Text(provider.userModel?.name ?? "",
              style: GoogleFonts.figtree(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 18.sp)),
          Text(
            provider.userModel?.title ?? "",
            style: GoogleFonts.figtree(
                fontWeight: FontWeight.bold,
                color: Colors.cyan,
                fontSize: 14.sp),
          ),
          // Container(
          //   margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
          //   width: double.infinity,
          //   height: 300,
          //   child: ListView.builder(
          //     itemCount: icons.length,
          //     itemBuilder: (context, index) {
          //       return InkWell(
          //         onTap: () {
          //           log("${texts[index]} Item tapped");
          //         },
          //         child: Container(
          //           margin: const EdgeInsets.all(3),
          //           child: ListTile(
          //             leading: Icon(
          //               icons[index],
          //               color: Colors.white,
          //               size: 30,
          //             ),
          //             title: Text(
          //               texts[index],
          //               style: TextStyle(color: Colors.white),
          //             ),
          //           ),
          //         ),
          //       );
          //     },
          //   ),
          // ),

          Expanded(
            child: Center(
              child: GestureDetector(
                onTap: () {
                  FirebaseFunctions.logOut();
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                    builder: (context) {
                      return SigninScreen();
                    },
                  ), (route) => false);
                },
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(44.r),
                    gradient: const LinearGradient(colors: [
                      Color(0XFFE961FF),
                      Color(0XFF72A5F2),
                      Color(0XFF00E5E5),
                    ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Sign Out ",
                        style: GoogleFonts.figtree(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Icon(
                        Icons.logout,
                        color: Colors.white,
                        size: 24.r,
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
