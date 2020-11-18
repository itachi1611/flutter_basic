import 'dart:convert';

import 'package:f02_pos/model/api/api-config.dart';
import 'package:f02_pos/model/dto/category.dart';
import 'package:http/http.dart' as http;

class CategoryApi {
  final String _api = ApiConfig().api("categories");

  Future<List<Category>> getAll() async {
    var value = await http.get(_api);
    return categoryFromJson(value.body);
  }

  Future<int> count() async {
    var value = await http.get("$_api/count");
    return json.decode(value.body);
  }

  Future<Category> findById(int id) async {
    var value = await http.get("$_api/$id");
    return Category.fromJson(json.decode(value.body));
  }

  Future<Category> save(Category c) async {
    return c.id == null ? _create(c) : _update(c);
  }

  Future<Category> _create(Category c) async {
    var value = await http.post(_api, body: json.encode(c.toJson()), headers: {
      'Content-Type': 'application/json; charset=UTF-8',
    });
    return Category.fromJson(json.decode(value.body));
  }

  Future<Category> _update(Category c) async {
    var value = await http.put(_api, body: json.encode(c.toJson()), headers: {
      'Content-Type': 'application/json; charset=UTF-8',
    });
    return Category.fromJson(json.decode(value.body));
  }
}
