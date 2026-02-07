class ServerException implements Exception {
  final String message;

  ServerException({this.message = 'An error occurred while fetching data from the server.'});

  @override
  String toString() => 'ServerException: $message';
}