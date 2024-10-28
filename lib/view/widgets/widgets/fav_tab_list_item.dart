
import 'package:cosmics/core/firebase/firebase_functions.dart';
import 'package:cosmics/core/provider/my_provider.dart';
import 'package:cosmics/core/utils/plants_lists.dart';
import 'package:cosmics/view/screens/planet_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FavTabListItem extends StatefulWidget {
  int index;
  bool isFav = true;
  FavTabListItem({super.key, required this.index, required this.isFav});

  @override
  State<FavTabListItem> createState() => _FavTabListItemState();
}

class _FavTabListItemState extends State<FavTabListItem> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.r),
      margin: EdgeInsets.only(bottom: 24.h),
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
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                "assets/images/planets/${PlanetsLists.planetsImage[widget.index]}.png",
                width: 60.w,
                height: 60.h,
              ),
              SizedBox(
                width: 8.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    PlanetsLists.planetsName[widget.index],
                    style: GoogleFonts.figtree(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp,
                        color: const Color(0XFF11DCE8)),
                  ),
                  SizedBox(
                    width: 180.w,
                    child: Text(PlanetsLists.planetsInfo[widget.index],
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.figtree(
                          fontWeight: FontWeight.bold,
                          fontSize: 12.sp,
                          color: Colors.white,
                        )),
                  ),


                ],
              ),
              IconButton(
                  onPressed: () async {
                    if (provider.userModel!.favPlanets
                        .contains(widget.index)) {
                      provider.userModel!.favPlanets.remove(widget.index);
                      FirebaseFunctions.updateUser(provider.userModel!.uid,
                          "favPlanets", provider.userModel!.favPlanets);
                      await provider.initUser();
                      setState(() {
                        widget.isFav = false;
                      });
                    } else {
                      provider.userModel!.favPlanets.add(widget.index);
                      FirebaseFunctions.updateUser(provider.userModel!.uid,
                          "favPlanets", provider.userModel!.favPlanets);
                      await provider.initUser();
                      setState(() {
                        widget.isFav = true;
                      });
                    }
                  },
                  icon: Icon(
                    widget.isFav
                        ? Icons.favorite
                        : Icons.favorite_border_sharp,
                    color: Colors.white,
                    size: 24.r,
                  ))
            ],
          ),
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Details",
                  style: GoogleFonts.figtree(
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp,
                      color: Colors.white),
                ),
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PlanetDetailsScreen(
                                index: widget.index,
                                name: PlanetsLists.planetsName[widget.index],
                                isFav: provider.userModel!.favPlanets.contains(widget.index)),
                          ));
                    },
                    icon: Icon(
                      Icons.arrow_right_alt_rounded,
                      color: Color(0XFF11DCE8),
                      size: 28.r,
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
