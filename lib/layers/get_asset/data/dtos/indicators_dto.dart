// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'quote_dto.dart';

class IndicatorsDto {
  QuoteDto quote;

  IndicatorsDto({
    required this.quote,
  });

  factory IndicatorsDto.fromMap(Map<String, dynamic> json) => IndicatorsDto(
        quote: QuoteDto.fromMap(json["quote"][0]),
      );
}
