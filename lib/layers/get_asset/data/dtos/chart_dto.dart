// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'result_dto.dart';

class ChartDto {
  ResultDto? result;

  ChartDto({
    this.result,
  });

  factory ChartDto.fromMap(Map<String, dynamic> json) => ChartDto(
        result: json["result"] != null
            ? ResultDto.fromMap(json["result"][0])
            : null,
      );
}
