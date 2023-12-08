import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:digigyan/cbtsrc/utils/appIcons.dart';
import 'package:image_network/image_network.dart';


abstract class AppImages {
  // static const root = 'assets/images';
  // static const cbtLogo = "$root/logo.png";

  static String imageExt(String path) => "assets/images/$path";

  // static String get cbtLogo => imageExt("logo.png");
  static String get cbtLogo => imageExt("DigiGyan.png");

  static String get bg => imageExt("bg.png");

  // static String get cbtLogoSingle => imageExt("ic_logo.png");
  static String get cbtLogoSingle => imageExt("DigiGyan.png");

  static String get qr => imageExt("qr.jpeg");

  static String get userIcon => imageExt("user.png");

  static String get backgroungImage => imageExt("form-bg.png");

  static String get register => imageExt("register.png");

  static String get recommend => imageExt("recommend-icon.png");

  static String get splash => imageExt("splash.png");

  static String get netWorth => imageExt("money.png");

  static String get doctor => imageExt("doctors.png");

  static String get user => imageExt("users.png");

  static String get product => imageExt("product.png");

  static String get drawer => imageExt("appDarwer.png");

  static String get happy => imageExt("happy.png");

  static String get sad => imageExt("sad.png");

  static String get userImage => imageExt("userImage.jpg");

  static String get userImageIc => imageExt("user_ic.png");

  static String get loaderIcon => imageExt("codebright_loader.gif");

  static String get uploadDownload => imageExt("downlod_upload.png");

  static String get background_lines => imageExt("bg-lines.svg");

  static String get bitcoin => imageExt("bitcoin.png");

  static String get facebook => imageExt("facebook.png");

  static String get dribble => imageExt("dribble.png");

  static String get messenger => imageExt("messenger.png");

  static String get figma => imageExt("figma.png");

  static String get sketch => imageExt("sketch.png");

  static String get apple => imageExt("apple.png");
  static String get simulation => imageExt("sml_png.png");
  static String get video => imageExt("video_png.png");
  static String get pdf => imageExt("pdf_png.png");

  static String get spotify => imageExt("spotify.png");

  static String get jira => imageExt("jira.png");

  static String get gitlab => imageExt("gitlab.png");

  static String get intercom => imageExt("intercom.png");

  static String get safari => imageExt("safari.png");

  static String get slack => imageExt("slack.png");

  static String get calendar => imageExt("calendar.png");

  static String get cart => imageExt("cart.png");

  static String get products => imageExt("products.png");

  static String get chat => imageExt("chat.png");

  static String get dashboard => imageExt("dashboard.png");

  static String get email => imageExt("email.png");

  static String get file => imageExt("file.png");

  static String get user1 => imageExt("user1.jpg");

  static String get user2 => imageExt("user2.jpg");

  static String get user3 => imageExt("user3.jpg");

  static String get user4 => imageExt("user4.jpg");

  static String get digigyanLogo => imageExt("DigiGyan.png");

  static String get digigyanLogo2 => imageExt("digiGyam.jpeg");

  static const String defaultIDoctorImagePath =
      "https://image.freepik.com/free-vector/doctor-icon-avatar-white_136162-58.jpg";

  static String wNoImageURL =
      "https://www.samsung.com/etc/designs/smg/global/imgs/support/cont/NO_IMG_600x600.png";

  static String wServerBaseImagePath =
      "http://www.test.cboinfotech.com/uploads/";

  static String wServerImagePath({String? fileName}) =>
      wServerBaseImagePath + fileName!;

  static String wValidateImagePath({String? fileName, bool isUser = false}) {
    if (fileName == null) {
      return isUser ? defaultIDoctorImagePath : wNoImageURL;
    } else if (fileName.isEmpty) {
      return isUser ? defaultIDoctorImagePath : wNoImageURL;
    } else if (fileName.contains("http") && isImageTypeOfURL(fileName)) {
      return fileName;
    } else if (fileName.contains("http") && !isImageTypeOfURL(fileName)) {
      return isUser ? defaultIDoctorImagePath : wNoImageURL;
    } else if (!fileName.contains("http") && isImageTypeOfURL(fileName)) {
      return isUser ? defaultIDoctorImagePath : wNoImageURL;
    } else {
      return wServerImagePath(fileName: fileName);
    }
  }

  static bool isImageTypeOfURL(String fileName) {
    if (fileName.contains(".png") ||
        fileName.contains(".PNG") ||
        fileName.contains(".jpg") ||
        fileName.contains(".JPG") ||
        fileName.contains(".jpeg") ||
        fileName.contains(".JPEG")) {
      return true;
    } else {
      return false;
    }
  }

  static bool isPdfTypeOfURL(String fileName) =>
      fileName.contains(".pdf") || fileName.contains(".PDF");



  static Widget getNetworkImage(String url, {BoxFit boxFit = BoxFit.cover}) {
    // return CachedNetworkImage(
    //   fit: boxFit,
    //   imageUrl: url,
    //   placeholder: (context, url) => Center(
    //     child: SizedBox(
    //       height: 25,
    //       width: 24,
    //       child: Platform.isIOS
    //           ? const CupertinoActivityIndicator()
    //           : const CircularProgressIndicator(strokeWidth: 2.5),
    //     ),
    //   ),
    //   errorWidget: (context, url, error) => const Icon(Icons.error),
    // );

    return ImageNetwork(
      image: url,
      // imageCache: CachedNetworkImageProvider(imageUrl),
      height: 150,
      width: 150,
      duration: 1500,
      curve: Curves.easeIn,
      onPointer: true,
      debugPrint: false,
      fullScreen: false,
      fitAndroidIos: BoxFit.cover,
      fitWeb: BoxFitWeb.cover,
      onLoading: const CircularProgressIndicator(
        color: Colors.teal,
      ),
      onError: const Icon(
        Icons.error,
        color: Colors.red,
      ),
      borderRadius: BorderRadius.circular(70),
      onTap: () {
        // showDialog(
        //     context: context,
        //     builder: (_) => const AlertDialog(
        //       content: Text("©gabrielpatricksouza"),
        //     ));
        // debugPrint("©gabriel_patrick_souza");
      },
    );
  }

  static Widget getLocalImage(String url, {BoxFit boxFit = BoxFit.none}) {
    return Image.file(
      File(url),
    );
  }

  static Widget getImagePreview(String url, {BoxFit boxFit = BoxFit.none}) {
    return url.contains("http") ? getNetworkImage(url) : getLocalImage(url);
  }
}

Widget getMyImageAsset(BuildContext context, String _url, {double size = 35}) =>
    Image.asset(
      _url,
      height: size,
      width: size,
      color: Theme.of(context).colorScheme.secondary,
    );

Widget myVerticalDividerGray() => Container(
      width: 0.5,
      height: 70,
//      color: Colors.transparent,
      color: Colors.grey.shade300,
    );

Widget myHorizontalDividerGray() => Container(
      margin: const EdgeInsets.only(left: 12, right: 12),
      height: 0.5,
//      color: Colors.transparent,
      color: Colors.grey.shade300,
    );
