// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';
//
//
// class AppLineChart extends StatefulWidget {
//   final List<FlSpot> spots;
//   final Color barColor;
//
//   const AppLineChart({
//     Key? key,
//     required this.spots,
//     required this.barColor,
//   }) : super(key: key);
//   @override
//   _LineChartState createState() => _LineChartState();
// }
//
// class _LineChartState extends State<AppLineChart> {
//   @override
//   Widget build(BuildContext context) {
//     return LineChart(
//       sampleData1(),
//       swapAnimationDuration: const Duration(milliseconds: 250),
//     );
//   }
//
//   LineChartData sampleData1() {
//     return LineChartData(
//       lineTouchData: LineTouchData(
//         touchTooltipData: LineTouchTooltipData(
//           tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
//         ),
//         // touchCallback: {},
//         handleBuiltInTouches: false,
//       ),
//       gridData: FlGridData(
//         show: false,
//       ),
//       titlesData: FlTitlesData(
//         show: false,
//       ),
//       borderData: FlBorderData(
//         show: false,
//       ),
//       minX: 0,
//       maxX: 14,
//       maxY: 4,
//       minY: 0,
//       lineBarsData: linesBarData1(),
//     );
//   }
//
//   List<LineChartBarData> linesBarData1() {
//     final lineChartBarData1 = LineChartBarData(
//       spots: widget.spots,
//       isCurved: true,
//       color: widget.barColor ?? Color(0xff4af69),
//       barWidth: 2,
//       isStrokeCapRound: true,
//       dotData: FlDotData(
//         show: false,
//       ),
//       belowBarData: BarAreaData(
//         show: false,
//       ),
//     );
//     return [
//       lineChartBarData1,
//     ];
//   }
// }
