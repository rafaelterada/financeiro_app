import 'package:financeiro_app/core/domain/entities/variation_entity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ListVariationPage extends StatelessWidget {
  const ListVariationPage({super.key});

  @override
  Widget build(BuildContext context) {
    var asset = Get.arguments[0];
    List<VariationEntity> variationList = Get.arguments[1];

    var titleStyle = const TextStyle(fontWeight: FontWeight.bold);
    double? firstValue;
    double? lastValue;

    var variationWidget = Column(
      children: [
        Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, top: 10),
            child: Row(children: [
              Expanded(
                  child: Text("Data",
                      style: titleStyle, textAlign: TextAlign.center)),
              Expanded(
                  child: Text("Valor",
                      style: titleStyle, textAlign: TextAlign.center)),
              Expanded(
                  child: Text("Var. D-1",
                      style: titleStyle, textAlign: TextAlign.center)),
              Expanded(
                  child: Text("Var. Prim. Data",
                      style: titleStyle, textAlign: TextAlign.center))
            ])),
        Expanded(
            child: ListView.separated(
                separatorBuilder: (context, index) =>
                    const Divider(color: Colors.black),
                itemCount: variationList.length,
                padding: const EdgeInsets.all(8),
                itemBuilder: (BuildContext ctct, int index) {
                  var variation = variationList[index];

                  //d1=>variação d-1
                  //dp=>variação em relação ao primeiro dia
                  var d1 = 0.0;
                  var dp = 0.0;

                  if (variation.value == 0) {
                    d1 = 0.0;
                    dp = 0.0;
                  } else if (lastValue != null) {
                    //depois da primeira linha
                    d1 = variation.value / lastValue!;
                    dp = variation.value / firstValue!;
                  }

                  d1 = (d1 - 1) * 100;
                  dp = (dp - 1) * 100;

                  var textStyle =
                      const TextStyle(fontWeight: FontWeight.normal);

                  var widget = Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Container(
                          padding: const EdgeInsets.only(top: 8, bottom: 8),
                          child: Row(children: [
                            Expanded(
                              child: Text(
                                  DateFormat("dd/MM/y")
                                      .format(variation.dateTime),
                                  style: textStyle,
                                  textAlign: TextAlign.center),
                            ),
                            Expanded(
                              child: Text(
                                  "R\$ ${NumberFormat("#,##0.0000", "pt_BR").format(variation.value)}",
                                  style: textStyle,
                                  textAlign: TextAlign.center),
                            ),
                            Expanded(
                              child: Text(
                                  index == 0
                                      ? "-"
                                      : "${NumberFormat("0.00", "pt_BR").format(d1)}%",
                                  style: textStyle,
                                  textAlign: TextAlign.center),
                            ),
                            Expanded(
                              child: Text(
                                  index == 0
                                      ? "-"
                                      : "${NumberFormat("0.00", "pt_BR").format(dp)}%",
                                  style: textStyle,
                                  textAlign: TextAlign.center),
                            )
                          ])));

                  if (index == 0) {
                    firstValue = variation.value;
                  }
                  lastValue = variation.value;

                  return widget;
                })),
      ],
    );

    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
          appBar: AppBar(
              title: Text("Variação do Ativo $asset"),
              automaticallyImplyLeading: false,
              leading: IconButton(
                  onPressed: () => Get.back(),
                  padding: EdgeInsets.zero,
                  icon: const Icon(Icons.arrow_back_rounded))),
          body: variationWidget),
    );
  }
}
