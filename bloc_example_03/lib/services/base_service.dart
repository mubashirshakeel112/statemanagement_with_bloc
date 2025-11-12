import 'dart:io';

abstract class BaseService {
  Map<String, String> payLoad = {
    HttpHeaders.acceptHeader: 'application/json',
    HttpHeaders.contentTypeHeader: 'application/json',
  };

  void addTokenToPayload(String token) {
    payLoad.addAll({'Authorization': 'Bearer $token'});
  }
}
