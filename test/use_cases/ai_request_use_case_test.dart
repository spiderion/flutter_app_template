import 'package:flutter_app_template/core/models/ai_query.dart';
import 'package:flutter_app_template/core/models/ai_response.dart';
import 'package:flutter_app_template/core/repositories/ai_request_repository.dart';
import 'package:flutter_app_template/core/use_cases/ai_request_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:template_package/template_package.dart';

import '../mocks.mocks.dart';

main() {
  late AiRequestUseCase sut;
  late AiRequestRepository aiRequestRepository;
  late MockRemoteConfiguration mockRemoteConfiguration;
  late MockHTTPService mockHttpService;
  late MockDao mockDao;

  setUp(() {
    mockDao = MockDao();
    mockRemoteConfiguration = MockRemoteConfiguration();
    mockHttpService = MockHTTPService();
    aiRequestRepository = AiRequestRepository(mockRemoteConfiguration, mockDao, mockHttpService);
    sut = AiRequestUseCase(aiRequestRepository);
  });

  test('test AiRequest on Success', () async {
    //Arrange
    AiResponse? expected = AiResponse.fromJson({AiResponse.model_key: 'model', AiResponse.choices_key: []});
    when(mockHttpService.completion(any)).thenAnswer((realInvocation) async {
      return {AiResponse.model_key: 'model', AiResponse.choices_key: []};
    });
    AiResponse? actual;
    //Act
    await sut.getSomeData(RequestObserver(
      requestData: 'prompt',
      onListen: (AiResponse? data) {
        actual = data;
      },
      onError: (Error error) {
        print('error');
      },
    ));
    await untilCalled(mockHttpService.completion(any));
    //Assert
    expect(actual?.toJson(), expected.toJson());
  });

  test('test AiRequest on Error', () async {
    //Arrange
    final errorMessage = 'error something went wrong';
    AiResponse? actual;
    Error? actualError;
    when(mockHttpService.completion(any)).thenAnswer((realInvocation) async {
      throw Exception(errorMessage);
    });
    Error? expected = ServerError(message: errorMessage);
    //Act
    await sut.getSomeData(RequestObserver(
      requestData:  'prompt',
      onListen: (AiResponse? data) {
        actual = data;
      },
      onError: (Error error) {
        actualError = error;
      },
    ));
    await untilCalled(mockHttpService.completion(any));
    //Assert
    expect(actual?.toJson(), null);
    expect(actualError?.message, "Exception: ${expected.message}");
    expect(actualError?.runtimeType, expected.runtimeType);
  });
}
