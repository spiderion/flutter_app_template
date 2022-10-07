class AiQuery {
  final String model;
  final String prompt;
  final int? maxTokens;
  final int temperature;

  static const model_key = "model";
  static const prompt_key = "prompt";
  static const max_tokens_key = "max_tokens";
  static const temperature_key = "temperature";

  AiQuery({
    required this.model,
    required this.prompt,
    this.maxTokens,
    required this.temperature,
  });

  Map<String, dynamic> toJson() {
    return {
      model_key: model,
      prompt_key: prompt,
      max_tokens_key: maxTokens,
      temperature_key: temperature,
    };
  }

  AiQuery.fromJson(Map<String, dynamic> json)
      : model = json[model_key],
        prompt = json[prompt_key],
        maxTokens = json[max_tokens_key],
        temperature = json[temperature_key];
}
