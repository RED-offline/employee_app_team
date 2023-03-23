import 'package:employee_app_team/features/candidates/candidates_list/data/api/users_provider.dart';
import 'package:employee_app_team/features/candidates/candidates_list/domain/candidates_list_cubit.dart';
import 'package:employee_app_team/features/candidates/candidates_list/presentation/candidates_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CandidateListPage extends StatelessWidget {
  const CandidateListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CandidatesListCubit>(
      create: (_) => CandidatesListCubit(usersProvider: UsersProvider())
        ..loadInitialData(),
      child: const CandidatesListWidget(),
    );
  }
}
