import 'package:flutter/material.dart';
import 'package:fitemos/src/workout/workoutPage.dart';
import 'package:fitemos/src/benchMark/benchMark.dart';
import 'package:fitemos/src/shop/shopPage.dart';
import 'package:fitemos/src/blog/blogPage.dart';
import 'package:fitemos/src/account/accountPage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:page_transition/page_transition.dart';
import 'package:fitemos/src/page_transition.dart';

import 'package:flutter_svg/flutter_svg.dart';

class FitnessNav extends StatefulWidget {
  final int curIdx;
  FitnessNav({Key key, this.title, this.curIdx = 0}) : super(key: key);

  final String title;

  @override
  _fitnessNavState createState() => _fitnessNavState();
}

class _fitnessNavState extends State<FitnessNav> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    WorkoutPage(),
    BenchMark(),
    Blog(),
    Shop(),
    AccountPage(),
  ];

  //final String assetName = 'assets/up_arrow.svg';
  final Widget svgIcon1 = SvgPicture.asset('assets/svgs/heartbeat.svg',
      color: Colors.red, semanticsLabel: 'heartbeat');

  @override
  void initState() {
    super.initState();
    setState(() {
      _currentIndex = widget.curIdx;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
        onWillPop: () async => false,
        child: new Scaffold(
          body: _children[_currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            onTap: onTabTapped, // new
            currentIndex: _currentIndex,
            selectedItemColor: Color(0xffAFCA32),
            selectedFontSize: 12,
            unselectedItemColor: Color(0xffB9B7B7),
            showSelectedLabels: true,
            showUnselectedLabels: true,
            items: [
              BottomNavigationBarItem(
                  icon: SvgPicture.asset('assets/svgs/heartbeat.svg',
                      height: 22,
                      width: 22,
                      color: _currentIndex == 0
                          ? Color(0xffAFCA32)
                          : Color(0xffB9B7B7),
                      semanticsLabel:
                          'workout'), //new FaIcon(FontAwesomeIcons.heartbeat),
                  title: Padding(
                      padding: EdgeInsets.only(top: 3),
                      child: Text('Workout',
                          style: GoogleFonts.rubik(
                              fontSize: 11, fontWeight: FontWeight.w200)))),
              BottomNavigationBarItem(
                  //icon:  new FaIcon(FontAwesomeIcons.trophy),
                  icon: SvgPicture.asset('assets/svgs/trophy-alt.svg',
                      height: 22,
                      width: 22,
                      color: _currentIndex == 1
                          ? Color(0xffAFCA32)
                          : Color(0xffB9B7B7),
                      semanticsLabel: 'benchmarks'),
                  title: Padding(
                      padding: EdgeInsets.only(top: 3),
                      child: Text('Benchmarks',
                          style: GoogleFonts.rubik(
                              fontSize: 11, fontWeight: FontWeight.w200)))),
              BottomNavigationBarItem(
                  //icon: new FaIcon(FontAwesomeIcons.blog),
                  icon: SvgPicture.asset('assets/svgs/browser.svg',
                      height: 22,
                      width: 22,
                      color: _currentIndex == 2
                          ? Color(0xffAFCA32)
                          : Color(0xffB9B7B7),
                      semanticsLabel: 'blog'),
                  title: Padding(
                      padding: EdgeInsets.only(top: 3),
                      child: Text('Blog',
                          style: GoogleFonts.rubik(
                              fontSize: 11, fontWeight: FontWeight.w200)))),
              BottomNavigationBarItem(
                  // icon: new FaIcon(FontAwesomeIcons.shoppingBasket),
                  icon: SvgPicture.asset('assets/svgs/shopping-basket.svg',
                      height: 22,
                      width: 22,
                      color: _currentIndex == 3
                          ? Color(0xffAFCA32)
                          : Color(0xffB9B7B7),
                      semanticsLabel: 'shop'),
                  title: Padding(
                      padding: EdgeInsets.only(top: 3),
                      child: Text('Shop',
                          style: GoogleFonts.rubik(
                              fontSize: 11, fontWeight: FontWeight.w200)))),
              BottomNavigationBarItem(
                //icon: new FaIcon(FontAwesomeIcons.user),
                icon: SvgPicture.asset('assets/svgs/user-alt.svg',
                    height: 22,
                    width: 22,
                    color: _currentIndex == 4
                        ? Color(0xffAFCA32)
                        : Color(0xffB9B7B7),
                    semanticsLabel: 'user'),
                title: Padding(
                    padding: EdgeInsets.only(top: 3),
                    child: Text('Cuenta',
                        style: GoogleFonts.rubik(
                            fontSize: 11, fontWeight: FontWeight.w200))),
              )
            ],
          ),
        ));
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      // if (_currentIndex == 0) {
      //   Navigator.push(
      //       context,
      //       PageTransition(
      //           type: PageTransitionType.rightToLeft, //leftToRight,
      //           child: FitnessNav(
      //             curIdx: 0,
      //           )));
      // } else if (_currentIndex == 1) {
      //   Navigator.push(
      //       context,
      //       PageTransition(
      //           type: PageTransitionType.rightToLeft, //leftToRight,
      //           child: FitnessNav(
      //             curIdx: 1,
      //           )));
      // } else if (_currentIndex == 2) {
      //   Navigator.push(
      //       context,
      //       PageTransition(
      //           type: PageTransitionType.rightToLeft, //leftToRight,
      //           child: FitnessNav(
      //             curIdx: 2,
      //           )));
      // } else if (_currentIndex == 3) {
      //   Navigator.push(
      //       context,
      //       PageTransition(
      //           type: PageTransitionType.rightToLeft, //leftToRight,
      //           child: FitnessNav(
      //             curIdx: 3,
      //           )));
      // } else
      if (_currentIndex == 4) {
        Navigator.push(
            context,
            PageTransition(
                type: PageTransitionType.rightToLeft, //leftToRight,
                child: FitnessNav(
                  curIdx: 4,
                )));
      }
    });
  }
}
