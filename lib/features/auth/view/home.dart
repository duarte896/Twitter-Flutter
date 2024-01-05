import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:twitter/constants/assets_constants.dart';
import 'package:twitter/constants/ui_constants.dart';
import 'package:twitter/theme/app_theme.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: AppTheme.secondTheme,
      child: Scaffold(
        appBar: UIConstants.homeNav(),
        body: Text('hola'),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AssetsConstants.homeLogo,
                // ignore: deprecated_member_use
                color: _selectedIndex == 0 ? Colors.blue : Colors.grey,
                height: 30,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AssetsConstants.searchLogo,
                // ignore: deprecated_member_use
                color: _selectedIndex == 1 ? Colors.blue : Colors.grey,
                height: 30,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AssetsConstants.notificationLogo,
                // ignore: deprecated_member_use
                color: _selectedIndex == 2 ? Colors.blue : Colors.grey,
                height: 30,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AssetsConstants.inboxLogo,
                // ignore: deprecated_member_use
                color: _selectedIndex == 3 ? Colors.blue : Colors.grey,
                height: 30,
              ),
              label: '',
            ),
          ],
          backgroundColor: Colors.white,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
      ),
    );
  }
}
