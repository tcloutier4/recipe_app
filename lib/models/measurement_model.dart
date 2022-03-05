import 'dart:convert';

MeasurementsModel measurementsModelFromJson(String str) =>
    MeasurementsModel.fromJson(json.decode(str) as Map<String, dynamic>);

String measurementsModelToJson(MeasurementsModel data) =>
    json.encode(data.toJson());

class MeasurementsModel {
  MeasurementsModel({
    this.amount,
    this.unit,
  });

  double? amount;
  String? unit;

  factory MeasurementsModel.fromJson(Map<String, dynamic> json) {
    return MeasurementsModel(
      amount: json["amount"] as double,
      unit: json["unit"] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "unit": unit,
      };

  static List<MeasurementsModel> fromStringToList(String response) {
    final List<dynamic> items = json.decode(response) as List<dynamic>;
    final List<MeasurementsModel> measurementModels = items.map((item) {
      return MeasurementsModel.fromJson(item as Map<String, dynamic>);
    }).toList();

    return measurementModels;
  }

  MeasurementsModel copyWith({
    double? amount,
    String? unit,
  }) {
    return MeasurementsModel(
      amount: amount ?? this.amount,
      unit: unit ?? this.unit,
    );
  }

  @override
  String toString() {
    return "$amount\n$unit";
  }
}
