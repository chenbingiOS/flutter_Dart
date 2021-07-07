import 'dart:convert' as Convert;
import 'dart:io';
import 'package:http/http.dart' as http;

typedef RequestCallBack = void Function(Map map);

class HttpRequest {
  HttpRequest(this.baseUrl);
  final String baseUrl;

  static requestGET(
      String authority, String unencodedPath, RequestCallBack callBack,
      [Map<String, String> queryParameters]) async {
    try {
      var httpClient = HttpClient();
      var uri = Uri.http(authority, unencodedPath, queryParameters);
      var request = await httpClient.getUrl(uri);
      var response = await request.close();
      var responseBody = await response.transform(Convert.utf8.decoder).join();
      Map data = Convert.jsonDecode(responseBody);
      callBack(data);
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  Future<dynamic> get(String url, {Map<String, String> headers}) async {
    try {
      http.Response response =
          await http.get(Uri.parse(baseUrl + url), headers: headers);
      final statusCode = response.statusCode;
      final body = response.body;
      var result = Convert.jsonDecode(body);
      print('\n[uri=$url]\n[statusCode=$statusCode]\n[response=$body]\n');
      return result;
    } on Exception catch (e) {
      print('\n[uri=$url]\nexception e=${e.toString()}\n');
      return '';
    }
  }

  Future<dynamic> post(String url, dynamic body,
      {Map<String, String> headers}) async {
    try {
      http.Response response = await http.post(Uri.parse(baseUrl + url),
          body: body, headers: headers);
      final statusCode = response.statusCode;
      final responseBody = response.body;
      var result = Convert.jsonDecode(responseBody);
      print(
          '\n[uri=$url]\n[statusCode=$statusCode]\n[response=$responseBody]\n');
      return result;
    } on Exception catch (e) {
      print('\n[uri=$url]\nexception e=${e.toString()}\n');
      return '';
    }
  }
}
