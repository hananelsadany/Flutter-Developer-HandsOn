import 'package:dio/dio.dart';
import '../Models/Grocery_Item.dart';
import '../Database/grocery_database.dart';
import 'package:bonuc_app/Core/Failure/errorMapper.dart';

abstract class IRepo {
  Future<List<Grocery_Item>> getAll();
}
// Answer to Q28 & 27 & 26 Offline first and repo pattern.

class ItemRepo implements IRepo {
  final _dio;
  final GroceryDatabase _database;

  ItemRepo(this._dio, this._database);

  Future<List<Grocery_Item>> getAll() async {
    final localItems = await _database.getAllItems(); // always get local first
    if (localItems.isNotEmpty) return localItems;

    try {
      // try to update
      final response = await _dio.get('/items');
      final remoteItems = (response.data as List)
          .map((json) => Grocery_Item.fromJson(json))
          .toList();

      await _database.insertAll(remoteItems);
      return remoteItems;
    } on DioException catch (e) {
      throw ErrorMaper.mapErrorFromDio(e);
    }
  }
}
