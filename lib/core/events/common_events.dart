import 'package:template_package/template_package.dart';

class ContinueButtonClickEvent extends BaseBlocEvent {
  ContinueButtonClickEvent(String eventName) : super(eventName);
}

class TextChangeEvent extends BaseBlocEvent {
  final String text;

  TextChangeEvent(this.text) : super('');
}
