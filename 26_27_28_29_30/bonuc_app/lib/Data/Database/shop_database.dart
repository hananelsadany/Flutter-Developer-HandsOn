import 'package:drift/drift.dart';

class GroceryItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  IntColumn get quantity => integer()();
  IntColumn get category => integer()();
}
