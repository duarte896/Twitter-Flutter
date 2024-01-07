import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:twitter/constants/assets_constants.dart';

class WallTweet extends StatelessWidget {
  final String message;
  final String user;
  const WallTweet({super.key, required this.message, required this.user});

  final url = 'http://placehold.it/150x150?text=A';

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 25.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage(url),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      user,
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      message,
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: SvgPicture.asset(
                                    AssetsConstants.commentLogo,
                                    height: 20,
                                    // ignore: deprecated_member_use
                                    color: Colors.grey,
                                  ),
                                ),
                                SizedBox(
                                  width: 60,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: SvgPicture.asset(
                                    AssetsConstants.retweetLogo,
                                    height: 20,
                                    // ignore: deprecated_member_use
                                    color: Colors.grey,
                                  ),
                                ),
                                SizedBox(
                                  width: 60,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: SvgPicture.asset(
                                    AssetsConstants.likeLogo,
                                    height: 20,
                                    // ignore: deprecated_member_use
                                    color: Colors.grey,
                                  ),
                                ),
                                SizedBox(
                                  width: 60,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: SvgPicture.asset(
                                    AssetsConstants.shareLogo,
                                    height: 20,
                                    // ignore: deprecated_member_use
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      Divider(color: Colors.grey)
    ]);
  }
}
