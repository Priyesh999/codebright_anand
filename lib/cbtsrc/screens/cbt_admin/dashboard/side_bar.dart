import 'package:digigyan/cbtsrc/utils/appImages.dart';
import 'package:flutter/material.dart';


class SideBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 20,
      child: Container(
        color: Colors.white30,
        padding: EdgeInsets.symmetric(
          horizontal: 8,
        ),
        child: ListView(
          shrinkWrap: true,
          // mainAxisSize: MainAxisSize.min,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            menuItem(
              title: "Dashboard",
              logo: AppImages.dashboard,
              isActive: true,
            ),
            menuItem(
              title: "Team Chat",
              logo: AppImages.chat,
              notification: 2,
            ),
            menuItem(
              title: "Calender",
              logo: AppImages.calendar,
            ),
            menuItem(
              title: "Documents",
              logo: AppImages.file,
            ),
            menuItem(
              title: "Store",
              logo: AppImages.cart,
            ),
            menuItem(
              title: "Mail",
              logo: AppImages.email,
            ),
            menuItem(
              title: "Products",
              logo: AppImages.products,
            ),
            // SizedBox(
            //   height: 40,
            // ),
            // Text(
            //   "Integrations".toUpperCase(),
            //   style: TextStyle(
            //     color: Colors.grey,
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),
            // SizedBox(
            //   height: 20,
            // ),
            // integrationMenuItem(
            //   title: "Jira Integrations",
            //   logo: AppImages.jira,
            //   bgColor: Colors.teal,
            // ),
            // integrationMenuItem(
            //   title: "Slack Integrations",
            //   logo: AppImages.slack,
            //   bgColor: Colors.teal,
            // ),
            // integrationMenuItem(
            //   title: "Intercom Integrations",
            //   logo: AppImages.intercom,
            //   bgColor: Colors.teal,
            // ),
            // integrationMenuItem(
            //   title: "Bitbucket Integrations",
            //   logo: AppImages.gitlab,
            //   bgColor: Colors.teal,
            // ),
            // SizedBox(
            //   height: 40,
            // ),
            // menuItem(
            //   title: "Settings",
            //   logo: AppImages.dashboard,
            // ),
            // menuItem(
            //   title: "Help and knowledge Base",
            //   logo: AppImages.dashboard,
            // ),
            // menuItem(
            //   title: "Log Out",
            //   logo: AppImages.dashboard,
            // ),
          ],
        ),
      ),
    );
  }

  Widget integrationMenuItem({String? title, String? logo, Color? bgColor}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: bgColor,
            ),
            padding: EdgeInsets.all(10),
            child: Image.asset(
              logo!,
              height: 28,
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Flexible(
            child: Text(
              title!,
              style: TextStyle(
                color: Colors.teal,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget menuItem(
      {String? title, String? logo, int? notification, bool isActive = false}) {
    return ListTile(
      title: Text(
        title!,
        style: TextStyle(
          color: isActive ? Colors.teal : Colors.black,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
      leading: Image.asset(
        logo!,
        height: 18,
        color: isActive ? Colors.teal : Colors.black,
      ),
      trailing: notification != null
          ? Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: notification != null
                    ? Color(0xff33b6e0)
                    : Colors.transparent,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "$notification",
                  style: TextStyle(
                    color: notification != null
                        ? Colors.white
                        : Colors.transparent,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          : null,
    );
  }
}
