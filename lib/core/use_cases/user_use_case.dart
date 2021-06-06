import 'package:flutter_app_template/core/repositories/user_repository.dart';
import 'package:template_package/template_package.dart';

class UserUseCase extends UseCase<ResultModel, ResultModel, UserRepository> {
  UserUseCase(UserRepository repository) : super(repository);

  Future<void> getUserName({Function(String resultData)? onSuccess, Function(Error error)? onError}) async {
    final either = await repository.getUsername();
    if (either is ResultSuccess) {
      onSuccess?.call(either.result);
    } else if (either is Error) {
      onError?.call(either);
    }
  }
}
