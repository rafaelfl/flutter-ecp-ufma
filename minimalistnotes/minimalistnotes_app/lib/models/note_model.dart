class Note {
  int id;
  String title;
  String body;
  List<String> tags;

  Note({this.id, this.title, this.body, this.tags});

  Note.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    body = json['body'];
    tags = json['tags'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['body'] = this.body;
    data['tags'] = this.tags;
    return data;
  }
}
