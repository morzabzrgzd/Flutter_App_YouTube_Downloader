import 'package:flutter/material.dart';
import 'package:youtube_downloder/Screens/download_video_url_screen.dart';
import 'package:youtube_downloder/data/colors.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            elevation: 5,
            backgroundColor: kBackgroundColor,
            title: Text(
              'یوتوب دانلودر',
              style: TextStyle(
                color: kTextColor,
                fontWeight: FontWeight.w700,
                fontSize: size.width * 0.05,
              ),
            ),
          ),
          body: DownloadVideoUrlScreen()
        ),
      ),
    );
  }
}
