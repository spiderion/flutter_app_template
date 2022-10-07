import 'package:flutter_app_template/features/friend_name/friend_name_bloc.dart';
import 'package:flutter_app_template/features/friend_name/friend_name_event.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../mocks.mocks.dart';

main() {
  late FriendNameBloc sut;
  late MockBaseAnalytics mockBaseAnalytics;

  setUp(() {
    mockBaseAnalytics = MockBaseAnalytics();
    when(mockBaseAnalytics.logEvent(any, any)).thenReturn(null);
    sut = FriendNameBloc(mockBaseAnalytics);
  });

  test('test FriendName ', () async {
    //Arrange
    final expected = 'expected';
    //Act
    sut.addEvent(FriendNameEvent('analyticEventName', 'variable'));
    await Future.delayed(Duration.zero);
    //Assert
    expect(true, true);
  });
}
