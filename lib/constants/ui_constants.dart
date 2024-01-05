import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:twitter/constants/assets_constants.dart';

class UIConstants {
  static AppBar registerNav() {
    return AppBar(
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

  static AppBar loginNav() {
    return AppBar(
      title: Column(
        children: [
          //Icon(Icons.clear),

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

  static AppBar loginHomeNav() {
    return AppBar(
      automaticallyImplyLeading: false,
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

  static AppBar homeNav() {
    return AppBar(
      iconTheme: IconThemeData(color: Colors.blue),
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
}
