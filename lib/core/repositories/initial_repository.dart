import 'package:flutter_app_template/core/data/dao.dart';
import 'package:flutter_app_template/core/models/some_model.dart';
import 'package:template_package/template_package.dart';

class InitialRepository extends BaseRepository {
  final Dao _dao;

  InitialRepository(RemoteConfiguration remoteConfiguration, ExceptionCaptor exceptionCaptor, this._dao)
      : super(remoteConfiguration, exceptionCaptor);

  Future<ResultModel> getSomeData() async {
    return exceptionCaptor.execute(() async {
      final result = await _dao.getSomeData();
      return ResultSuccess(result: SomeModel.fromJson(result));
    });
  }

  Future<ResultModel> setSomeData(SomeModel someData) async {
    return exceptionCaptor.execute(() {
      final result = _dao.setSomeData(someData.toJson());
      return ResultSuccess(result: result);
    });
  }
}
