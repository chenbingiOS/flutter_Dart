import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:flutter_application_2/http_request.dart';

void main() {
  // requestNetwork();
  // httpNetwork();
  // dioNetwork();
  // dioConfigNetworkGet();
  dioConfigNetworkPost();
}

void requestNetwork() async {
  // 1.创建 HttpClient 对象
  final httpClient = HttpClient();

  // 2.构建请求的 URI
  final uri = Uri.parse('http://123.207.32.32:8000/api/v1/recommend');

  // 3.构建请求
  final request = await httpClient.getUrl(uri);

  // 4.发送请求，必须
  final response = await request.close();

  if (response.statusCode == HttpStatus.ok) {
    print(await response.transform(utf8.decoder).join());
  } else {
    print(response.statusCode);
  }
}

void httpNetwork() async {
  // 1.创建Client
  final client = http.Client();

  // 2.构建请求的 URI
  final uri = Uri.parse('http://123.207.32.32:8000/api/v1/recommend');

  // 3.发送请求
  final response = await client.get(uri);

  // 4.获取结果
  if (response.statusCode == HttpStatus.ok) {
    print(response.body);
  } else {
    print(response.statusCode);
  }
}

void dioNetwork() async {
  // 1.创建 Dio 对象
  final dio = Dio();

  // 2.发送网络请求
  final response = await dio.get("http://123.207.32.32:8000/api/v1/recommend");

  // 3.打印请求结果
  if (response.statusCode == HttpStatus.ok) {
    print(response.data);
  } else {
    print("请求失败 ${response.statusCode}");
  }
}

void dioConfigNetworkGet() {
  HttpRequest.request("https://httpbin.org/get",
      params: {"name": "why", "age": 18}).then((res) {
    print(res);
  });
}

void dioConfigNetworkPost() {
  HttpRequest.request("https://httpbin.org/post",
      method: "post", params: {"name": "why", "age": 18}).then((res) {
    print(res);
  });
}
