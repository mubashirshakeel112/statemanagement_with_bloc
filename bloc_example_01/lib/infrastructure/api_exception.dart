class ApiException implements Exception{
  String methodName;
  int statusCode;
  String message;

  ApiException(this.methodName, this.statusCode, this.message);

  @override
  String toString() {
    return '$methodName -- StatusCode: $statusCode -- Response: $message';
  }
}