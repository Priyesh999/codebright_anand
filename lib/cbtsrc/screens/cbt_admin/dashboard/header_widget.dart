// import 'package:digigyan/cbtsrc/cbt_helpers/cbo_responsive.dart';
// import 'package:digigyan/cbtsrc/screens/cbt_admin/dashboard/line_chart.dart';
// import 'package:digigyan/cbtsrc/screens/cbt_admin/dashboard/menu_controller.dart';
// import 'package:digigyan/cbtsrc/utils/appImages.dart';
// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';
//
// import 'package:provider/provider.dart';
//
//
//
//
// class HeaderWidget extends StatefulWidget {
//   @override
//   _HeaderWidgetState createState() => _HeaderWidgetState();
// }
//
// class _HeaderWidgetState extends State<HeaderWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.teal.shade800,
//       padding: EdgeInsets.symmetric(horizontal: 30,vertical:4),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           if (!CBOResponsive.isDesktop(context))
//             IconButton(
//               icon: Icon(
//                 Icons.menu,
//                 color: Colors.white,
//               ),
//               onPressed: Provider.of<MenuController>(context, listen: false)
//                   .controlMenu,
//             ),
//           logoWidget(),
//           if (!CBOResponsive.isMobile(context))
//             Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 bitcoinWidget(),
//                 SizedBox(
//                   width: 20,
//                 ),
//                 searchWidget(),
//               ],
//             ),
//           notificationThemeProfileIcon(),
//         ],
//       ),
//     );
//   }
//
//   Container notificationThemeProfileIcon() {
//     return Container(
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           if (MediaQuery.of(context).size.width > 1180) ...{
//             roundedIcon(icon: Icons.nightlight_round),
//             SizedBox(
//               width: 20,
//             ),
//             roundedIcon(
//                 icon: Icons.notifications,
//                 color: Color(0xff33b6e0),
//                 isNewNotification: true),
//             SizedBox(
//               width: 20,
//             ),
//           },
//           Stack(
//             children: [
//               Container(
//                 height: 40,
//                 width: 40,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   gradient: LinearGradient(
//                     colors: [
//                       Colors.pink,
//                       Colors.blue,
//                     ],
//                   ),
//                 ),
//                 margin: EdgeInsets.all(5),
//                 padding: EdgeInsets.all(10),
//                 child: Image.asset(
//                   AppImages.apple,
//                   height: 20,
//                 ),
//               ),
//               Positioned(
//                 bottom: 5,
//                 right: 5,
//                 child: Container(
//                   height: 15,
//                   width: 15,
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     color: Colors.greenAccent,
//                   ),
//                   child: Icon(
//                     Icons.add_circle_outlined,
//                     color: Colors.white,
//                     size: 10,
//                   ),
//                 ),
//               )
//             ],
//           ),
//           if (!CBOResponsive.isMobile(context)) ...{
//             SizedBox(
//               width: 20,
//             ),
//             Icon(
//               Icons.keyboard_arrow_down,
//               color: Colors.grey,
//               size: 15,
//             ),
//             SizedBox(
//               width: 20,
//             ),
//           },
//           if (MediaQuery.of(context).size.width > 1180) ...{
//             SizedBox(
//               width: 20,
//             ),
//             roundedIcon(icon: Icons.account_balance_wallet),
//             SizedBox(
//               width: 20,
//             ),
//             Text(
//               "Balance",
//               style: TextStyle(color: Colors.grey),
//             ),
//             SizedBox(
//               width: 10,
//             ),
//             Text(
//               "\$ 56000.00",
//               style: TextStyle(color: Colors.white),
//             ),
//           },
//           if (!CBOResponsive.isMobile(context)) ...{
//             SizedBox(
//               width: 20,
//             ),
//             roundedIcon(icon: Icons.highlight_remove_rounded),
//           }
//         ],
//       ),
//     );
//   }
//
//   Widget roundedIcon(
//       {IconData? icon, Color? color, bool isNewNotification = false}) {
//     return Stack(
//       children: [
//         Container(
//           height: 40,
//           width: 40,
//           decoration: BoxDecoration(
//             shape: BoxShape.circle,
//             border: Border.all(
//               color: Colors.grey,
//             ),
//           ),
//           child: Icon(
//             icon,
//             color: color ?? Colors.grey,
//             size: 20,
//           ),
//         ),
//         if (isNewNotification)
//           Positioned(
//               right: 2,
//               top: 2,
//               child: Container(
//                 height: 8,
//                 width: 8,
//                 decoration: BoxDecoration(
//                   color: color ?? Color(0xff33b6e0),
//                   shape: BoxShape.circle,
//                 ),
//               ))
//       ],
//     );
//   }
//
//   Widget bitcoinWidget() {
//     return Container(
//       child: Row(
//         children: [
//           Container(
//             height: 30,
//             width: 30,
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               color: Colors.green,
//             ),
//             padding: EdgeInsets.all(5),
//             child: Image.asset(
//               AppImages.bitcoin,
//               color: Colors.white,
//             ),
//           ),
//           SizedBox(
//             width: 15,
//           ),
//           Text(
//             "Bitcoin",
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 14,
//             ),
//           ),
//           SizedBox(
//             width: 15,
//           ),
//           SizedBox(
//             height: 50,
//             width: 80,
//             child: AppLineChart(
//               barColor: Colors.green.withOpacity(0.7),
//               spots: [
//                 FlSpot(1, 2.4),
//                 FlSpot(3, 1.5),
//                 FlSpot(5, 1.4),
//                 FlSpot(7, 2.4),
//                 FlSpot(10, 2),
//                 FlSpot(12, 2.2),
//                 FlSpot(13, 2.8),
//               ],
//             ),
//           ),
//           SizedBox(
//             width: 15,
//           ),
//           Text(
//             "+3.05%",
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 14,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget searchWidget() {
//     return Container(
//       width: 200,
//       child: TextFormField(
//         decoration: InputDecoration(
//             border: InputBorder.none,
//             hintText: "Search Here ...",
//             hintStyle: TextStyle(
//               color: Colors.grey,
//               fontSize: 12,
//               fontWeight: FontWeight.bold,
//             ),
//             suffixIcon: Icon(
//               Icons.search,
//               color: Colors.grey,
//               size: 18,
//             )),
//       ),
//     );
//   }
//
//   Widget logoWidget() {
//     return Row(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         if (!CBOResponsive.isMobile(context))...{
//           Container(
//             height: 35,
//             width: 35,
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               gradient: LinearGradient(
//                 begin: Alignment.topCenter,
//                 end: Alignment.bottomCenter,
//                 colors: [
//                   Colors.green,
//                   Colors.greenAccent,
//                 ],
//               ),
//             ),
//           ),
//           SizedBox(
//             width: 20,
//           ),
//         },
//         Text(
//           "Dashboard",
//           style: TextStyle(color: Colors.white),
//         )
//       ],
//     );
//   }
// }
