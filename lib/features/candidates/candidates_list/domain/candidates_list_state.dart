import 'package:employee_app_team/features/candidates/candidates_list/data/models/candidate_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'candidates_list_state.freezed.dart';

@freezed
class CandidatesListState with _$CandidatesListState {
  const factory CandidatesListState.loading() = Loading;
  const factory CandidatesListState.loaded({
    required List<CandidateModel> candidates,
  }) = Loaded;
  const factory CandidatesListState.error() = Error;
}