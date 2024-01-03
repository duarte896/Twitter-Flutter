import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:twitter/constants/assets_constants.dart';

class UIConstants {
  static AppBar registerNav() {
    return AppBar(
      title: Row(
        children: [
          Icon(Icons.arrow_back),
          Spacer(flex: 1),
          SvgPicture.asset(
            AssetsConstants.twitterLogo,
            // ignore: deprecated_member_use
            color: Colors.blue,
            height: 30,
          ),
          Spacer(flex: 1),
        ],
      ),
    );
  }

  static AppBar loginNav() {
    return AppBar(
      title: Row(
        children: [
          Icon(Icons.clear),
          Spacer(flex: 1),
          SvgPicture.asset(
            AssetsConstants.twitterLogo,
            // ignore: deprecated_member_use
            color: Colors.blue,
            height: 30,
          ),
          Spacer(flex: 1),
        ],
      ),
    );
  }
}
