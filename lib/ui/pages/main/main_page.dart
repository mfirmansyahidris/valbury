import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:the_klink_sehat/config/config.dart';
import 'package:the_klink_sehat/ui/ui.dart';
import 'package:the_klink_sehat/utils/utils.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _pageIndex = 0;
  final List<_Page> _pages = [
    _Page(page: const HomePage(), sourceIcon: Images.homeSvg, label: Strings.get.home),
    _Page(page: const HospitalPage(), sourceIcon: Images.hospitalSvg, label: Strings.get.hospital),
    _Page(page: const ClinicPage(), sourceIcon: Images.clinicSvg, label: Strings.get.clinic),
    _Page(page: const ProfilePage(), sourceIcon: Images.profileSvg, label: Strings.get.profile),
  ];

  final _pageController = PageController();

  void _switchPage(int index){
    _pageController.animateToPage(index,
        duration: durationDefault,
        curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    return Parent(
      bottomNavigation: BottomNavigationBar(
        items: _pages.map((e){
          return BottomNavigationBarItem(
            icon: SvgPicture.asset(
              e.sourceIcon,
              width: Dimens.space24,
            ),
            activeIcon: SvgPicture.asset(
              e.sourceIcon,
              width: Dimens.space24,
            ),
            label: e.label,
          );
        }).toList(),
        currentIndex: _pageIndex,
        selectedItemColor: Palette.primary,
        showUnselectedLabels: false,
        iconSize: Dimens.space20,
        onTap: (index){
          _switchPage(index);
        },
      ),
      child: PageView(
        physics: const BouncingScrollPhysics(),
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _pageIndex = index;
          });
        },
        children: _pages.map((e) => e.page).toList(),
      ),
    );
  }
}

class _Page{
  final Widget page;
  final String sourceIcon;
  final String label;

  _Page({
    required this.page,
    required this.sourceIcon,
    required this.label
  });
}
