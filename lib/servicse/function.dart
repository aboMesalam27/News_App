import 'package:clipboard/clipboard.dart';

import 'package:share/share.dart';

import 'package:url_launcher/url_launcher.dart';


class Functions{

 static void openURL(String link) async {
    var urlLink = link;
    if (await canLaunch(urlLink)) {
      await launch(urlLink);
    } else {
      await launch(urlLink);
    }
  }
 static void shareURL(String link) async {

    Share.share(
        link);
  }
 static void copyURL(String link) async {

   FlutterClipboard.copy(
       link);

  }
}