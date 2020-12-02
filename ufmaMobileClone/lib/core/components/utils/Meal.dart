class Meal {
  final String principal;
  final String vegan;
  final String cereal;
  final String vegetables;
  final String dessert;

  final String schedule;

  Meal._(
      {this.principal,
      this.vegan,
      this.cereal,
      this.vegetables,
      this.dessert,
      this.schedule});

  factory Meal.fromJson(Map<String, dynamic> json) {
    return new Meal._(
        principal: json['principal'],
        vegan: json['vegan'],
        cereal: json['cereal'],
        vegetables: json['vegetables'],
        dessert: json['dessert'],
        schedule: json['schedule']);
  }
}
