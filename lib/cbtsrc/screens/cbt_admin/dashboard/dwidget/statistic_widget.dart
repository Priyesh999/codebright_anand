// import 'package:digigyan/cbtsrc/screens/cbt_admin/dashboard/dwidget/setting_button.dart';
// import 'package:digigyan/cbtsrc/utils/common.dart';
// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';
//
// class StatisticWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: appContainerDecoration,
//       padding: EdgeInsets.all(20),
//       child: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 "Statistic",
//                 style: TextStyle(color: Colors.white),
//               ),
//               SettingButton(),
//             ],
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           Container(
//             height: 180,
//             child: BarChart(
//               mainBarData(),
//               // swapAnimationDuration: animDuration,
//             ),
//           )
//         ],
//       ),
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
//         bottomTitles: AxisTitles(sideTitles: SideTitles(
//           showTitles: false,
//         )),
//         leftTitles: AxisTitles(sideTitles:SideTitles(
//           showTitles: true,
//           // getTitlesWidget:Text("de");
//           // getTextStyles: (value) => TextStyle(
//           //   color: Color(
//           //     0xff939393,
//           //   ),
//           //   fontSize: 10,
//           // ),
//           // margin: 0,
//         )),
//       ),
//       borderData: FlBorderData(
//         show: false,
//       ),
//       groupsSpace: 4,
//       barGroups: getData(),
//     );
//   }
//
//   List<BarChartGroupData> getData() {
//     return [
//       BarChartGroupData(
//         x: 0,
//         barsSpace: 4,
//         barRods: [
//           BarChartRodData(
//               toY: 5.5,
//               width: 40,
//               rodStackItems: [
//                 BarChartRodStackItem(0, 3, Color(0xff8347f5)),
//                 BarChartRodStackItem(3, 4, Color(0xffeeb542)),
//                 BarChartRodStackItem(4, 5.5, Color(0xff62c79b)),
//               ],
//               borderRadius: const BorderRadius.all(Radius.zero)),
//           BarChartRodData(
//               toY: 4.5,
//               width: 40,
//               rodStackItems: [
//                 BarChartRodStackItem(0, 3, Color(0xffbe60f2)),
//                 BarChartRodStackItem(3, 4.5, Color(0xff4faeda)),
//               ],
//               borderRadius: const BorderRadius.all(Radius.zero)),
//         ],
//       ),
//     ];
//   }
// }
