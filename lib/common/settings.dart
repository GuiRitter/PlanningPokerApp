import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:planning_poker_any/services/dio/dio_for_any.interface.dart';

final DioForAny api = DioForAny();

apiLog(String content) => api.postResult(
      "",
      cancelToken: CancelToken(),
      data: {
        "content": "${DateTime.now().toIso8601String()} $content",
      },
    );

const apiUrl = "http://localhost:56328/";

const error = "error";

const domain = "guilherme-alan-ritter.net";

const appName = "planning_poker";

const themeKey = "theme";

final GlobalKey<NavigatorState> navigatorState = GlobalKey<NavigatorState>();

final GlobalKey<ScaffoldMessengerState> snackState =
    GlobalKey<ScaffoldMessengerState>();
