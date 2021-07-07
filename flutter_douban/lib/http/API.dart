import 'package:flutter_douban/http/HttpRequest.dart';
import 'package:flutter_douban/http/MovieBean.dart';

typedef RequestCallBack<T> = void Function(T value);

class API {
  static String BASE_URL = 'https://api.douban.com';
  // TOP250
  String TOP_250 = '/v2/movie/top250';
  // 正在热映
  String IN_THEATERS = '/v2/movie/in_theaters';

  var _request = HttpRequest(API.BASE_URL);

  void getTop250(RequestCallBack requestCallBack) async {
    final Map result = await _request.get(TOP_250);
    requestCallBack(result);
  }

  void getIntheaters(RequestCallBack requestCallBack) async {
    final Map result = await _request.get(IN_THEATERS);
    var reslutList = result['subjects'];
    List<MovieBean> list =
        reslutList.map<MovieBean>((item) => MovieBean.fromMap(item)).toList();
    requestCallBack(list);
  }
}
