
import 'package:cosmics/core/provider/my_provider.dart';
import 'package:cosmics/core/utils/app_colors.dart';
import 'package:cosmics/core/utils/plants_lists.dart';
import 'package:cosmics/view/screens/planet_details_screen.dart';
import 'package:cosmics/view/widgets/widgets/planet_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int selectedPlanet = 0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 16.h,
              ),
              SizedBox(
                height: 60.h,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return PlanetListItem(
                      name: PlanetsLists.planetsName[index],
                      image: PlanetsLists.planetsImage[index],
                      isLast: index == PlanetsLists.planetsName.length - 1,
                      isFirst: index == 0,
                      index: index,
                      function: selectPlanet,
                    );
                  },
                  itemCount: PlanetsLists.planetsName.length,
                  scrollDirection: Axis.horizontal,
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
                          fontSize: 18.sp,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          "assets/images/planets/${PlanetsLists.planetsImage[selectedPlanet]}.png",
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
                                PlanetsLists.planetsName[selectedPlanet],
                                style: GoogleFonts.figtree(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.sp,
                                    color: AppColors.cyanColor),
                              ),
                              SizedBox(
                                width: 200.w,
                                child:
                                    Text(PlanetsLists.planetsInfo[selectedPlanet],
                                        maxLines: 6,
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.figtree(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12.sp,
                                          color: Colors.white,
                                        )),
                              ),
                              Align(
                                alignment: AlignmentDirectional.centerEnd,
                                child: Row(
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
                                                builder: (context) =>
                                                    PlanetDetailsScreen(
                                                        index: selectedPlanet, name: PlanetsLists.planetsName[selectedPlanet], isFav: provider.userModel!.favPlanets.contains(selectedPlanet)),
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
                height: 16.h,
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsetsDirectional.symmetric(horizontal: 24.w),
                padding: EdgeInsets.only(
                    top: 18.h, bottom: 18.h, left: 24.w, right: 24.w),
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
                      "Solar System",
                      style: GoogleFonts.figtree(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.sp,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Text(
                        "The solar system has one star, eight planets, five officially named dwarf planets, hundreds of moons, thousands of comets, and more than a million asteroids.\nOur solar system is located in the Milky Way, a barred spiral galaxy with two major arms, and two minor arms. Our Sun is in a small, partial arm of the Milky Way called the Orion Arm, or Orion Spur, between the Sagittarius and Perseus arms. Our solar system orbits the center of the galaxy at about 515,000 mph (828,000 kph). It takes about 230 million years to complete one orbit around the galactic center.\nWe call it the solar system because it is made up of our star, the Sun, and everything bound to it by gravity.",
                        maxLines: 8,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.figtree(
                          fontWeight: FontWeight.bold,
                          fontSize: 12.sp,
                          color: Colors.white,
                        )),
                    SizedBox(height: 8.h,),
                    Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: GestureDetector(
                        onTap:  () {
                          _showAlertDialog(context);
                        },
                        child: Text(
                          "Read More",
                          style: GoogleFonts.figtree(
                              fontWeight: FontWeight.bold,
                              fontSize: 12.sp,
                              color: AppColors.cyanColor),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 18.h,
              )
            ],
          ),
        ));
  }

  selectPlanet(int index) {
    selectedPlanet = index;
    setState(() {});
    print(selectedPlanet);
  }

  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,

      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "Solar System",
            style: GoogleFonts.figtree(
                fontWeight: FontWeight.bold,
                fontSize: 20.sp,
                color: Colors.white),
          ),
          backgroundColor:const Color(0XFF091522),
          shape: RoundedRectangleBorder(
            borderRadius:  BorderRadius.circular(32.r),
            side: BorderSide(color: Colors.white10.withOpacity(0.05), width: 0.5)
          ),
          content: Text(
              "The solar system has one star, eight planets, five officially named dwarf planets, hundreds of moons, thousands of comets, and more than a million asteroids.\nOur solar system is located in the Milky Way, a barred spiral galaxy with two major arms, and two minor arms. Our Sun is in a small, partial arm of the Milky Way called the Orion Arm, or Orion Spur, between the Sagittarius and Perseus arms. Our solar system orbits the center of the galaxy at about 515,000 mph (828,000 kph). It takes about 230 million years to complete one orbit around the galactic center.\nWe call it the solar system because it is made up of our star, the Sun, and everything bound to it by gravity.",
              style: GoogleFonts.figtree(
                fontSize: 14.sp,
                color: Colors.white,
              )),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK', style: GoogleFonts.figtree(
                  fontWeight: FontWeight.bold,
                  color: AppColors.cyanColor)),
            ),
          ],
        );
      },
    );
  }
}
