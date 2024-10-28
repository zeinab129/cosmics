import 'package:cosmics/core/firebase/firebase_functions.dart';
import 'package:cosmics/core/provider/my_provider.dart';
import 'package:cosmics/view/screens/home_screen.dart';
import 'package:cosmics/view/screens/signup_screen.dart';
import 'package:cosmics/view/widgets/widgets/custom_tf.dart';
import 'package:cosmics/view/widgets/widgets/social_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SigninScreen extends StatefulWidget {
  SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();

  TextEditingController passController = TextEditingController();

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                height: 84.h,
              ),
              Image.asset("assets/images/logo.png"),
              SizedBox(
                height: 64.h,
              ),
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
                        right: BorderSide(width: 1, color: Colors.white10),
                        left: BorderSide(width: 1, color: Colors.white10),
                        top: BorderSide(width: 1, color: Colors.white10))),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "SignIn",
                        style: GoogleFonts.figtree(
                            fontSize: 32.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      SizedBox(
                        height: 24.h,
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
                        height: 24.h,
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
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            "Forgot Password?",
                            style: GoogleFonts.montserrat(
                                fontSize: 14.sp,
                                color: const Color(0XFF11DCE8)),
                          )),
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
                                setState(() {
                                  isLoading = true;
                                });
                                _formKey.currentState!.save();
                                FirebaseFunctions.login(
                                    email: emailController.text,
                                    password: passController.text,
                                    onSuccess: () async {
                                      await provider.initUser();
                                      setState(() {
                                        isLoading = false;
                                      });
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => HomeScreen(),
                                          ));
                                    },
                                    onError: (errorMessage) {
                                      setState(() {
                                        isLoading = false;
                                      });
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
                                    color: Colors.white,
                                  ),
                                )
                              : Text(
                                  "Sign In",
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
                              "or sign in using",
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
                            "Don't have an account?",
                            style: GoogleFonts.figtree(
                              color: const Color(0XFF8D8E99),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SignupScreen(),
                                  ));
                            },
                            child: Text("SignUp",
                                style: GoogleFonts.figtree(
                                  color: const Color(0XFF11DCE8),
                                )),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
