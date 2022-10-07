import 'package:flutter_app_template/core/models/choice.dart';

class AiResponse {
  final String model;
  final List<Choice> choices;

  static const id_key = "id";
  static const model_key = "model";
  static const choices_key = "choices";

  Map<String, dynamic> toJson() {
    return {
      model_key: model,
      choices_key: choices.map((e) => e.toJson()),
    };
  }

  AiResponse.fromJson(Map<String, dynamic> json)
      : model = json[model_key],
        choices = (json[choices_key] as List?)?.map((e) => Choice.fromJson(e)).toList() ?? [];
}
