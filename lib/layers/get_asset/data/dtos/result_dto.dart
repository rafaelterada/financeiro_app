// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'indicators_dto.dart';

class ResultDto {
  List<int>? timestamp;
  IndicatorsDto indicators;

  ResultDto({
    this.timestamp,
    required this.indicators,
  });

  factory ResultDto.fromMap(Map<String, dynamic> json) => ResultDto(
        timestamp:
            json["timestamp"] != null ? json["timestamp"]!.cast<int>() : null,
        indicators: IndicatorsDto.fromMap(json["indicators"]),
      );
}
