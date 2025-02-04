import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miles_and_more_clone/data_models/points/points_history_model.dart';
import 'package:miles_and_more_clone/features/account/account_repository.dart';

final accountProvider = StateNotifierProvider<AccountController,
    AsyncValue<List<PointHistoryModel>>>((ref) {
  final repository = ref.read(accountRepositoryProvider);
  return AccountController(repository);
});

class AccountController
    extends StateNotifier<AsyncValue<List<PointHistoryModel>>> {
  final AccountRepository _repository;

  AccountController(this._repository) : super(const AsyncValue.loading()) {
    fetchPointsHistory();
  }

  Future<void> fetchPointsHistory() async {
    try {
      final historyList = await _repository.fetchPointsHistory();
      state = AsyncValue.data(historyList);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}
