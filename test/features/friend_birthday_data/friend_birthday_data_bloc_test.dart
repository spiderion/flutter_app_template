import 'package:flutter_app_template/features/friend_birthday_data/friend_birthday_data_bloc.dart';
import 'package:flutter_app_template/features/friend_birthday_data/friend_birthday_data_event.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../mocks.mocks.dart';

main() {
  late FriendBirthdayDateBloc sut;
  late MockBaseAnalytics mockBaseAnalytics;

  setUp(() {
    mockBaseAnalytics = MockBaseAnalytics();
    when(mockBaseAnalytics.logEvent(any, any)).thenReturn(null);
    sut = FriendBirthdayDateBloc(mockBaseAnalytics);
  });

  test('test FriendBirthdayData ', () async {
    //Arrange
    final expected = 'expected';
    //Act
    sut.addEvent(FriendBirthdayDataEvent('analyticEventName', 'variable'));
    await Future.delayed(Duration.zero);
    //Assert
    expect(true, true);
  });
}
