import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'shop_database.dart';
import '../Models/Grocery_Item.dart';
import 'package:path/path.dart' as p;
part 'grocery_database.g.dart';

@DriftDatabase(tables: [GroceryItems])
class GroceryDatabase extends _$GroceryDatabase {
  GroceryDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (Migrator m) {
      return m.createAll();
    },
  );

  Future<List<Grocery_Item>> getAllItems() async {
    return [];
  }

  Future<void> insertAll(List<Grocery_Item> remoteItems) async {}
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'app_database.db'));
    return NativeDatabase(file);
  });
}
