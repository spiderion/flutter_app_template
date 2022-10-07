class Choice {
  final int index;
  final String text;

  static const index_key = "index";
  static const text_key = "text";

  Choice(this.index, this.text);

  Map<String, dynamic> toJson() {
    return {
      index_key: index,
      text_key: text,
    };
  }

  Choice.fromJson(Map<String, dynamic> json)
      : index = json[index_key],
        text = json[text_key];
}
