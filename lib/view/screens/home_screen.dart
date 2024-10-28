
import 'package:cosmics/core/utils/app_colors.dart';
import 'package:cosmics/view/screens/profile_screen.dart';
import 'package:cosmics/view/screens/tabs/fav_tab.dart';
import 'package:cosmics/view/screens/tabs/home_tab.dart';
import 'package:cosmics/view/screens/tabs/more_tab.dart';
import 'package:cosmics/view/widgets/widgets/appbar_btn.dart';
import 'package:cosmics/view/widgets/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;
  bool isDrawerOpen = false;
  final GlobalKey<ScaffoldState> _key = GlobalKey();


  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
          drawerEnableOpenDragGesture: false,
          key: _key,
          backgroundColor: Colors.transparent,
          drawer: SizedBox(
            width: MediaQuery.of(context).size.width * 0.7,
              child: CustomDrawer()),
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(85.h),
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
                      Icons.menu,
                      color: Colors.white,
                      size: 24.r,
                    ),
                    onTab: () => _key.currentState!.openDrawer(),
                  ),
                  Expanded(
                      child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        index == 0 ? "Milky Way" : "",
                        style: GoogleFonts.figtree(
                            fontSize: 10.sp, color: AppColors.greyColor),
                      ),
                      Text(
                          index == 0
                              ? "Solar System"
                              : index == 1
                                  ? "Favorites"
                                  : "More",
                          style: GoogleFonts.figtree(
                              fontSize: 24.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.bold))
                    ],
                  )),
                  AppBarBtn(
                    icon: Image.asset(
                      "assets/images/ic_profile.png",
                      width: 24.w,
                      height: 24.h,
                    ),
                    onTab: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfileScreen(),
                          ));
                    },
                  )
                ],
              ),
            ),
          ),
          body: tabs[index],
          bottomNavigationBar: Container(
            height: 70.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(32.r),
                    topLeft: Radius.circular(32.r)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 1,
                    offset: Offset(0, -2), // changes position of shadow
                  )
                ]),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32.r),
                topRight: Radius.circular(32.r),
              ),
              child: BottomNavigationBar(
                backgroundColor: AppColors.bgColor.withOpacity(0.6),
                unselectedItemColor: Colors.white,
                selectedItemColor: AppColors.cyanColor,
                currentIndex: index,
                onTap: (value) {
                  setState(() {
                    index = value;
                  });
                },
                items: [
                  BottomNavigationBarItem(
                      label: "Home",
                      icon: Image.asset(
                        "assets/images/ic_home.png",
                        width: 24.w,
                        height: 24.h,
                        color: index == 0 ? AppColors.cyanColor : Colors.white,
                      )),
                  BottomNavigationBarItem(
                      label: "Favorites",
                      icon: Image.asset(
                        "assets/images/ic_favor.png",
                        width: 24.w,
                        height: 24.h,
                        color: index == 1 ? AppColors.cyanColor : Colors.white,
                      )),
                  BottomNavigationBarItem(
                      label: "More",
                      icon: Image.asset("assets/images/ic_more.png",
                          width: 24.w,
                          height: 24.h,
                          color:
                              index == 2 ? AppColors.cyanColor : Colors.white)),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  List<Widget> tabs = [HomeTab(), FavTab(), MoreTab()];
}
