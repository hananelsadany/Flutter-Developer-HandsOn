import 'package:drift/drift.dart';
import 'package:bonuc_app/Data/Database/grocery_database.dart';

class Grocery_Item {
  final String id;
  final String name;
  final int quantity;
  final String category;

  const Grocery_Item({
    required this.id,
    required this.name,
    required this.quantity,
    required this.category,
  });

  factory Grocery_Item.fromJson(Map<String, dynamic> json) {
    return Grocery_Item(
      id: json['id'] as String,
      name: json['name'] as String,
      quantity: json['quantity'] as int,
      category: json['category'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'quantity': quantity, 'category': category};
  }

  GroceryItemsCompanion toCompanion() {
    return GroceryItemsCompanion(
      id: Value(int.parse(id)),
      name: Value(name),
      quantity: Value(quantity),
      category: Value(int.parse(category)),
    );
  }

  factory Grocery_Item.fromCompanion(GroceryItemsCompanion companion) {
    return Grocery_Item(
      id: companion.id.value.toString(),
      name: companion.name.value,
      quantity: companion.quantity.value,
      category: companion.category.value.toString(),
    );
  }
}
