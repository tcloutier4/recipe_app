import 'package:recipe_app/models/measurement_model.dart';

class IngredientsModel {
  IngredientsModel({
    this.id,
    this.name,
    this.measurement,
  });

  String? id;
  String? name;
  MeasurementsModel? measurement;
}
