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

  static AppBar tweetNav() {
    return AppBar(
      iconTheme: IconThemeData(color: Colors.blue),
      title: Row(
        children: [
          Expanded(child: Container()),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            ),
            child: Text('Tweet'),
          ),
        ],
      ),
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
