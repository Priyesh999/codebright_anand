import 'package:digigyan/cbtsrc/screens/cbt_admin/dashboard/dwidget/setting_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyCardWidget extends StatefulWidget {
  @override
  _MyCardWidgetState createState() => _MyCardWidgetState();
}

class _MyCardWidgetState extends State<MyCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.add_circle_outlined,
                  color: Colors.white,
                  size: 15,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Your Cards",
                style: TextStyle(color: Colors.white),
              ),
              Spacer(),
              SettingButton(),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xff4691f7),
                  Color(0xff4ecbcf),
                ],
              ),
            ),
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.credit_card_outlined,
                      size: 45,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Debit Card",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
                Spacer(),
                Text(
                  "****  ****  ****  4457",
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                Row(
                  children: [
                    Text(
                      "Ravi Patel",
                      style: TextStyle(color: Colors.white),
                    ),
                    Spacer(),
                    Icon(
                      Icons.credit_card_outlined,
                      size: 45,
                      color: Colors.white,
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
