import 'package:flutter_app_template/core/models/ai_query.dart';
import 'package:flutter_app_template/core/models/ai_response.dart';
import 'package:flutter_app_template/core/repositories/ai_request_repository.dart';
import 'package:template_package/template_package.dart';

class AiRequestUseCase extends UseCase<AiRequestRepository> {
  final model = "text-davinci-002";

  AiRequestUseCase(AiRequestRepository repository) : super(repository);

  Future<void> getSomeData(RequestObserver<dynamic, AiResponse?> requestObserver) async {
    await repository.getSomeData(RequestObserver<AiQuery, AiResponse?>(
        requestData: AiQuery(
          prompt: requestObserver.requestData,
          model: model,
          maxTokens: 150,
          temperature: 1,
        ),
        onListen: (AiResponse? data) {
          requestObserver.onListen?.call(data);
        },
        onError: requestObserver.onError));
  }

  Future<void> setSomeData(RequestObserver<AiQuery?, dynamic> requestBehaviour) async {
    await repository.setSomeData(RequestObserver<AiQuery?, dynamic>(
        requestData: requestBehaviour.requestData,
        onListen: (_) {
          requestBehaviour.onListen?.call(_);
        },
        onError: requestBehaviour.onError));
  }
}
