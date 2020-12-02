class Tag {
  final String value;
  final String date;
  final String type;
  Tag._({this.value, this.date, this.type});

  factory Tag.fromJson(Map<String, dynamic> json) {
    return new Tag._(
        value: json['value'], date: json['date'], type: json['type']);
  }
}
