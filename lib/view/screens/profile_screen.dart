import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cosmics/core/firebase/firebase_functions.dart';
import 'package:cosmics/core/provider/my_provider.dart';
import 'package:cosmics/core/utils/app_colors.dart';
import 'package:cosmics/view/widgets/widgets/appbar_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_circular_progress_indicator/gradient_circular_progress_indicator.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {



  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    nameController.text = provider.userModel!.name;
    titleController.text = provider.userModel!.title;
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/ic_bg1.png"),
                  fit: BoxFit.fill)),
        ),
        Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: Colors.transparent,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(100.h),
            child: Container(
              padding: EdgeInsets.only(left: 24.w, right: 24.w, bottom: 18.h),
              alignment: Alignment.bottomLeft,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: AppColors.bgColor.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(32.r),
                  border: Border.all(
                      width: 2.r, color: Colors.black.withOpacity(0.3))),
              child: Row(
                children: [
                  AppBarBtn(
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 24.r,
                      ),
                      onTab: () {
                        Navigator.pop(context);
                      }),
                  Expanded(
                      child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("My Profile",
                          style: GoogleFonts.figtree(
                              fontSize: 24.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.bold))
                    ],
                  )),
                ],
              ),
            ),
          ),
          body: Container(
            width: double.infinity,
            height: double.infinity,
            margin: EdgeInsets.only(top: 24.h, right: 24.w, left: 24.w),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16.r),
                    margin: EdgeInsets.only(bottom: 24.h),
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
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 42.r,
                          backgroundImage: provider.userModel?.imageUrl == ""
                              ? null
                              : NetworkImage(provider.userModel?.imageUrl ?? ""),
                          child: provider.userModel?.imageUrl == ""
                              ? Image.asset("assets/images/ic_astr.png")
                              : null,
                        ),
                        SizedBox(
                          width: 12.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              nameController.text,
                              style: GoogleFonts.figtree(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.sp,
                                  color: Colors.white),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            Text(titleController.text,
                                style: GoogleFonts.figtree(
                                  fontSize: 14.sp,
                                  color: Colors.white,
                                )),
                          ],
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.topRight,
                            child: IconButton(
                                onPressed: () {
                                  AwesomeDialog(
                                    dialogBackgroundColor: AppColors.bgColor,
                                    context: context,
                                    dialogType: DialogType.noHeader,
                                    keyboardAware: true,
                                    width: MediaQuery.of(context).size.width ,
                                    dismissOnTouchOutside: true,
                                    dismissOnBackKeyPress: false,
                                    onDismissCallback: (type) {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text('Dismissed by $type'),
                                        ),
                                      );
                                    },
                                    headerAnimationLoop: false,
                                    animType: AnimType.scale,
                                    title: 'Edit User info:',
                                    titleTextStyle: GoogleFonts.figtree(color: Colors.white),
                                    body: Padding(padding: EdgeInsets.all(8.r),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          child: TextFormField(
                                            controller: nameController,
                                            cursorColor: AppColors.cyanColor,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(32.r),
                                                borderSide: BorderSide(color: AppColors.cyanColor),
                                              ),
                                              filled: true,
                                              fillColor: Colors.white
                                            ),
                                            style: GoogleFonts.figtree(color: AppColors.bgColor),
                                            onChanged: (value) {
                                              nameController.text = value;
                                            },
                                            maxLines: 1,
                                          ),
                                        ),
                                        SizedBox(height: 8.h,),
                                        SizedBox(
                                          child: TextFormField(
                                            controller: titleController,
                                            cursorColor: AppColors.cyanColor,
                                            decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(32.r),
                                                    borderSide: BorderSide(color: AppColors.cyanColor)
                                                ),
                                                filled: true,
                                                fillColor: Colors.white
                                            ),
                                            style: GoogleFonts.figtree(color: AppColors.bgColor),
                                            onChanged: (value) {
                                              titleController.text = value;
                                            },
                                            maxLines: 1,
                                          ),
                                        ),
                                      ],
                                    ),),

                                    btnCancelOnPress: () {
                                    },
                                    btnOkOnPress: () {
                                      provider.userModel!.name = nameController.text;
                                      provider.userModel!.title = titleController.text;
                                      FirebaseFunctions.updateUser(provider.userModel!.uid,
                                          "name", provider.userModel!.name);
                                      FirebaseFunctions.updateUser(provider.userModel!.uid,
                                          "title", provider.userModel!.title);
                                      setState(() {

                                      });
                                    },
                                  ).show();
                                },
                                icon: Image.asset(
                                  "assets/images/ic_edit.png",
                                  width: 24.w,
                                  height: 24.h,
                                )),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(vertical: 24.h, horizontal: 32.w),
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Progress",
                          style: GoogleFonts.figtree(
                              fontSize: 32.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        SizedBox(
                          height: 32.h,
                        ),
                        Center(
                          child: GradientCircularProgressIndicator(
                            size: MediaQuery.of(context).size.width * 0.6,
                            stroke: 16.r,
                            progress: double.parse((provider.userModel!.progress)
                                .toStringAsFixed(2)),
                            // Specify the progress value between 0 and 1
                            gradient: const LinearGradient(
                              colors: [
                                Color(0XFF00E5E5),
                                Color(0XFF72A5F2),
                                Color(0XFFE961FF)
                              ],
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                            ),
                            backgroundColor: Colors.grey.withOpacity(0.3),
                            // Specify the background color
                            child: Center(
                                child: Text(
                              "${(provider.userModel!.progress * 100)}%",
                              style: GoogleFonts.figtree(
                                  fontSize: 52.sp,
                                  color: Color(0XFF859AF4),
                                  fontWeight: FontWeight.bold),
                            )), // Optional child widget
                          ),
                        ),
                        SizedBox(
                          height: 32.h,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
