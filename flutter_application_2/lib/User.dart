class User {
  String nickname;
  int level;
  List<String> courses;
  String registerDate;
  Computer computer;

  User(
      {this.nickname,
      this.level,
      this.courses,
      this.registerDate,
      this.computer});

  User.fromJson(Map<String, dynamic> json) {
    nickname = json['nickname'];
    level = json['level'];
    courses = json['courses'].cast<String>();
    registerDate = json['register_date'];
    computer = json['computer'] != null
        ? new Computer.fromJson(json['computer'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nickname'] = this.nickname;
    data['level'] = this.level;
    data['courses'] = this.courses;
    data['register_date'] = this.registerDate;
    if (this.computer != null) {
      data['computer'] = this.computer.toJson();
    }
    return data;
  }
}

class Computer {
  String brand;
  int price;

  Computer({this.brand, this.price});

  Computer.fromJson(Map<String, dynamic> json) {
    brand = json['brand'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['brand'] = this.brand;
    data['price'] = this.price;
    return data;
  }
}
