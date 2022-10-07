import 'package:dio/dio.dart';
import 'package:flutter_app_template/core/constants/key_constants.dart';
import 'package:flutter_app_template/core/interceptors/default_interceptor.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../mocks.mocks.dart';

main() {
  late ApiInterceptor sut;
  late MockRemoteConfiguration mockRemoteConfiguration;

  setUp(() {
    mockRemoteConfiguration = MockRemoteConfiguration();
    sut = ApiInterceptor(remoteConfiguration: mockRemoteConfiguration);
  });

  test('when onRequest is called then Authorization is added to headers', () async {
    //Arrange
    const token = 'TOKEN';
    const expected = 'Bearer $token';
    final Map<String, dynamic> headers = {};
    final requestOptions = RequestOptions(path: 'path', headers: headers);
    when(mockRemoteConfiguration.getString(ConfigKeyConstants.OPEN_AI_KEY)).thenReturn(token);
    //Act
    sut.onRequest(requestOptions, RequestInterceptorHandler());
    await untilCalled(mockRemoteConfiguration.getString(ConfigKeyConstants.OPEN_AI_KEY));
    final actual = requestOptions.headers['Authorization'];
    //Assert
    expect(actual, expected);
  });
}
