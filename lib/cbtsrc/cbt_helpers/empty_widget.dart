import 'package:digigyan/cbtsrc/cbt_helpers/dxwidget/codebright_text.dart';
import 'package:digigyan/cbtsrc/utils/appImages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EmptyWidget extends StatelessWidget {
  String? msg;
  String? retryText;
  bool? showImage = true;
  Function()? retry;

  EmptyWidget({this.msg, this.retry, this.retryText, this.showImage = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(bottom: this.showImage! ? 45 : 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 16,
          ),
          if (this.showImage!)
            Image.asset(
              AppImages.cbtLogo,
              height: 100,
            ),
          if (msg != null)
            Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 12),
              child: DxTextBlack(
                msg!,
                mSize: 20,
              ),
            ),
          if (retry != null)
            OutlinedButton.icon(
              icon: Icon(Icons.refresh_outlined),
              label: DxTextBlack(retryText ?? "Retry"),
              onPressed: retry,
            ),
        ],
      ),
    );
  }
}
