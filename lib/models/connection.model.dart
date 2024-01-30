class ConnectionModel {
  final String? userName;
  final String? token;
  final bool isConnected;

  const ConnectionModel({
    required this.userName,
    required this.token,
    required this.isConnected,
  });

  @override
  bool operator ==(Object other) =>
      (other is ConnectionModel) &&
      (other.runtimeType == runtimeType) &&
      (other.userName == userName) &&
      (other.token == token) &&
      (other.isConnected == isConnected);

  @override
  int get hashCode => Object.hash(
        userName,
        token,
        isConnected,
      );
}
