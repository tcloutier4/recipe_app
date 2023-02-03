class Ingredient {
  Ingredient({
    this.id,
    this.name = 'Missing ingredient name',
    this.amount = 1,
    this.unit = '',
    this.tag = '',
  });

  String? id;
  String name;
  double amount;
  String unit;
  String tag;

  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(
      id: json["id"],
      name: json["name"],
      amount: json["amount"],
      unit: json["unit"],
      tag: json["tag"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "amount": amount,
        "unit": unit,
        "tag": tag,
      };

  @override
  String toString() {
    return "id: $id name: $name amount: $amount unit: $unit tag: $tag";
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Ingredient &&
        other.id == id &&
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
    return id.hashCode ^
        name.hashCode ^
        amount.hashCode ^
        unit.hashCode ^
        tag.hashCode;
  }
}
