import 'package:cosmics/core/provider/my_provider.dart';
import 'package:cosmics/core/utils/plants_lists.dart';
import 'package:cosmics/view/widgets/widgets/fav_tab_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FavTab extends StatelessWidget {
  const FavTab({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.only(top: 24.h, left: 24.w, right: 24.w),
        child: provider.userModel!.favPlanets.isEmpty
            ? Center(
                child: Text(
                  "Like planets\nto add to your favorite!",
                  style: GoogleFonts.figtree(
                      color: Colors.white,
                      fontSize: 16.sp,), textAlign: TextAlign.center,
                ),
              )
            : ListView.builder(
                itemBuilder: (context, index) {
                  return FavTabListItem(
                    index: provider.userModel!.favPlanets[index],
                    isFav: provider.userModel!.favPlanets
                        .contains(provider.userModel!.favPlanets[index]),
                  );
                },
                itemCount: provider.userModel!.favPlanets.length,
              ),
      ),
    );
  }
}
