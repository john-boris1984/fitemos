import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class NetworkUtil {
  // next three lines makes this class a Singleton
  static NetworkUtil _instance = new NetworkUtil.internal();
  NetworkUtil.internal();
  factory NetworkUtil() => _instance;

  final JsonDecoder _decoder = new JsonDecoder();

  Future<dynamic> get(String url, String accessToken, {Map body}) {
    return http.get(url, headers: {HttpHeaders.authorizationHeader: "Bearer " + accessToken})
      .then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;
      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw new Exception("Error while fetching data");
      }
      return _decoder.convert(res);
    });
  }

  Future<dynamic> getWithParams(String root, String apiUri, String accessToken, dynamic body) async {
    var uri = Uri.http(root, apiUri, body);
    return http.get(uri, headers: {HttpHeaders.authorizationHeader: "Bearer " + accessToken})
        .then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;
      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw new Exception("Error while fetching data");
      }
      return _decoder.convert(res);
    });
  }

  Future<dynamic> putWithParams(String root, String apiUri, String accessToken, dynamic body) async {
    var uri = Uri.http(root, apiUri, body);
    return http.put(uri, headers: {HttpHeaders.authorizationHeader: "Bearer " + accessToken})
        .then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;
      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw new Exception("Error while fetching data");
      }
      return _decoder.convert(res);
    });
  }

  Future<dynamic> deleteWithAccessToken(String root, String apiUri, String accessToken, dynamic body) async {
    var uri = Uri.http(root, apiUri, body);
    return http.delete(uri, headers: {HttpHeaders.authorizationHeader: "Bearer " + accessToken})
        .then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;
      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw new Exception("Error while fetching data");
      }
      return _decoder.convert(res);
    });
  }

  Future<dynamic> post(String url, {Map headers, body}) {
    return http
        .post(url, body: body, headers: headers, )
        .then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;
      print(response.statusCode);
      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw new Exception("Error while fetching data");
      }
      return _decoder.convert(res);
    });
  }

  Future<dynamic> postWithAccessToken(String url, String accessToken, {Map body, encoding}) {
    return http
        .post(url, body: body, headers: {HttpHeaders.authorizationHeader: "Bearer " + accessToken})
        .then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;
      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw new Exception("Error while fetching data");
      }
      return _decoder.convert(res);
    });
  }

  Future<dynamic> uploadAvatarImage(String url, String accessToken, File img) async {
    Map<String, String> headers = { HttpHeaders.authorizationHeader: "Bearer " + accessToken};
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.headers.addAll(headers);
    request.files.add(await http.MultipartFile.fromPath('image', img.path));
    await request.send().then((response) {
      if (response.statusCode == 200) return _decoder.convert('{"status":"true"}');
      else return _decoder.convert('{"status":"false"}');
    });
  }

  Future<File> getDownload(String root, String apiUri, String accessToken, dynamic body, String filePath, String itemId) async {
    print(filePath + '/voucher('+ itemId +').pdf');
    final File file = File(filePath + '/voucher('+ itemId +').pdf');
    var uri = Uri.http(root, apiUri, body);
    return http.get(uri, headers: {HttpHeaders.authorizationHeader: "Bearer " + accessToken})
        .then((http.Response response) async{
      await file.writeAsBytes(response.bodyBytes);
      final int statusCode = response.statusCode;
      print(statusCode);
      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw new Exception("Error while fetching data");
      }
      return file;
    });
  }

  Future<dynamic> postWithAccessTokenByDynamic(String url, String accessToken, {Map body, encoding}) {
    var data = json.encode(body);
    return http
        .post(url, body: data, headers: {HttpHeaders.authorizationHeader: "Bearer " + accessToken, "Content-Type": "application/json"})
        .then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw new Exception("Error while fetching data");
      }
      return _decoder.convert(res);
    });
  }

}