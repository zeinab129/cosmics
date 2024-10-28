import 'dart:io';

import 'package:cosmics/core/firebase/firebase_functions.dart';
import 'package:cosmics/core/provider/my_provider.dart';
import 'package:cosmics/core/utils/app_colors.dart';
import 'package:cosmics/view/screens/home_screen.dart';
import 'package:cosmics/view/widgets/widgets/custom_tf.dart';
import 'package:cosmics/view/widgets/widgets/social_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatefulWidget {
  SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();

  TextEditingController passController = TextEditingController();

  TextEditingController nameController = TextEditingController();

  TextEditingController titleController = TextEditingController();

  String imagePath = "";

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/ic_bg1.png"),
                fit: BoxFit.fill)),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  height: 84.h,
                ),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                          top: 24.h, bottom: 32.h, left: 24.w, right: 24.w),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: const Color(0XFF091522).withOpacity(0.6),
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(28),
                              topLeft: Radius.circular(28)),
                          border: const Border(
                              right:
                                  BorderSide(width: 1, color: Colors.white10),
                              left: BorderSide(width: 1, color: Colors.white10),
                              top:
                                  BorderSide(width: 1, color: Colors.white10))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 42.h,
                          ),
                          Text(
                            "Sign Up",
                            style: GoogleFonts.figtree(
                                fontSize: 32.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          SizedBox(
                            height: 18.h,
                          ),
                          CustomTF(
                            hint: "Name",
                            isPass: false,
                            validate: (value) {
                              if (value!.isEmpty || value.length < 4) {
                                return 'Enter a valid name!';
                              }
                              return null;
                            },
                            controller: nameController,
                          ),
                          SizedBox(
                            height: 18.h,
                          ),
                          CustomTF(
                            hint: "Title",
                            isPass: false,
                            validate: (value) {
                              if (value!.isEmpty || value.length < 4) {
                                return 'Enter a valid title!';
                              }
                              return null;
                            },
                            controller: titleController,
                          ),
                          SizedBox(
                            height: 18.h,
                          ),
                          CustomTF(
                            hint: "E-mail",
                            isPass: false,
                            validate: (value) {
                              if (value!.isEmpty ||
                                  !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                      .hasMatch(value)) {
                                return 'Enter a valid email!';
                              }
                              return null;
                            },
                            controller: emailController,
                          ),
                          SizedBox(
                            height: 18.h,
                          ),
                          CustomTF(
                            hint: "Password",
                            isPass: true,
                            validate: (value) {
                              if (value!.isEmpty || value.length < 4) {
                                return 'Enter a valid password!';
                              }
                              return null;
                            },
                            controller: passController,
                          ),
                          SizedBox(
                            height: 24.h,
                          ),
                          GestureDetector(
                            onTap: isLoading
                                ? null
                                : () {
                                    final isValid =
                                        _formKey.currentState!.validate();
                                    if (!isValid) {
                                      return;
                                    }
                                    _formKey.currentState!.save();
                                    setState(() {
                                      isLoading = true;
                                    });
                                    FirebaseFunctions.createUserAccount(
                                        email: emailController.text,
                                        password: passController.text,
                                        name: nameController.text,
                                        title: titleController.text,
                                        imagePath: imagePath,
                                        progress: 0.0,
                                        onSuccess: () async {
                                          await provider.initUser();
                                          setState(() {
                                            isLoading = false;
                                          });
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    HomeScreen(),
                                              ));
                                        },
                                        onError: (String errorMessage) {
                                          isLoading = false;
                                          showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                title: const Text('Error'),
                                                content: Text(errorMessage),
                                                actions: [
                                                  ElevatedButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: const Text('OK'))
                                                ],
                                              );
                                            },
                                          );
                                        });
                                  },
                            child: Container(
                              width: double.infinity,
                              height: 55.h,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(44),
                                gradient: const LinearGradient(
                                    colors: [
                                      Color(0XFFE961FF),
                                      Color(0XFF72A5F2),
                                      Color(0XFF00E5E5),
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight),
                              ),
                              child: isLoading
                                  ? const Center(
                                      child: CircularProgressIndicator(
                                          color: Colors.white),
                                    )
                                  : Text(
                                      "Sign Up",
                                      style: GoogleFonts.figtree(
                                          fontSize: 24.sp,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                            ),
                          ),
                          SizedBox(
                            height: 24.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Expanded(
                                child: Divider(
                                  thickness: 0.3,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.w),
                                child: Text(
                                  "or sign up using",
                                  style: GoogleFonts.figtree(
                                      fontSize: 16.sp,
                                      color: const Color(0XFF8D8E99)),
                                ),
                              ),
                              const Expanded(
                                child: Divider(
                                  thickness: 0.3,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 24.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SocialBtn(image: "twit", function: () {}),
                              SizedBox(
                                width: 12.w,
                              ),
                              SocialBtn(
                                image: "fb",
                                function: () {},
                              ),
                              SizedBox(
                                width: 12.w,
                              ),
                              SocialBtn(
                                image: "google",
                                function: () {},
                              )
                            ],
                          ),
                          SizedBox(height: 24.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Already have an account?",
                                style: GoogleFonts.figtree(
                                  color: const Color(0XFF8D8E99),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Text("SignIn",
                                    style: GoogleFonts.figtree(
                                      color: const Color(0XFF11DCE8),
                                    )),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      top: -62.h,
                      left: 120,
                      right: 120,
                      child: Stack(
                        children: [
                          CircleAvatar(
                            radius: 64,
                            backgroundImage: imagePath == ""
                                ? null
                                : FileImage(
                                    File(imagePath.toString()),
                                  ),
                            child: imagePath == ""
                                ? Image.asset("assets/images/ic_astr.png")
                                : null,
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      width: 2, color: Colors.transparent)),
                              child: IconButton(
                                  onPressed: () {
                                    selectImage();
                                    setState(() {});
                                  },
                                  icon: Icon(
                                    Icons.change_circle_rounded,
                                    color: AppColors.cyanColor,
                                    size: 42.r,
                                  )),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future selectImage() {
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28.r),
          ),
          backgroundColor: AppColors.bgColor,
          child: Container(
            height: 160.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        GestureDetector(
                            onTap: () async {
                              imagePath = await selectImageFromGallery();
                              if (imagePath != '' && imagePath != null) {
                                Navigator.pop(context);
                                setState(() {});
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text("No image selected!")));
                              }
                              print(imagePath);
                            },
                            child: Image.asset(
                              "assets/images/ic_gallery.png",
                              width: 64.w,
                              height: 64.h,
                            )),
                        Text(
                          "Gallery",
                          style: GoogleFonts.figtree(
                            color: Colors.white,
                            fontSize: 16.sp,
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        GestureDetector(
                            onTap: () async {
                              imagePath = await selectImageFromCamera();
                              if (imagePath != '') {
                                Navigator.pop(context);
                                setState(() {});
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text("No image selected!")));
                              }
                            },
                            child: Image.asset(
                              "assets/images/ic_camera.png",
                              width: 64.w,
                              height: 64.h,
                            )),
                        Text(
                          "Camera",
                          style: GoogleFonts.figtree(
                            color: Colors.white,
                            fontSize: 16.sp,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<String> selectImageFromGallery() async {
    final file = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (file != null) {
      return file.path;
    } else {
      return '';
    }
  }

  Future<String> selectImageFromCamera() async {
    final file = await ImagePicker().pickImage(source: ImageSource.camera);
    if (file != null) {
      return file.path;
    } else {
      return '';
    }
  }
}
