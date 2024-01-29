class QueryStringModel {
  final String? userName;
  final String? token;

  QueryStringModel({
    required this.userName,
    required this.token,
  });

  QueryStringModel.fromMap(Map<String, String> queryParameters)
      : this(
          userName: queryParameters["user_name"],
          token: queryParameters["token"],
        );
}
