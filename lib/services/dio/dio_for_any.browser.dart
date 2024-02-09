import "package:planning_poker_any/common/settings.dart" as settings;
import "package:planning_poker_any/models/result.dart";
import "package:planning_poker_any/services/dio/dio_for_any.interface.dart";
import "package:dio/browser.dart";
import "package:dio/dio.dart";

DioForAny getDioForAny() => DioForAnyBrowser();

class DioForAnyBrowser extends DioForBrowser implements DioForAny {
  DioForAnyBrowser() {
    options.baseUrl = settings.apiUrl;
    options.contentType = Headers.formUrlEncodedContentType;
  }

  @override
  Future<Result> deleteResult(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await delete(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );

      return Result.fromResponse(
        response: response,
      );
    } catch (exception) {
      return Result.fromException(
        exception: exception,
      );
    }
  }

  @override
  Future<Result> getResult(
    String path, {
    Map<String, dynamic>? queryParameters,
    Object? data,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await get(
        path,
        queryParameters: queryParameters,
        data: data,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );

      return Result.fromResponse(
        response: response,
      );
    } catch (exception) {
      return Result.fromException(
        exception: exception,
      );
    }
  }

  @override
  Future<Result> patchResult(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await patch(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );

      return Result.fromResponse(
        response: response,
      );
    } catch (exception) {
      return Result.fromException(
        exception: exception,
      );
    }
  }

  @override
  Future<Result> postResult(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );

      return Result.fromResponse(
        response: response,
      );
    } catch (exception) {
      return Result.fromException(
        exception: exception,
      );
    }
  }
}
