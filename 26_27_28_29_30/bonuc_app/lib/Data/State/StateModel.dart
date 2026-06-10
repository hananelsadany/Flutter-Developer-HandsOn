import '../Models/Grocery_Item.dart';

class GroceryState {
  final dynamic error;
  final bool isLoading;
  final List<Grocery_Item> items;

  GroceryState({this.error, this.isLoading = false, this.items = const []});

  GroceryState copyWith({
    dynamic error,
    bool? isLoading,
    List<Grocery_Item>? items,
  }) {
    return GroceryState(
      error: error ?? this.error,
      isLoading: isLoading ?? this.isLoading,
      items: items ?? this.items,
    );
  }
}
