import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medicine_notifier/view/components/colors_constant.dart';
import 'package:medicine_notifier/view/components/custom_drawer.dart';
import 'package:medicine_notifier/view/screens/patient/add_medicine/medicine_screen.dart';

import 'package:medicine_notifier/view/screens/patient/profile_screen.dart';
import 'package:medicine_notifier/view/screens/patient/home_screen.dart';
import 'package:medicine_notifier/view/screens/patient/top_doctors.dart';
import 'package:sizer/sizer.dart';

class NavBarScreens extends StatefulWidget {
  const NavBarScreens({Key? key}) : super(key: key);

  @override
  State<NavBarScreens> createState() => _NavBarScreensState();
}

class _NavBarScreensState extends State<NavBarScreens> {
  int _currentPageIndex = 0;
  PageController _controller = PageController();

  List<Widget> _items = [
    SvgPicture.asset(
      'assets/home_nav.svg',
      height: 3.h,
      color: Colors.white,
    ),
    SvgPicture.asset(
      'assets/top_doctor.svg',
      height: 4.h,
      color: Colors.white,
    ),
    Icon(Icons.medical_services_outlined),
    Icon(Icons.person)
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          drawer: CustomDrawer(),
          appBar: AppBar(
            actions: [
              IconButton(onPressed: () {}, icon: Icon(Icons.notifications))
            ],
            centerTitle: true,
            title: Text(_currentPageIndex == 0
                ? 'Home'
                : _currentPageIndex == 1
                    ? 'Top Doctors'
                    : _currentPageIndex == 2
                        ? '"Schedule A Medicines'
                        : 'Profile'),
            bottom: _currentPageIndex == 0
                ? search(size)
                : PreferredSize(
                    preferredSize: Size(0, 0),
                    child: SizedBox(),
                  ),
          ),
          body: PageView.builder(
            controller: _controller,
            physics: NeverScrollableScrollPhysics(),
            onPageChanged: (pageIndex) {
              setState(() {
                _currentPageIndex = pageIndex;
              });
            },
            itemBuilder: (conext, index) => _currentPageIndex == 0
                ? ProgressScreen()
                : _currentPageIndex == 1
                    ? TopDoctors()
                    : _currentPageIndex == 2
                        ? MedicineScreen()
                        : ProfileScreen(),
          ),
          bottomNavigationBar: Theme(
            data: Theme.of(context)
                .copyWith(iconTheme: IconThemeData(color: Colors.white)),
            child: CurvedNavigationBar(
              index: _currentPageIndex,
              color: kPrimaryColor,
              animationCurve: Curves.easeIn,
              buttonBackgroundColor: kPrimaryColor,
              height: 8.h,
              backgroundColor: Colors.transparent,
              items: _items,
              onTap: (index) => setState(() {
                _currentPageIndex = index;
                print('curved Bar Index $_currentPageIndex');
              }),
            ),
          )
          // BottomNavigationBar(
          //     onTap: (index) {
          //       setState(() {
          //         _currentPageIndex = index;
          //         print('Page index  : $index');
          //       });
          //       _controller.jumpToPage(_currentPageIndex);
          //     },
          //     selectedItemColor: Colors.amber.shade900,
          //     elevation: 0,
          //     type: BottomNavigationBarType.shifting,
          //     unselectedItemColor: Colors.black54,
          //     currentIndex: _currentPageIndex,
          //     items: [
          //       BottomNavigationBarItem(
          //           title: Text('Progress'), icon: Icon(Icons.bar_chart)),
          //       BottomNavigationBarItem(
          //           title: Text('Add Medicine'), icon: Icon(Icons.medication))
          //     ]),
          ),
    );
  }

  PreferredSize search(Size size) {
    return PreferredSize(
      preferredSize: Size(size.width, size.height * 0.17),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.height * 0.02),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: 'Find your desired',
                      style: TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 18.sp)),
                  TextSpan(
                      text: '\nDoctor Right Now!',
                      style: TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 23.sp)),
                ])),
                Container(
                    margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
                    padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.02,
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(7.sp)),
                    height: size.height * 0.06,
                    width: size.width * 0.9,
                    child: TextField(
                        cursorColor: Colors.black,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                            alignLabelWithHint: true,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.02, vertical: 1.h),
                            hintText: 'Search',
                            hintStyle: TextStyle(color: Colors.grey),
                            prefix: Icon(
                              Icons.search,
                              color: Colors.grey,
                            ),
                            fillColor: Colors.white,
                            border: InputBorder.none)))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
