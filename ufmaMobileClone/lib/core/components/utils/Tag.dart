class Tag {
  final String value;
  final String date;
  final String type;

  Tag({this.value, this.date, this.type});

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      value: json['value'] as String,
      date: json['date'] as String,
      type: json['type'] as String,
    );
  }
}
