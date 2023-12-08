import 'dart:math';
import 'package:digigyan/cbtsrc/cbt_helpers/dxwidget/codebright_text.dart';
import 'package:digigyan/cbtsrc/screens/widgets/styles/fonts.dart';
import 'package:digigyan/cbtsrc/screens/widgets/styles/text_style.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

const errorFaces = [
  // '(･o･;)',
  // 'Σ(ಠ_ಠ)',
  // 'ಥ_ಥ',
  // '(˘･_･˘)',
  // '(；￣Д￣)',
  // '(･Д･。',
  "",
  "",
  "",
  "",
  "",
  "",
];

class EmoticonsView extends StatelessWidget {
  const EmoticonsView({
    Key? key,
    required this.text,
    this.button,
  }) : super(key: key);
  final String text;
  final Widget? button;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ListTile(
          title: CBTTextNew(
            errorFaces[Random().nextInt(6)],
            textAlign: TextAlign.center,
            style: TStyle.f16_B.styleWith(fontFamily: AppFontsNeo.leagueBold),
          ),
          subtitle: CBTTextNew(
            text,
            textAlign: TextAlign.center, style: TStyle.f16_B.styleWith(fontFamily: AppFontsNeo.leagueBold),

          ),
        ),
        button ?? Container()
      ],
    );
  }
}
