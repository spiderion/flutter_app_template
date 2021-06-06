import 'package:flutter_app_template/core/repositories/initial_repository.dart';
import 'package:template_package/template_package.dart';

class UserUseCase extends UseCase<ResultModel, ResultModel, InitialRepository> {
  UserUseCase(InitialRepository repository) : super(repository);

  Future<void> getUserName({Function(String resultData)? onSuccess, Function(Error error)? onError}) async {
    await Future.delayed(Duration(seconds: 7));
    final either = await repository.getSomeData();
    if (either is ResultSuccess) {
      onSuccess?.call(either.result);
    } else if (either is Error) {
      onError?.call(either);
    }
  }
}
