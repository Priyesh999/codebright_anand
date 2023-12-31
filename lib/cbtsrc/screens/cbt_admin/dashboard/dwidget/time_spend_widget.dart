import 'package:digigyan/cbtsrc/utils/appImages.dart';
import 'package:digigyan/cbtsrc/utils/common.dart';
import 'package:flutter/material.dart';

class TimeSpendWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: appContainerDecoration,
      padding: EdgeInsets.all(20),
      child: LayoutBuilder(builder: (context, constraints) {
        // constraints.maxWidth
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Time Spent On Learning",
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                _itemWidget(
                    time: "2 h",
                    icon: AppImages.safari,
                    color: Color(0xff376fa0),
                    flex: 2),
                _itemWidget(
                    time: "10 h",
                    icon: AppImages.figma,
                    color: Color(0xffcf7f7e),
                    flex: 3),
                _itemWidget(
                    time: "10 h",
                    icon: AppImages.sketch,
                    color: Color(0xfff6a90f),
                    flex: 3),
                _itemWidget(
                    time: "10 h",
                    icon: AppImages.spotify,
                    color: Color(0xff46b775),
                    flex: 5),
                _itemWidget(
                    time: "10 h",
                    icon: AppImages.messenger,
                    color: Color(0xff226dd0),
                    flex: 4),
              ],
            ),
          ],
        );
      }),
    );
  }

  Widget _itemWidget({
    String? time,
    String? icon,
    Color? color,
    int flex = 1,
  }) {
    return Expanded(
      flex: flex,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 4),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Image.asset(
                icon!,
                height: 20,
                width: 20,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 6,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        color!.withOpacity(0.05),
                        color!.withOpacity(0.4),
                        color,
                      ])),
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                time!,
                style: TextStyle(color: Colors.white, fontSize: 12),

              ),
            )
          ],
        ),
      ),
    );
  }
}
