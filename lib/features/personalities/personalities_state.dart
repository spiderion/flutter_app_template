import 'package:flutter_app_template/core/models/ui_models/item_text.dart';
import 'package:template_package/template_package.dart';

class PersonalitiesDataState extends BaseBlocDataState {
  final bool isButtonEnabled;
  final List<ItemText> personalities;

  PersonalitiesDataState(this.isButtonEnabled, this.personalities);

  List<String> getSelectedPersonalities() =>
      personalities.where((element) => element.isSelected).map((e) => e.name).toList();
}
