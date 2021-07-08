import 'package:flutter_douban/http/ComingSoonBean.dart';
import 'package:flutter_douban/http/HttpRequest.dart';
import 'package:flutter_douban/http/MovieBean.dart';

typedef RequestCallBack<T> = void Function(T value);

class API {
  // static String BASE_URL = 'https://api.douban.com';
  static String BASE_URL = 'https://frodo.douban.com';
  // static String BASE_URL = 'http://www.doubanapi.com';
  /// TOP250
  String TOP_250 = '/v2/movie/top250';

  /// 正在热映
  String IN_THEATERS = '/v2/movie/in_theaters';

  ///即将上映
  String COMING_SOON = '/v2/movie/coming_soon';

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

  ///即将上映
  void getCommingSoon(RequestCallBack requestCallBack) async {
    final Map result = await _request.get(COMING_SOON,
        headers: {"apikey": "0b2bdeda43b5688921839c8ecb20399b"});
    var resultList = result['subjects'];
    List<ComingSoonBean> list = resultList
        .map<ComingSoonBean>((item) => ComingSoonBean.fromMap(item))
        .toList();
    requestCallBack(list);
  }
}
