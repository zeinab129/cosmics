import 'package:cosmics/core/firebase/firebase_functions.dart';
import 'package:cosmics/core/provider/my_provider.dart';
import 'package:cosmics/core/utils/app_colors.dart';
import 'package:cosmics/core/utils/plants_lists.dart';
import 'package:cosmics/view/screens/quiz_screen.dart';
import 'package:cosmics/view/widgets/widgets/appbar_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PlanetInfoScreen extends StatefulWidget {
  bool isFav = false;
  String name;
  int index;

  PlanetInfoScreen(
      {super.key,
      required this.isFav,
      required this.index,
      required this.name});

  @override
  State<PlanetInfoScreen> createState() => _PlanetInfoScreenState();
}

class _PlanetInfoScreenState extends State<PlanetInfoScreen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                "assets/images/planets_bg/ic_bg_${widget.name.toLowerCase()}.png",
              ),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 32.h, left: 24.w, right: 24.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 24.r,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsetsDirectional.symmetric(horizontal: 24.w),
                padding: EdgeInsets.only(
                    top: 18.h, bottom: 8.h, left: 24.w, right: 24.w),
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
                      "About Planet",
                      style: GoogleFonts.figtree(
                          fontWeight: FontWeight.bold,
                          fontSize: 22.sp,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          "assets/images/planets/${PlanetsLists.planetsImage[widget.index]}.png",
                          width: 64.w,
                          height: 64.h,
                        ),
                        SizedBox(
                          width: 12.w,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                PlanetsLists.planetsName[widget.index],
                                style: GoogleFonts.figtree(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.sp,
                                    color: AppColors.cyanColor),
                              ),
                              SizedBox(
                                width: 200.w,
                                child:
                                    Text(PlanetsLists.planetsInfo[widget.index],
                                        style: GoogleFonts.figtree(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.sp,
                                          color: Colors.white,
                                        )),
                              ),
                              Align(
                                alignment: AlignmentDirectional.centerEnd,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      "Quiz",
                                      style: GoogleFonts.figtree(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14.sp,
                                          color: Colors.white),
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          Navigator.push(context,
                                              MaterialPageRoute(
                                            builder: (context) {
                                              return QuizScreen(
                                                  index: widget.index,
                                                  name: widget.name);
                                            },
                                          ));
                                        },
                                        icon: Icon(
                                          Icons.arrow_right_alt_rounded,
                                          color: AppColors.cyanColor,
                                          size: 28.r,
                                        ))
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 12.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
