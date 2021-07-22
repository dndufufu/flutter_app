import 'dart:convert';

class BaseEntity<T> {
  T _data;
  int _code;
  String _msg;

  T get data => _data;

  int get errorCode => _code;

  String get errorMsg => _msg;

  BaseEntity(this._data, this._code, this._msg);

  factory BaseEntity.fromJson(
      Map<String, dynamic> json, T factory(Map<String, dynamic> data)) {
    var entity = BaseEntity(
        _deserialize(json['data'], factory), json['code'], json['msg']);
    return entity;
  }
}

T _deserialize<T>(
  Map<String, dynamic> json,
  T factory(Map<String, dynamic> data),
) {
  return factory(json);
}
