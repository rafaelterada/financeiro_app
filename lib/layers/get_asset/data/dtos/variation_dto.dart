// ignore_for_file: public_member_api_docs, sort_constructors_first

import '../../domain/entities/variation_entity.dart';
import 'chart_dto.dart';

class VariationDto {
  ChartDto? chart;

  VariationDto({
    this.chart,
  });

  factory VariationDto.fromMap(Map<String, dynamic> json) => VariationDto(
        chart: json["chart"] != null ? ChartDto.fromMap(json["chart"]) : null,
      );

  List<VariationEntity> toListEntity() {
    List<VariationEntity> list = [];
    if (chart?.result?.timestamp == null ||
        chart?.result?.indicators.quote.close == null) {
      return list;
    }
    var timestampList = chart!.result!.timestamp!;

    for (var i = 0; i < timestampList.length; i++) {
      var time = timestampList[i];
      var value = chart!.result!.indicators.quote.close![i];
      var date = DateTime.fromMillisecondsSinceEpoch(time * 1000);
      var entity = VariationEntity(dateTime: date, value: value);
      list.add(entity);
    }
    return list;
  }

/*
  factory EquipmentHardwareDto.fromEntity(EquipmentHardwareEntity entity) =>
      EquipmentHardwareDto(
        ehar_identificador: entity.ehar_identificador,
        ehar_descricao: entity.ehar_descricao,
        ehar_status: entity.ehar_status,
      );*/
}
