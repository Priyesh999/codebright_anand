import 'package:digigyan/cbtsrc/cbt_helpers/dxwidget/codebright_text.dart';
import 'package:digigyan/cbtsrc/screens/widgets/styles/text_style.dart';
import 'package:digigyan/cbtsrc/utils/appImages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'cbt_circular_loader.dart';

class CBTLoaderProgress extends StatelessWidget {
  bool isImage;
  bool isGif;
  bool isCommingSoon;

  CBTLoaderProgress(
      {this.isImage = true, this.isGif = true, this.isCommingSoon = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(children: <Widget>[
        Center(
          child: Container(
              child: Padding(
            padding: const EdgeInsets.all(0.0),
            // child: getIcon("1"),
            child: isImage
                ? Image.asset(
                    AppImages.cbtLogo,
                    height: 350,
                    width: 450,
                  )
                : isCommingSoon & isGif
                    ? Visibility(
                        visible: true,
                        child: ShakeWidget(
                          child: Image.asset("assets/images/comming_soon.gif"),
                        ),
                      )
                    : isGif
                        ? Visibility(
                            visible: true,
                            child: ShakeWidget(
                              child: Image.asset("assets/images/stu_gif.gif"),
                            ),
                          )
                        : Container(
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: NetworkImage(""), fit: BoxFit.fill),
                            ),
                          ),
          )),
        ),
        Container(
          // color: Colors.black12,
          child: Center(
            child: new Container(
              height: 80.0,
              width: 80.0,
              child: ColorLoader(),
            ),
          ),
        ),
      ]),
    );
  }
}
