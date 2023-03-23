part of 'candidates_list_cubit.dart';

@immutable
abstract class CandidatesListState {}

class CandidatesListLoading extends CandidatesListState {}

class CandidatesListLoaded extends CandidatesListState {
  CandidatesListLoaded({required this.candidates});

  final List<CandidateModel> candidates;
}

class CandidatesListError extends CandidatesListState {}
