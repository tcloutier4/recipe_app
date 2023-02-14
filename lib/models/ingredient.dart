import 'package:hive/hive.dart';
part 'ingredient.g.dart';

@HiveType(typeId: 1)
class Ingredient extends HiveObject {
  Ingredient({
    this.name = 'Missing ingredient name',
    this.amount = 1,
    this.unit = '',
    this.tag = '',
  });
  @HiveField(0)
  String name;
  @HiveField(1)
  double amount;
  @HiveField(2)
  String unit;
  @HiveField(3)
  String tag;

  String displayAmount() {
    //To remove trailing 0 from amount
    RegExp regex = RegExp(r'([.]*0)(?!.*\d)');
    String display = '${amount.toString().replaceAll(regex, '')}$unit';

    return display;
  }

  String displayIngredient() {
    //To remove trailing 0 from amount
    RegExp regex = RegExp(r'([.]*0)(?!.*\d)');
    String display = '${amount.toString().replaceAll(regex, '')}$unit $name';

    return display;
  }

  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(
      name: json["name"],
      amount: json["amount"],
      unit: json["unit"],
      tag: json["tag"],
    );
  }

  factory Ingredient.deepCopy(Ingredient ingredient) => Ingredient(
        amount: ingredient.amount,
        name: ingredient.name,
        unit: ingredient.unit,
        tag: ingredient.tag,
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "amount": amount,
        "unit": unit,
        "tag": tag,
      };

  @override
  String toString() {
    return "name: $name amount: $amount unit: $unit tag: $tag";
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Ingredient &&
        other.name == name &&
        other.amount == amount &&
        other.unit == unit &&
        other.tag == tag;
  }

  bool sameIngredient(Object other) {
    if (identical(this, other)) return true;

    return other is Ingredient &&
        other.name == name &&
        other.unit == unit &&
        other.tag == tag;
  }

  @override
  int get hashCode {
    return name.hashCode ^ amount.hashCode ^ unit.hashCode ^ tag.hashCode;
  }
}
