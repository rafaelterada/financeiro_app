// ignore_for_file: public_member_api_docs, sort_constructors_first
class QuoteDto {
  List<double>? close;

  QuoteDto({
    this.close,
  });

  factory QuoteDto.fromMap(Map<String, dynamic> json) => QuoteDto(
        close: json["close"]?.cast<double>(),
      );
}
