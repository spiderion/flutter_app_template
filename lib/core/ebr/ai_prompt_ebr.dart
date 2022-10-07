import 'package:flutter_app_template/core/models/celebrated.dart';

class AiPromptEBR {
  String createPrompt(Celebrated celebratedPerson) {
    var prompt =
        'Create birthday card letter for ${celebratedPerson.name}, His characteristics are: ${celebratedPerson.personalities.toString()} ';
    if (celebratedPerson.relationType?.isNotEmpty == true) {
      prompt = "$prompt this person is my: ${celebratedPerson.relationType}";
    }
    return prompt;
  }
}
