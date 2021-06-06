import 'package:flutter_app_template/core/repositories/user_repository.dart';
import 'package:template_package/template_package.dart';

import 'core_sub_module.dart';

class RepositorySubModule extends ISubModule {
  late CoreSubModule _coreSubModule;

  @override
  init(List<ISubModule> subModules) {
    _coreSubModule = subModules.singleWhere((element) => element is CoreSubModule) as CoreSubModule;
  }

  UserRepository userRepository() =>
      UserRepository(_coreSubModule.remoteConfig(), _coreSubModule.exceptionCaptor(), _coreSubModule.dao());
}
