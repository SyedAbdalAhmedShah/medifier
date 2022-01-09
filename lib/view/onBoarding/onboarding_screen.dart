import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:medicine_notifier/view/onBoarding/choose_for_register.dart';
import 'package:medicine_notifier/view/onBoarding/slider_page.dart';
import 'package:medicine_notifier/view/page_animation/custom_page_route.dart';
import 'package:medicine_notifier/view/screens/patient/registration/patient_login.dart';
import 'package:sizer/sizer.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    int currentPage = 0;
    PageController controller = PageController();

    List<Widget> pages = [
      SliderPage(
        image: 'assets/1639328.svg',
      ),
      SliderPage(
        image: 'assets/1639328.svg',
      ),
      SliderPage(
        image: 'assets/1639328.svg',
      ),
    ];

    DotsDecorator dotsDecorator() {
      return DotsDecorator(
          color: Colors.grey,
          size: Size(10, 10),
          activeSize: Size(22, 10),
          activeShape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)));
    }

    navigation() {
      Navigator.of(context).pushReplacement(
        CustomPageRoute(
          child: ChooseForRegistration(),
        ),
      );
    }

    List<PageViewModel> _pages = [
      PageViewModel(
          decoration: PageDecoration(
              imagePadding: EdgeInsets.symmetric(vertical: 7.h),
              imageAlignment: Alignment.bottomCenter,
              imageFlex: 3),
          title: 'Thousands of doctors',
          body: '',
          image: SvgPicture.asset('assets/doctor1.svg')),
      PageViewModel(
          decoration: PageDecoration(
              imagePadding: EdgeInsets.symmetric(vertical: 7.h),
              imageAlignment: Alignment.bottomCenter,
              imageFlex: 3),
          title: 'Appointment with doctors',
          body: '',
          image: SvgPicture.asset('assets/doctor2.svg')),
      PageViewModel(
          decoration: PageDecoration(
              imagePadding: EdgeInsets.symmetric(vertical: 7.h),
              imageAlignment: Alignment.bottomCenter,
              imageFlex: 3),
          title: 'Chat with doctors',
          body: '',
          image: SvgPicture.asset(
            'assets/doctor3.svg',
          ))
    ];

    return SafeArea(
      child: Scaffold(
          body: IntroductionScreen(
        animationDuration: 500,
        done: Text('Finished'),
        skip: Text('Skip'),
        skipColor: Colors.blue,
        onSkip: () {
          navigation();
        },
        showSkipButton: true,
        dotsDecorator: dotsDecorator(),
        pages: _pages,
        next: Text('next'),
        onDone: () {
          navigation();
        },
        onChange: (index) {
          print('the index of the page is : $index');
        },
      )
          // Stack(
          // children: [
          //   PageView.builder(
          //       controller: controller,
          //       scrollDirection: Axis.horizontal,
          //       itemCount: pages.length,
          //       onPageChanged: (index) {
          //         setState(() {
          //           currentPage = index;
          //           print(currentPage);
          //         });
          //       },
          //       itemBuilder: (cont, index) {
          //         return pages[index];
          //       }),
          //   Column(
          //     mainAxisAlignment: MainAxisAlignment.end,
          //     children: <Widget>[
          //       Row(
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         children: List<Widget>.generate(
          //           pages.length,
          //           (int index) {
          //             return AnimatedContainer(
          //               duration: Duration(milliseconds: 300),
          //               height: 10,
          //               width: (index == currentPage) ? 30 : 10,
          //               margin: EdgeInsets.symmetric(horizontal: 5, vertical: 30),
          //               decoration: BoxDecoration(
          //                 borderRadius: BorderRadius.circular(5),
          //                 color: (index == currentPage)
          //                     ? Colors.blue
          //                     : Colors.blue.withOpacity(0.5),
          //               ),
          //             );
          //           },
          //         ),
          //       ),
          //     ],
          //   )
          // ],
          ),
    );
  }
}
