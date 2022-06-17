import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rick_and_morty_app/resources/app_colors.dart';
import 'package:rick_and_morty_app/resources/resources.dart';
import 'package:rick_and_morty_app/screens/episods_screen/episods_screen.dart';
import 'package:rick_and_morty_app/screens/locations_screen/location_screen.dart';
import 'package:rick_and_morty_app/screens/persons_screen/persons_screen.dart';
import 'package:rick_and_morty_app/screens/preference_screen/preference_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentTabIndex = 0;
  List<Color> colors = List.generate(
      4, (i) => i == 0 ? AppColors.color43D049 : AppColors.color5B6975);

  List<Widget> screens = [
    const PersonsScreen(),
    const LocationsScreen(),
    const EpisodsScreen(),
    const PreferenceScreen()
  ];

  void _onSelectedTab(index) {
    if (index == _currentTabIndex) return;
    colors = List.generate(4, (i) => AppColors.color5B6975);
    colors[index] = AppColors.color43D049;
    _currentTabIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_currentTabIndex],
      bottomNavigationBar: Container(
        color: AppColors.color152A3A,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: BottomNavigationBar(
          elevation: 0,
          backgroundColor: AppColors.color152A3A,
          currentIndex: _currentTabIndex,
          unselectedFontSize: 14,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.color43D049,
          unselectedItemColor: AppColors.color5B6975,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                Svgs.subtract,
                color: colors[0],
              ),
              label: "Персонажи",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                Svgs.location24px,
                color: colors[1],
              ),
              label: "Локациии",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                Svgs.group4,
                color: colors[2],
              ),
              label: "Эпизоды",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                Svgs.group,
                color: colors[3],
              ),
              label: "Настройки",
            ),
          ],
          onTap: _onSelectedTab,
        ),
      ),
    );
  }
}
