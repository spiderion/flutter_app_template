import 'package:flutter_app_template/core/data/dao.dart';
import 'package:template_package/template_package.dart';

class InitialRepository extends BaseRepository {
  final Dao _dao;

  InitialRepository(RemoteConfiguration remoteConfiguration, ExceptionCaptor exceptionCaptor, this._dao)
      : super(remoteConfiguration, exceptionCaptor);

  Future<ResultModel> getSomeData() async {
    return exceptionCaptor.execute(() {
      // use this part to deserialize too
      final result = _dao.getSomeData();
      if (result is String) {
        return ResultSuccess(result: result);
      } else {
        return ServerError(message: 'data_was_not_previously_saved');
      }
    });
  }
}
