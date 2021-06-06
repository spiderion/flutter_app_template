import 'package:flutter_app_template/core/data/dao.dart';
import 'package:template_package/template_package.dart';

class UserRepository extends BaseRepository {
  final Dao _dao;

  UserRepository(RemoteConfiguration remoteConfiguration, ExceptionCaptor exceptionCaptor, this._dao)
      : super(remoteConfiguration, exceptionCaptor);

  Future<ResultModel> getUsername() async {
    return exceptionCaptor.execute(() {
      // use this part to deserialize too
      final result = _dao.getUserName();
      if (result is String) {
        return ResultSuccess(result: result);
      } else {
        return ServerError(message: 'username_doesnt_exist');
      }
    });
  }
}
