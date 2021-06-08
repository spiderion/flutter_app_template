import 'package:flutter_app_template/core/models/some_model.dart';
import 'package:flutter_app_template/core/repositories/initial_repository.dart';
import 'package:template_package/template_package.dart';

class SomeUseCase extends UseCase<ResultModel, ResultModel, InitialRepository> {
  SomeUseCase(InitialRepository repository) : super(repository);

  Future<void> getSomeData({Function(SomeModel someModel)? onSuccess, Function(Error error)? onError}) async {
    final either = await repository.getSomeData();
    if (either is ResultSuccess) {
      onSuccess?.call(either.result);
    } else if (either is Error) {
      onError?.call(either);
    }
  }

  Future<void> setSomeData(SomeModel someModel, {Function()? onSuccess, Function(Error error)? onError}) async {
    final either = await repository.setSomeData(someModel);
    if (either is ResultSuccess) {
      onSuccess?.call();
    } else if (either is Error) {
      onError?.call(either);
    }
  }
}
