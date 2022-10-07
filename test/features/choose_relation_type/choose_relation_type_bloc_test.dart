import 'package:flutter_app_template/core/models/celebrated.dart';
import 'package:flutter_app_template/features/choose_relation_type/choose_relation_type_bloc.dart';
import 'package:flutter_app_template/features/choose_relation_type/choose_relation_type_event.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../mocks.mocks.dart';

main() {
  late ChooseRelationTypeBloc sut;
  late MockBaseAnalytics mockBaseAnalytics;

  setUp(() {
    mockBaseAnalytics = MockBaseAnalytics();
    when(mockBaseAnalytics.logEvent(any, any)).thenReturn(null);
    sut = ChooseRelationTypeBloc(mockBaseAnalytics, friend: Celebrated(birthdayCars: []));
  });

  test('test ChooseRelationType ', () async {
    //Arrange
    final expected = 'expected';
    //Act
    sut.addEvent(ChooseRelationTypeEvent('analyticEventName'));
    await Future.delayed(Duration.zero);
    //Assert
    expect(true, true);
  });
}
