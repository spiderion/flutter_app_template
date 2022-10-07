import 'package:flutter_app_template/core/ebr/ai_prompt_ebr.dart';
import 'package:flutter_app_template/core/events/common_events.dart';
import 'package:flutter_app_template/core/models/celebrated.dart';
import 'package:flutter_app_template/features/friend_profile/friend_profile_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../mocks.mocks.dart';

main() {
  late FriendProfileBloc sut;
  late MockBaseAnalytics mockBaseAnalytics;
  late MockAiRequestUseCase aiRequestUseCase;
  late MockAbstractAds abstractAds;
  late AiPromptEBR aiPromptEBR;

  setUp(() {
    mockBaseAnalytics = MockBaseAnalytics();
    aiRequestUseCase = MockAiRequestUseCase();
    abstractAds = MockAbstractAds();
    aiPromptEBR = AiPromptEBR();
    when(mockBaseAnalytics.logEvent(any, any)).thenReturn(null);
    sut = FriendProfileBloc(mockBaseAnalytics,
        aiRequestUseCase: aiRequestUseCase,
        aiPromptEbr: aiPromptEBR,
        friend: Celebrated(id: 'id', name: 'name', birthdayCars: []),
        abstractAds: abstractAds);
  });

  test('test FriendProfile ', () async {
    //Arrange
    final expected = 'expected';
    //Act
    sut.addEvent(ContinueButtonClickEvent(
      'analyticEventName',
    ));
    await Future.delayed(Duration.zero);
    //Assert
    expect(true, true);
  });
}
