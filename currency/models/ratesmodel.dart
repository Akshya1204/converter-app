import 'dart:convert';

RatesModel ratesModelFromJson(String str) =>
    RatesModel.fromJson(json.decode(str));

String ratesModelToJson(RatesModel data) => json.encode(data.toJson());

class RatesModel {
  Meta meta;
  Map<String, Datum> data;

  RatesModel({
    required this.meta,
    required this.data,
  });

  factory RatesModel.fromJson(Map<String, dynamic> json) => RatesModel(
        meta: Meta.fromJson(json["meta"]),
        data: Map.from(json["data"])
            .map((k, v) => MapEntry<String, Datum>(k, Datum.fromJson(v))),
      );

  Map<String, dynamic> toJson() => {
        "meta": meta.toJson(),
        "data": Map.from(data)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
      };
}

class Datum {
  String code;
  double value;

  Datum({
    required this.code,
    required this.value,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        code: json["code"],
        value: json["value"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "value": value,
      };
}

class Meta {
  DateTime lastUpdatedAt;

  Meta({
    required this.lastUpdatedAt,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        lastUpdatedAt: DateTime.parse(json["last_updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "last_updated_at": lastUpdatedAt.toIso8601String(),
      };
}
