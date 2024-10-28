import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTF extends StatefulWidget {
  String hint;
  bool isPass = false;
  String? Function(String?) validate;
  TextEditingController controller;

  CustomTF(
      {super.key, required this.hint, required this.isPass, required this.validate, required this.controller});

  @override
  State<CustomTF> createState() => _CustomTFState();
}

class _CustomTFState extends State<CustomTF> {
  bool isHid = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        controller: widget.controller,
        obscureText: widget.isPass ? isHid : false,
        style: GoogleFonts.figtree(fontSize: 18.sp, color: Colors.white),
        decoration: InputDecoration(
          fillColor: const Color(0XFF091522),
          filled: true,
          hintText: widget.hint,
          hintStyle:
          GoogleFonts.figtree(fontSize: 18.sp, color: Color(0XFF8D8E99)),
          suffixIcon: widget.isPass
              ? InkWell(
              onTap: () {
                setState(() {
                  isHid = !isHid;
                });
              },
              child: Icon(
                isHid ? Icons.visibility_rounded : Icons.visibility_off_rounded,
                color: Colors.white,
              ))
              : null,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(44.r),
              borderSide: const BorderSide(width: 1, color: Colors.white)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(44.r),
              borderSide: const BorderSide(width: 1, color: Colors.white)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(44.r),
              borderSide: const BorderSide(width: 0.5, color: Colors.white)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(44.r),
              borderSide: const BorderSide(width: 1, color: Colors.grey)),
        ),
        onFieldSubmitted: (value) {
          //Validator
        },
        validator: widget.validate,
      ),
    );
  }
}
