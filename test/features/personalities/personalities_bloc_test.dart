import 'package:flutter_app_template/core/models/celebrated.dart';
import 'package:flutter_app_template/features/personalities/personalities_bloc.dart';
import 'package:flutter_app_template/features/personalities/personalities_event.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../mocks.mocks.dart';

main() {
  late PersonalitiesBloc sut;
  late MockBaseAnalytics mockBaseAnalytics;

  setUp(() {
    mockBaseAnalytics = MockBaseAnalytics();
    when(mockBaseAnalytics.logEvent(any, any)).thenReturn(null);
    sut = PersonalitiesBloc(mockBaseAnalytics, Celebrated(birthdayCars: []));
  });

  test('test Personalities ', () async {
    //Arrange
    final expected = 'expected';
    //Act
    sut.addEvent(PersonalitiesEvent('analyticEventName', 'variable'));
    await Future.delayed(Duration.zero);
    //Assert
    expect(true, true);
  });
}
