import 'package:cosmics/core/firebase/firebase_functions.dart';
import 'package:cosmics/core/provider/my_provider.dart';
import 'package:cosmics/core/utils/plants_lists.dart';
import 'package:cosmics/view/screens/planet_info_screen.dart';
import 'package:cosmics/view/widgets/widgets/appbar_btn.dart';
import 'package:cosmics/view/widgets/widgets/info_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PlanetDetailsScreen extends StatefulWidget {
  String name;
  int index;
  bool isFav = false;

  PlanetDetailsScreen(
      {super.key,
      required this.index,
      required this.name,
      required this.isFav});

  @override
  State<PlanetDetailsScreen> createState() => _PlanetDetailsScreenState();
}

class _PlanetDetailsScreenState extends State<PlanetDetailsScreen> {
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
          body: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 64.h, left: 24.w, right: 24.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppBarBtn(
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 24.r,
                      ),
                      onTab: () {
                        Navigator.pop(context);
                      },
                    ),
                    AppBarBtn(
                      icon: Icon(
                        widget.isFav
                            ? Icons.favorite
                            : Icons.favorite_border_sharp,
                        color: Colors.white,
                        size: 24.r,
                      ),
                      onTab: () async {
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
                    ),
                  ],
                ),
              ),
              Spacer(),
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
                            right: BorderSide(width: 1, color: Colors.white10),
                            left: BorderSide(width: 1, color: Colors.white10),
                            top: BorderSide(width: 1, color: Colors.white10))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 48.h,
                        ),
                        Text(
                          widget.name,
                          style: GoogleFonts.figtree(
                              fontSize: 32.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InfoItem(
                                icon: "mass",
                                title: "Mass",
                                subTitle:
                                    "(10(${PlanetsLists.planetsMassPower[widget.index]})kg)",
                                info: PlanetsLists.planetsMass[widget.index]),
                            InfoItem(
                                icon: "grav",
                                title: "Gravity",
                                subTitle: "(m/s2)",
                                info: PlanetsLists.planetsGrav[widget.index]),
                            InfoItem(
                                icon: "day",
                                title: "Day",
                                subTitle: "(hours)",
                                info: PlanetsLists.planetsDay[widget.index]),
                          ],
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InfoItem(
                                icon: "velo",
                                title: "Esc. Velocity",
                                subTitle: "(km/s)",
                                info: PlanetsLists.planetsVelo[widget.index]),
                            InfoItem(
                                icon: "temp",
                                title: "Mean",
                                subTitle: "Temp(C)",
                                info: PlanetsLists.planetsTemp[widget.index]),
                            InfoItem(
                                icon: "dis",
                                title: "Distance from",
                                subTitle:
                                    "Sun(10(${PlanetsLists.planetsDisPower[widget.index]})km)",
                                info: PlanetsLists.planetsDis[widget.index]),
                          ],
                        ),
                        SizedBox(
                          height: 32.h,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return PlanetInfoScreen(
                                    isFav: widget.isFav,
                                    index: widget.index,
                                    name: widget.name);
                              },
                            )).then((value) {
                              setState(() {});
                            });
                          },
                          child: Container(
                            width: 160.w,
                            height: 60.h,
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
                              "Visit",
                              style: GoogleFonts.figtree(
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                      top: -75.h,
                      left: 100,
                      right: 100,
                      child: Image.asset(
                        "assets/images/planets_gif/${widget.name.toLowerCase()}.gif",
                        width: 150.w,
                        height: 150.h,
                      )),
                ],
              )
            ],
          ),
        ));
  }
}
