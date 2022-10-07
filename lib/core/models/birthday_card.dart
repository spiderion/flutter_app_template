class BirthdayCard {
  final String id;
  final String text;

  static const id_key = "id";
  static const text_key = "text";

  BirthdayCard(this.id, this.text);

  Map<String, dynamic> toJson() {
    return {
      id_key: id,
      text_key: text,
    };
  }

  BirthdayCard.fromJson(Map<String, dynamic> json)
      : id = json[id_key],
        text = json[text_key];
}