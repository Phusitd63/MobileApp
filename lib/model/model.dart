class Model {
  String name;
  String detail;
  String num;
  String date;

  Model(this.name, this.detail, this.num, this.date);

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'detail': detail,
      'num': num,
      'date': date,
    };
  }
}
