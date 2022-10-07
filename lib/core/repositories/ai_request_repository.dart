import 'package:flutter_app_template/core/data/dao.dart';
import 'package:flutter_app_template/core/models/ai_query.dart';
import 'package:flutter_app_template/core/models/ai_response.dart';
import 'package:flutter_app_template/core/services/http_service.dart';
import 'package:template_package/template_package.dart';

class AiRequestRepository extends BaseRepository {
  final Dao _dao;
  final HTTPService _httpService;

  AiRequestRepository(
    RemoteConfiguration remoteConfiguration,
    this._dao,
    this._httpService,
  ) : super(remoteConfiguration);

  Future<void> getSomeData(RequestObserver<AiQuery, AiResponse?> requestBehaviour) async {
    try {
      final result = await _httpService.completion(requestBehaviour.requestData?.toJson() ?? {});
      requestBehaviour.onListen?.call(AiResponse.fromJson(result));
    } catch (e, s) {
      requestBehaviour.onError?.call(ServerError(message: 'something_went_wrong'));
      LoggerDefault.log.i(e.toString());
      requestBehaviour.onDone?.call();
    }
  }

  Future<void> setSomeData(RequestObserver<AiQuery?, dynamic> requestBehaviour) async {
    try {
      final result = await _dao.setSomeData(requestBehaviour.requestData!.toJson());
      requestBehaviour.onListen?.call(result);
    } catch (e, s) {
      requestBehaviour.onError?.call(ServerError(message: e.toString()));
      LoggerDefault.log.i(e.toString());
      requestBehaviour.onDone?.call();
    }
  }
}
