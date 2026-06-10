import 'package:dio/dio.dart';
import '../Repo/Item_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../Database/grocery_database.dart';

// Dio provider
final dioProvider = Provider<Dio>((ref) => Dio());

// DB provider
final databaseProvider = Provider<GroceryDatabase>((ref) => GroceryDatabase());

final itemRepoProvider = Provider<IRepo>((ref) {
  final dio = ref.read(dioProvider);
  final database = ref.read(databaseProvider);
  return ItemRepo(dio, database);
});
