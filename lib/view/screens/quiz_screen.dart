import 'package:cosmics/core/firebase/firebase_functions.dart';
import 'package:cosmics/core/provider/my_provider.dart';
import 'package:cosmics/core/utils/app_colors.dart';
import 'package:cosmics/core/utils/plants_lists.dart';
import 'package:cosmics/view/widgets/widgets/appbar_btn.dart';
import 'package:cosmics/view/widgets/widgets/question_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_circular_progress_indicator/gradient_circular_progress_indicator.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/quickalert.dart';

class QuizScreen extends StatefulWidget {
  String name;
  int index;

  QuizScreen({super.key, required this.index, required this.name});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int sum = 0;
  bool isSubmitted = false;

  @override
  void initState() {
    sum = 0;
    isSubmitted = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
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
                      Text(widget.name,
                          style: GoogleFonts.figtree(
                              fontSize: 24.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                      Text(
                        "Quiz",
                        style: GoogleFonts.figtree(
                            fontSize: 14.sp, color: AppColors.greyColor),
                      )
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
                        Image.asset(
                          "assets/images/planets/${PlanetsLists.planetsImage[widget.index]}.png",
                          width: 64.w,
                          height: 64.h,
                        ),
                        SizedBox(
                          width: 12.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Last Result",
                              style: GoogleFonts.figtree(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.sp,
                                  color: Colors.white),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            Text(provider.userModel?.title ?? "title",
                                style: GoogleFonts.figtree(
                                  fontSize: 14.sp,
                                  color: Colors.white,
                                )),
                          ],
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.topRight,
                            child: GradientCircularProgressIndicator(
                              size: 42.r,
                              stroke: 5.r,
                              progress: provider
                                  .userModel!.quizProgress[widget.index],
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
                                "${double.parse((provider.userModel!.quizProgress[widget.index]).toStringAsFixed(2)) * 100}%",
                                style: GoogleFonts.figtree(
                                    fontSize: 8.sp,
                                    color: Color(0XFF859AF4),
                                    fontWeight: FontWeight.bold),
                              )), // Optional child widget
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  for (int i = 0;
                      i < PlanetsLists.questions[widget.index].length;
                      i++)
                    QuestionItem(
                        questionModel: PlanetsLists.questions[widget.index][i],
                        isSubmitted: isSubmitted),
                  SizedBox(
                    height: 12.h,
                  ),
                  GestureDetector(
                    onTap: isSubmitted? null:() async {
                      for (int i = 0;
                          i < PlanetsLists.questions[widget.index].length;
                          i++) {
                        if (PlanetsLists
                                .questions[widget.index][i].selectedChoice ==
                            PlanetsLists
                                .questions[widget.index][i].trueChoice) {
                          sum++;
                        }
                        provider.userModel!.quizProgress[widget.index] =
                            double.parse((sum /
                                    PlanetsLists.questions[widget.index].length)
                                .toStringAsFixed(2));
                        FirebaseFunctions.updateUser(provider.userModel!.uid,
                            "qiuzProgress", provider.userModel!.quizProgress);
                        double progressSum = 0;
                        for (int j = 0;
                            j < provider.userModel!.quizProgress.length;
                            j++) {
                          progressSum += provider.userModel!.quizProgress[j];
                        }
                        provider.userModel!.progress = double.parse(
                            (progressSum /
                                    provider.userModel!.quizProgress.length)
                                .toStringAsFixed(2));
                        FirebaseFunctions.updateUser(provider.userModel!.uid,
                            "progress", provider.userModel!.progress);
                        await provider.initUser();
                      }
                      setState(() {
                        isSubmitted = true;
                      });
                      sum ==  PlanetsLists.questions[widget.index].length?
                      QuickAlert.show(
                        context: context,
                        type: QuickAlertType.success,
                        text: 'Well done! You got it.',
                      ):
                      QuickAlert.show(
                        context: context,
                        type: QuickAlertType.error,
                        title: 'Oops...',
                        text: 'You got $sum from ${PlanetsLists.questions[widget.index].length} answers.',
                      );
                    },
                    child: Container(
                      width: 160.w,
                      height: 45.h,
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
                      child: Text(
                        "Submit",
                        style: GoogleFonts.figtree(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 24.h,
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
