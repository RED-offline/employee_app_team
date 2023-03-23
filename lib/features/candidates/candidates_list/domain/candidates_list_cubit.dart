import 'package:bloc/bloc.dart';
import 'package:employee_app_team/features/candidates/candidates_list/data/api/users_provider.dart';
import 'package:employee_app_team/features/candidates/candidates_list/data/models/candidate_model.dart';
import 'package:flutter/material.dart';

part 'candidates_list_state.dart';

class CandidatesListCubit extends Cubit<CandidatesListState> {
  CandidatesListCubit({required UsersProvider usersProvider})
      : _usersProvider = usersProvider,
        super(CandidatesListLoading()) {
    loadInitialData();
  }

  final UsersProvider _usersProvider;

  Future<void> loadInitialData() async {
    final response = await _usersProvider.getUsers();
    response.when(
      data: (data) {
        emit(CandidatesListLoaded(candidates: data));
      },
      error: (_) {
        emit(CandidatesListError());
      },
    );
  }
}
