import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

Future<void> launchEmail(path) async {
  final Uri emailLaunchUri = Uri(
    scheme: 'mailto',
    path: path,
    queryParameters: {
      'subject': 'Contact From Brainwired',
    },
  );

  if (await canLaunchUrl(emailLaunchUri)) {
    await launchUrl(emailLaunchUri);
  } else {
    Fluttertoast.showToast(msg: 'Could not launch email');
  }
}

void launchMap(String latitude, String longitude) async {
  String mapUrl =
      'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';

  if (await canLaunchUrlString(mapUrl)) {
    await launchUrlString(mapUrl);
  } else {
    Fluttertoast.showToast(msg: 'Could not launch map');
  }
}

void launchPhoneCall(String phoneNumber) async {
  final Uri phoneLaunchUri = Uri(scheme: 'tel', path: phoneNumber);
  if (await canLaunchUrl(phoneLaunchUri)) {
    await launchUrl(phoneLaunchUri);
  } else {
    Fluttertoast.showToast(msg: 'Could not call $phoneNumber');
  }
}

void launchWebsite(String url) async {
  if (await canLaunchUrlString(url)) {
    await launchUrlString(url);
  } else {
    Fluttertoast.showToast(msg: 'Could not launch $url');
  }
}
