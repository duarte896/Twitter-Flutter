import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:twitter/constants/assets_constants.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onIndexChanged;
  const BottomNavBar(
      {super.key, required this.selectedIndex, required this.onIndexChanged});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AssetsConstants.homeLogo,
              // ignore: deprecated_member_use
              color: selectedIndex == 0 ? Colors.blue : Colors.grey,
              height: 30,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AssetsConstants.searchLogo,
              // ignore: deprecated_member_use
              color: selectedIndex == 1 ? Colors.blue : Colors.grey,
              height: 30,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AssetsConstants.notificationLogo,
              // ignore: deprecated_member_use
              color: selectedIndex == 2 ? Colors.blue : Colors.grey,
              height: 30,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AssetsConstants.inboxLogo,
              // ignore: deprecated_member_use
              color: selectedIndex == 3 ? Colors.blue : Colors.grey,
              height: 30,
            ),
            label: '',
          ),
        ],
        backgroundColor: Colors.white,
        currentIndex: selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: onIndexChanged);
  }
}
