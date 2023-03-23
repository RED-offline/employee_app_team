import 'package:bloc/bloc.dart';
import 'package:employee_app_team/features/candidates/candidates_list/data/api/users_provider.dart';
import 'package:employee_app_team/features/candidates/candidates_list/domain/candidates_list_state.dart';

class CandidatesListCubit extends Cubit<CandidatesListState> {
  CandidatesListCubit({required UsersProvider usersProvider})
      : _usersProvider = usersProvider,
        super(const CandidatesListState.loading());

  final UsersProvider _usersProvider;

  Future<void> loadInitialData() async {
    final response = await _usersProvider.getUsers();
    response.when(
      data: (data) {
        emit(CandidatesListState.loaded(candidates: data));
      },
      error: (_) {
        emit(const CandidatesListState.error());
      },
    );
  }
}