import 'package:digigyan/cbtsrc/cbt_helpers/custom_widget/new_loader.dart';
import 'package:digigyan/cbtsrc/utils/appImages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CBTLoaderProgress extends StatelessWidget {
  const CBTLoaderProgress();

  @override
  Widget build(BuildContext context) {
    bool isAnroid = defaultTargetPlatform == TargetPlatform.android;

    return Container(
      color: Colors.white,
      child: Stack(
          children: <Widget>[

            Center(
              child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    // child: getIcon("1"),
                    child: "".isEmpty
                        ? Image.asset(
                      AppImages.cbtLogo,
                      height: 350,
                      width: 450,
                    )
                        : Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NetworkImage(""),
                            fit: BoxFit.fill),
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
            ),]
      ),
    );

  }
}
