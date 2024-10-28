import 'package:cosmics/core/model/question_model.dart';
import 'package:cosmics/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionItem extends StatefulWidget {
  QuestionModel questionModel;
  bool isSubmitted;

  QuestionItem(
      {super.key, required this.questionModel, required this.isSubmitted});

  @override
  State<QuestionItem> createState() => _QuestionItemState();
}

class _QuestionItemState extends State<QuestionItem> {
  int _value = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 32.w),
      margin: EdgeInsets.only(bottom: 12.h),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.questionModel.question,
            style: GoogleFonts.figtree(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
          SizedBox(
            height: 32.h,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              for (int i = 1; i <= 3; i++)
                ListTile(
                  title: Text(
                    widget.questionModel.choices[i - 1],
                    style: GoogleFonts.figtree(
                        color:
                            i == _value ?
                            widget.isSubmitted
                                ? _value == widget.questionModel.trueChoice
                                ? Colors.green
                                : Colors.red:
                            AppColors.cyanColor : Colors.white),
                  ),
                  leading: Radio(
                    value: i,
                    groupValue: _value,
                    activeColor: widget.isSubmitted
                        ? _value == widget.questionModel.trueChoice
                            ? Colors.green
                            : Colors.red
                        : AppColors.cyanColor,
                    onChanged: widget.isSubmitted
                        ? (value) {}
                        : (value) {
                            setState(() {
                              _value = int.parse(value.toString());
                              widget.questionModel.selectedChoice = _value;
                            });
                          },
                  ),
                ),
            ],
          )
        ],
      ),
    );
  }
}
