import 'package:flutter_application_2/User.dart';

void main(List<String> args) {
  final user = User.fromJson(jsonInfo);
  print(user.computer.brand);
  print(user.nickname);
  print(user.courses);
  print(user.registerDate);
}

final jsonInfo = {
  "nickname": "coderwhy",
  "level": 18,
  "courses": ["语文", "数学", "英语"],
  "register_date": "2222-2-22",
  "computer": {"brand": "MackBook", "price": 1000}
};
