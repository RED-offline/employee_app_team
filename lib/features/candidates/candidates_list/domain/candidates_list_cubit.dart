import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'candidates_list_state.dart';

class CandidatesListCubit extends Cubit<CandidatesListState> {
  CandidatesListCubit() : super(CandidatesListInitial()) {
    loadInitialData();
  }

  void loadInitialData() {
    print('updated');
  }
}
