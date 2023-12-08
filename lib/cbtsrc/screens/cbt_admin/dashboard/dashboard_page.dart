// import 'package:digigyan/cbtsrc/cbt_helpers/app_utilities/app_theme.dart';
// import 'package:digigyan/cbtsrc/cbt_helpers/cbo_responsive.dart';
// import 'package:digigyan/cbtsrc/screens/cbt_admin/dashboard/dwidget/bottom_widget.dart';
// import 'package:digigyan/cbtsrc/screens/cbt_admin/dashboard/dwidget/download_card_widget.dart';
// import 'package:digigyan/cbtsrc/screens/cbt_admin/dashboard/dwidget/my_card_widget.dart';
// import 'package:digigyan/cbtsrc/screens/cbt_admin/dashboard/dwidget/send_money_widget.dart';
// import 'package:digigyan/cbtsrc/screens/cbt_admin/dashboard/dwidget/statistic_widget.dart';
// import 'package:digigyan/cbtsrc/screens/cbt_admin/dashboard/dwidget/time_spend_widget.dart';
// import 'package:digigyan/cbtsrc/screens/cbt_admin/dashboard/dwidget/trafiic_source_widget.dart';
// import 'package:digigyan/cbtsrc/screens/cbt_admin/dashboard/dwidget/transaction_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
//
// class DashboardPage extends StatefulWidget {
//   @override
//   _DashboardPageState createState() => _DashboardPageState();
// }
//
// class _DashboardPageState extends State<DashboardPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white30,
//       body: Container(
//         margin: EdgeInsets.symmetric(horizontal: 10),
//         child: Row(
//           children: [
//             Expanded(
//               flex: 3,
//               child: Container(
//                 child: ListView(
//                   shrinkWrap: true,
//                   children: [
//                     Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Expanded(
//                           flex: 3,
//                           child: Container(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               mainAxisSize: MainAxisSize.min,
//                               children: [
//                                 TrafficSourceWidget(),
//                                 SizedBox(
//                                   height: 20,
//                                 ),
//                                 TimeSpendWidget(),
//                                 if (CBOResponsive.isMobile(context)) ...{
//                                   SizedBox(
//                                     height: 20,
//                                   ),
//                                   StatisticWidget(),
//                                   SizedBox(
//                                     height: 20,
//                                   ),
//                                   SendMoneyWidget(),
//                                 }
//                               ],
//                             ),
//                           ),
//                         ),
//                         if (!CBOResponsive.isMobile(context))
//                           Expanded(
//                             flex: 2,
//                             child: Container(
//                               margin: EdgeInsets.symmetric(horizontal: 10),
//                               child: Column(
//                                 children: [
//                                   StatisticWidget(),
//                                   SizedBox(
//                                     height: 20,
//                                   ),
//                                   SendMoneyWidget(),
//                                 ],
//                               ),
//                             ),
//                           ),
//                       ],
//                     ),
//                     BottomWidget(),
//                     if (CBOResponsive.isMobile(context)) ...{
//                       TransactionWidget(),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       MyCardWidget(),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       DownloadCardWidget(),
//                     }
//                   ],
//                 ),
//               ),
//             ),
//             if (!CBOResponsive.isMobile(context))
//               Expanded(
//                 child: Container(
//                   child: ListView(
//                     shrinkWrap: true,
//                     children: [
//                       MyCardWidget(),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       TransactionWidget(),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       DownloadCardWidget(),
//                     ],
//                   ),
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }
