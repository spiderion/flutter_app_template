import 'package:dependency_provider/base_sub_module.dart';
import 'package:flutter_app_template/core/ebr/ai_prompt_ebr.dart';
import 'package:flutter_app_template/dependency/sub_modules/core_sub_module.dart';
import 'package:flutter_app_template/dependency/sub_modules/value_notifier_sub_module.dart';
import 'package:template_package/template_package.dart';

class EBRSubModule implements ISubModule {
  late CoreSubModule _coreSubModule;
  late ValueNotifierSubModule _valueNotifierSubModule;

  @override
  init(List<ISubModule> subModules) {
    _coreSubModule = subModules.whereType<CoreSubModule>().first;
    _valueNotifierSubModule = subModules.whereType<ValueNotifierSubModule>().first;
  }

  AiPromptEBR aiPromptEBR() => AiPromptEBR();
}
