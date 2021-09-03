import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_downloder/Controller/url_controller.dart';
import 'package:youtube_downloder/Downloader/downloader.dart';
import 'package:youtube_downloder/Screens/browser_screen.dart';
import 'package:youtube_downloder/data/colors.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

// ignore: must_be_immutable
class DownloadVideoUrlScreen extends StatelessWidget {
  var controller = UrlController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.04,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.04,
                vertical: size.height * 0.01,
              ),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(.5),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextFormField(
                controller: controller.urlController,
                cursorColor: kBackgroundColor,
                decoration: InputDecoration(
                  hintText: 'لینک ویدیو',
                  suffixIcon: Icon(
                    FeatherIcons.link,
                    color: Colors.black87,
                  ),
                  hintStyle: TextStyle(
                    color: Colors.black87,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: size.height * 0.02),
            InkWell(
              onTap: () {
                if (controller.urlController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      duration: Duration(seconds: 2),
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      content: Text(
                        'لینک ویدیو مورد نظر را وارد کنید!',
                        style: TextStyle(
                          color: kTextColor,
                          fontFamily: 'IRANSansDN',
                        ),
                      ),
                    ),
                  );
                } else {
                  // dowmload this video
                  Downloader().downloadVideo(
                    controller.urlController.text.trim(),
                    'YouTube Downloader',
                  );
                }
              },
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: size.height * 0.07,
                decoration: BoxDecoration(
                  color: kBackgroundColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'دانلود ویدئو',
                  style: TextStyle(
                    color: kTextColor,
                    fontSize: size.width * 0.045,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: kBackgroundColor,
        onPressed: () {
          Get.to(() => BrowserScreen(), transition: Transition.fade);
        },
        label: Row(
          children: [
            Icon(
              FeatherIcons.globe,
              color: kTextColor,
            ),
            SizedBox(width: size.width * 0.02),
            Text(
              'سایت یوتوب',
              style: TextStyle(
                color: kTextColor,
                fontSize: size.width * 0.04,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
