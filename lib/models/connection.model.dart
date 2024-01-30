class ConnectionModel {
  final String? userName;
  final String? code;
  final bool isConnected;

  const ConnectionModel({
    required this.userName,
    required this.code,
    required this.isConnected,
  });

  @override
  bool operator ==(Object other) =>
      (other is ConnectionModel) &&
      (other.runtimeType == runtimeType) &&
      (other.userName == userName) &&
      (other.code == code) &&
      (other.isConnected == isConnected);

  @override
  int get hashCode => Object.hash(
        userName,
        code,
        isConnected,
      );
}
