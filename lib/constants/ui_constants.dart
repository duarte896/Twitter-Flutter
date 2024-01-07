import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:twitter/constants/assets_constants.dart';

class UIConstants {
  static AppBar appNav(bool goBack) {
    return AppBar(
      iconTheme: IconThemeData(color: Colors.blue),
      automaticallyImplyLeading: goBack,
      title: Column(
        children: [
          SvgPicture.asset(
            AssetsConstants.twitterLogo,
            // ignore: deprecated_member_use
            color: Colors.blue,
            height: 30,
          ),
        ],
      ),
      centerTitle: true,
    );
  }

  static userID(String text) {
    if (text.isNotEmpty) {
      return text.substring(0, 1).toUpperCase();
    } else {
      return 'A';
    }
  }
}
