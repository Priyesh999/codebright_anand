// import 'package:digigyan/cbtsrc/cbt_helpers/cbo_responsive.dart';
// import 'package:digigyan/cbtsrc/screens/cbt_admin/dashboard/line_chart.dart';
// // import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';
// import 'package:percent_indicator/circular_percent_indicator.dart';
//
// class BottomWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.only(top: 10, bottom: 10),
//       child: (!CBOResponsive.isMobile(context))
//           ? Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Container(
//                   padding: const EdgeInsets.all(20),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                     border: Border.all(color: const Color(0xff19253f), width: 2),
//                     gradient: const LinearGradient(
//                       begin: Alignment.topCenter,
//                       end: Alignment.bottomCenter,
//                       colors: [
//                         Color(0xff19315d),
//                         Color(0xff19253f),
//                       ],
//                     ),
//                   ),
//                   child: Stack(
//                     children: [
//                       Container(
//                         margin: const EdgeInsets.all(20),
//                         child: CircularPercentIndicator(
//                           radius: 130.0,
//                           lineWidth: 8.0,
//                           percent: 0.87,
//                           center: CircularPercentIndicator(
//                             radius: 70.0,
//                             lineWidth: 8.0,
//                             percent: 0.50,
//                             circularStrokeCap: CircularStrokeCap.round,
//                             backgroundColor: const Color(0xff435273),
//                             progressColor: const Color(0xff4aeadc),
//                           ),
//                           circularStrokeCap: CircularStrokeCap.round,
//                           backgroundColor: const Color(0xff435273),
//                           progressColor: const Color(0xff4aeadc),
//                         ),
//                       ),
//                       const Positioned(
//                         child: Text(
//                           "87%",
//                           style: TextStyle(
//                             color: Colors.white,
//                             // fontSize: 16,
//                             // fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                       const Positioned(
//                         bottom: 0,
//                         right: 0,
//                         child: Text(
//                           "50%",
//                           style: TextStyle(
//                             color: Colors.white,
//                             // fontSize: 16,
//                             // fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//                 Expanded(
//                   child: Container(
//                     margin: const EdgeInsets.symmetric(horizontal: 10),
//                     padding: const EdgeInsets.all(20),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10),
//                       border: Border.all(color: const Color(0xff19253f), width: 2),
//                       gradient: const LinearGradient(
//                         begin: Alignment.topCenter,
//                         end: Alignment.bottomCenter,
//                         colors: [
//                           Color(0xff19315d),
//                           Color(0xff19253f),
//                         ],
//                       ),
//                     ),
//                     child: Row(
//                       mainAxisSize: MainAxisSize.min,
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         /// graph
//                         Container(
//                           height: 150,
//                           width: 100,
//                           child: BarChart(
//                             mainBarData(),
//                             // swapAnimationDuration: animDuration,
//                           ),
//                         ),
//                         const SizedBox(
//                           width: 10,
//                         ),
//
//                         /// List
//                         Expanded(
//                           child: Column(
//                             children: [
//                               _listItem(
//                                 title: "Listing",
//                                 hours: "15",
//                                 color: Colors.pink,
//                                 graphColor: Colors.pink,
//                               ),
//                               _listItem(
//                                 title: "Writing",
//                                 hours: "18",
//                                 color: Colors.blue,
//                                 graphColor: Colors.blue,
//                               ),
//                               _listItem(
//                                 title: "Grammar",
//                                 hours: "16",
//                                 color: Colors.yellow,
//                                 graphColor: Colors.yellow,
//                               ),
//                               _listItem(
//                                 title: "Vocobulary",
//                                 hours: "12",
//                                 color: Colors.blueGrey,
//                                 graphColor: Colors.amberAccent,
//                               ),
//                             ],
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             )
//           : Container(
//               margin: const EdgeInsets.symmetric(horizontal: 10),
//               padding: const EdgeInsets.all(20),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 border: Border.all(color: const Color(0xff19253f), width: 2),
//                 gradient: const LinearGradient(
//                   begin: Alignment.topCenter,
//                   end: Alignment.bottomCenter,
//                   colors: [
//                     Color(0xff19315d),
//                     Color(0xff19253f),
//                   ],
//                 ),
//               ),
//               child: (!CBOResponsive.isMobile(context))
//                   ? Row(
//                       mainAxisSize: MainAxisSize.min,
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         /// graph
//                         Container(
//                           height: 150,
//                           width: 100,
//                           child: BarChart(
//                             mainBarData(),
//                             // swapAnimationDuration: animDuration,
//                           ),
//                         ),
//                         const SizedBox(
//                           width: 10,
//                         ),
//
//                         /// List
//                         Expanded(
//                           child: _textGraphValute(),
//                         )
//                       ],
//                     )
//                   : Column(
//                       mainAxisSize: MainAxisSize.min,
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         /// graph
//                         Container(
//                           height: 150,
//                           width: 100,
//                           child: BarChart(
//                             mainBarData(),
//                             // swapAnimationDuration: animDuration,
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 10,
//                         ),
//
//                         /// List
//                         _textGraphValute()
//                       ],
//                     ),
//             ),
//     );
//   }
//
//   Widget _textGraphValute() {
//     return Column(
//       children: [
//         _listItem(
//           title: "Listing",
//           hours: "15",
//           color: Colors.pink,
//           graphColor: Colors.pink,
//         ),
//         _listItem(
//           title: "Writing",
//           hours: "18",
//           color: Colors.blue,
//           graphColor: Colors.blue,
//         ),
//         _listItem(
//           title: "Grammar",
//           hours: "16",
//           color: Colors.yellow,
//           graphColor: Colors.yellow,
//         ),
//         _listItem(
//           title: "Vocobulary",
//           hours: "12",
//           color: Colors.blueGrey,
//           graphColor: Colors.grey,
//         ),
//       ],
//     );
//   }
//
//   BarChartData mainBarData() {
//     return BarChartData(
//       alignment: BarChartAlignment.center,
//       barTouchData: BarTouchData(
//         enabled: false,
//       ),
//       titlesData: FlTitlesData(
//         show: true,
//         bottomTitles: AxisTitles(
//           // sideTitles: false,
//         ),
//         leftTitles: AxisTitles(
//           // showTitles: true,
//           // getTitles: (value) {
//           //   return "";
//           // },
//         //  getTextStyles: ,
//           // ignore: prefer_const_constructors
//           // getTextStyles: (value) =>  TextStyle(
//           //   color: Color(
//           //     0xff939393,
//           //   ),
//           //   fontSize: 10,
//           // ),
//           // margin: 0,
//         ),
//       ),
//       borderData: FlBorderData(
//         show: false,
//       ),
//       groupsSpace: 4,
//       barGroups: getData(),
//     );
//   }
//
//
//   Widget _listItem({
//     Color? color,
//     Color? graphColor,
//     String? title,
//     String? hours,
//   }) {
//     return Table(
//       defaultVerticalAlignment: TableCellVerticalAlignment.middle,
//       children: [
//         TableRow(children: [
//           Row(
//             children: [
//               Container(
//                 height: 10,
//                 width: 10,
//                 decoration: BoxDecoration(
//                   color: color,
//                   shape: BoxShape.circle,
//                 ),
//               ),
//               const SizedBox(
//                 width: 15,
//               ),
//               Flexible(
//                 child: Text(
//                   "$title",
//                   style: const TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 14),
//                 ),
//               ),
//             ],
//           ),
//           Center(
//             child: Text.rich(
//               TextSpan(
//                 style: const TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 14),
//                 children: [
//                   TextSpan(text: "$hours "),
//                   const TextSpan(
//                     text: "hours",
//                     style: TextStyle(
//                       color: Colors.grey,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 50,
//             width: 80,
//             child: AppLineChart(
//               barColor: graphColor!.withOpacity(0.7),
//               spots: const [
//               ],
//             ),
//           ),
//         ]),
//       ],
//     );
//   }
// }
