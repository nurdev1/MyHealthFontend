import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../config/responsive.dart';



class BarchartComponent extends StatelessWidget {
  const BarchartComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
          borderData: FlBorderData(show: false) ,
          alignment: BarChartAlignment.spaceBetween,
          axisTitleData: FlAxisTitleData(leftTitle: AxisTitle(reservedSize: 20)),
          gridData: FlGridData(drawHorizontalLine: true, horizontalInterval: 30),
          titlesData: FlTitlesData(leftTitles: SideTitles(reservedSize: 30, getTextStyles: (value) => const TextStyle(
              color: Colors.grey, fontSize: 12),showTitles: true,  getTitles: (value) {
            if (value == 0) {
              return '0';
            } else if (value == 30) {
              return '200';
            }  else if (value == 60) {
              return '400';
            }  else if (value == 90) {
              return '600';
            } else {
              return '';
            }
          },), bottomTitles: SideTitles(showTitles: true, getTextStyles: (value) => const TextStyle(
              color: Colors.grey, fontSize: 12), getTitles: (value) {
            if (value == 0) {
              return 'JAN';
            } else if (value == 1) {
              return 'FEV';
            }  else if (value == 2) {
              return 'MAR';
            }  else if (value == 3) {
              return 'APR';
            } else if (value == 4) {
              return 'MAY';
            }  else if (value == 5) {
              return 'JUN';
            }  else if (value == 6) {
              return 'JUL';
            }  else if (value == 7) {
              return 'AUT';
            }  else if (value == 8) {
              return 'SEP';
            }  else if (value == 9) {
              return 'OCT';
            }  else if (value == 10) {
              return 'NOV';
            }  else if (value == 11) {
              return 'DEC';
            }  else {
              return '';
            }
          }, )),
          barGroups: [
            BarChartGroupData(
                x: 0,
                barRods: [
                  BarChartRodData(y: 10, colors: [Colors.redAccent], borderRadius: BorderRadius.circular(2), width: Responsive.isDesktop(context) ? 10 : 10, backDrawRodData: BackgroundBarChartRodData(y: 90, show: true, colors: [Colors.blue])),
                ]
            ),
            BarChartGroupData(
                x: 1,
                barRods: [
                  BarChartRodData(y: 50, colors: [Colors.redAccent], borderRadius: BorderRadius.circular(2), width: Responsive.isDesktop(context) ? 10 : 10, backDrawRodData: BackgroundBarChartRodData(y: 90, show: true, colors: [Colors.blue]))
                ]
            ),
            BarChartGroupData(
                x: 2,
                barRods: [
                  BarChartRodData(y: 30, colors: [Colors.redAccent], borderRadius: BorderRadius.circular(2), width: Responsive.isDesktop(context) ? 10 : 10, backDrawRodData: BackgroundBarChartRodData(y: 90, show: true, colors: [Colors.blue]))
                ]
            ),
            BarChartGroupData(
                x: 3,
                barRods: [
                  BarChartRodData(y: 30, colors: [Colors.redAccent], borderRadius: BorderRadius.circular(2), width: Responsive.isDesktop(context) ? 10 : 10, backDrawRodData: BackgroundBarChartRodData(y: 90, show: true, colors: [Colors.blue]))
                ]
            ),
            BarChartGroupData(
                x: 4,
                barRods: [
                  BarChartRodData(y: 46, colors: [Colors.redAccent], borderRadius: BorderRadius.circular(2), width: Responsive.isDesktop(context) ? 10 : 10, backDrawRodData: BackgroundBarChartRodData(y: 90, show: true, colors: [Colors.blue]))
                ]
            ),
            BarChartGroupData(
                x: 5,
                barRods: [
                  BarChartRodData(y: 25, colors: [Colors.redAccent], borderRadius: BorderRadius.circular(2), width: Responsive.isDesktop(context) ? 10 : 10, backDrawRodData: BackgroundBarChartRodData(y: 90, show: true, colors: [Colors.blue]))
                ]
            ),
            BarChartGroupData(
                x: 6,
                barRods: [
                  BarChartRodData(y: 23, colors: [Colors.redAccent], borderRadius: BorderRadius.circular(2), width: Responsive.isDesktop(context) ? 10 : 10, backDrawRodData: BackgroundBarChartRodData(y: 90, show: true, colors: [Colors.blue]))
                ]
            ),
            BarChartGroupData(
                x: 7,
                barRods: [
                  BarChartRodData(y: 40, colors: [Colors.redAccent], borderRadius: BorderRadius.circular(2), width: Responsive.isDesktop(context) ? 10 : 10, backDrawRodData: BackgroundBarChartRodData(y: 90, show: true, colors: [Colors.blue]))
                ]
            ),
            BarChartGroupData(
                x: 8,
                barRods: [
                  BarChartRodData(y: 20, colors: [Colors.redAccent], borderRadius: BorderRadius.circular(2), width: Responsive.isDesktop(context) ? 10 : 10, backDrawRodData: BackgroundBarChartRodData(y: 90, show: true, colors: [Colors.blue]))
                ]
            ),
            BarChartGroupData(
                x: 9,
                barRods: [
                  BarChartRodData(y: 35, colors: [Colors.redAccent], borderRadius: BorderRadius.circular(2), width: Responsive.isDesktop(context) ? 10 : 10, backDrawRodData: BackgroundBarChartRodData(y: 90, show: true, colors: [Colors.blue]))
                ]
            ),
            BarChartGroupData(
                x: 10,
                barRods: [
                  BarChartRodData(y: 40, colors: [Colors.redAccent], borderRadius: BorderRadius.circular(2), width: Responsive.isDesktop(context) ? 10 : 10, backDrawRodData: BackgroundBarChartRodData(y: 90, show: true, colors: [Colors.blue]))
                ]
            ),
            BarChartGroupData(
                x: 11,
                barRods: [
                  BarChartRodData(y: 10, colors: [Colors.redAccent], borderRadius: BorderRadius.circular(2), width: Responsive.isDesktop(context) ? 10 : 10, backDrawRodData: BackgroundBarChartRodData(y: 90, show: true, colors: [Colors.blue]))
                ]
            ),
          ]

      ),
      swapAnimationDuration: Duration(milliseconds: 150), // Optional
      swapAnimationCurve: Curves.linear, // Optional
    );
  }
}