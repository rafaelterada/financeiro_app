import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../domain/entities/variation_entity.dart';

class GraphVariationPage extends StatelessWidget {
  const GraphVariationPage({super.key});

  @override
  Widget build(BuildContext context) {
    var asset = Get.arguments[0];
    List<VariationEntity> variationList = Get.arguments[1];

    var minX = 0.0;
    var maxX = 0.0;
    var maxY = 0.0;
    var minY = 0.0;
    var countX = 0.0;

    maxX = variationList.length - 1;
    maxY = variationList.map<double>((e) => e.value).reduce(max) + 1;
    minY = variationList.map<double>((e) => e.value).reduce(min) - 1;

    Widget bottomTitleWidgets(double value, TitleMeta meta) {
      if (value % 2 == 0) {
        var data = variationList[value.toInt()].dateTime;

        var text = Text(DateFormat("dd/MM/yy").format(data),
            style: const TextStyle(fontWeight: FontWeight.bold));

        return SideTitleWidget(
          axisSide: meta.axisSide,
          angle: 290,
          child: text,
        );
      }
      return Container();
    }

    var graphWidget = Padding(
      padding: const EdgeInsets.only(right: 30.0, top: 20.0),
      child: LineChart(LineChartData(
        gridData: FlGridData(
          show: true,
          drawVerticalLine: true,
          horizontalInterval: 1,
          verticalInterval: 1,
          getDrawingHorizontalLine: (value) {
            return FlLine(
              color: Colors.black,
              strokeWidth: 1,
            );
          },
          getDrawingVerticalLine: (value) {
            return FlLine(
              color: Colors.black,
              strokeWidth: 1,
            );
          },
        ),
        titlesData: FlTitlesData(
          show: true,
          rightTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 80,
              interval: 1,
              getTitlesWidget: bottomTitleWidgets,
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: 1,
              //getTitlesWidget: leftTitleWidgets,
              reservedSize: 50,
            ),
          ),
        ),
        borderData: FlBorderData(
          show: true,
          border: Border.all(color: Colors.black),
        ),
        minX: minX,
        maxX: maxX,
        minY: minY,
        maxY: maxY,
        lineBarsData: [
          LineChartBarData(
            spots: variationList.map((e) {
              var spot = FlSpot(countX, e.value);
              countX++;
              return spot;
            }).toList(),
            color: Colors.blue,
            isCurved: true,
            barWidth: 3,
            isStrokeCapRound: true,
            dotData: FlDotData(
              show: false,
            ),
            belowBarData: BarAreaData(
              show: true,
            ),
          ),
        ],
      )),
    );

    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
          appBar: AppBar(
              title: Text("Gráfico do Ativo $asset"),
              automaticallyImplyLeading: false,
              leading: IconButton(
                  onPressed: () => Get.back(),
                  padding: EdgeInsets.zero,
                  icon: const Icon(Icons.arrow_back_rounded))),
          body: graphWidget),
    );
  }
}
