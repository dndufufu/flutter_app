import 'package:flutter/cupertino.dart';

import 'base_entity.dart';

class BaseListEntity<T> {
  List<T> data = [];
  int _code;
  String _msg;
  int _offset = 0;
  int _pageSize = -1;
  int _total = 0;

  int get code => _code;

  String get msg => _msg;

  int get offset => _offset;

  int get pageSize => _pageSize;

  int get total => _total;

  BaseListEntity(this._code, this._msg);

  factory BaseListEntity.fromJson(
      Map<String, dynamic> json, T factory(Map<String, dynamic> data)) {
    var entity = BaseListEntity<T>(json['code'], json['msg']);
    entity._offset = json['offset'];
    entity._pageSize = json['page-size'];
    entity._total = json['total'] != null ? json['total'] : -1;
    entity.data = _deserialize(json['data'], factory);
    return entity;
  }
}

List<T> _deserialize<T>(
  List<dynamic> json,
  T factory(Map<String, dynamic> data),
) {
  return json.map((e) => factory(e)).toList();
}
