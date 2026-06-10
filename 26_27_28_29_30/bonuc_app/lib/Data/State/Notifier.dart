import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../Repo/Item_repository.dart';
import 'StateModel.dart';

import '../State/providers.dart';

class GroceryNotifier extends Notifier<GroceryState> {
  late final IRepo _repo;

  @override
  GroceryState build() {
    _repo = ref.read(itemRepoProvider);
    return GroceryState();
  }

  Future<void> loadItems() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final items = await _repo.getAll();
      state = state.copyWith(items: items, isLoading: false);
    } catch (e) {
      state = state.copyWith(error: e, isLoading: false);
    }
  }
}
