import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:youtube_downloder/Controller/splash_controller.dart';
import 'package:youtube_downloder/data/colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GetBuilder<SplashController>(
      init: SplashController(),
      builder: (controller) => SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            backgroundColor: kBackgroundColor,
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icons/youtubeTriangle.svg',
                    width: size.width * 0.25,
                    alignment: Alignment.center,
                    color: Colors.white,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: size.height * 0.02,
                    ),
                    child: Text(
                      'یوتوب دانلودر',
                      style: TextStyle(
                        color: kTextColor,
                        fontWeight: FontWeight.bold,
                        fontSize: size.width * 0.08,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
