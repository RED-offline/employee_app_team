import 'package:employee_app_team/features/candidates/candidates_list/data/api/users_provider.dart';
import 'package:employee_app_team/features/candidates/candidates_list/data/models/candidate_model.dart';
import 'package:employee_app_team/features/candidates/candidates_list/domain/candidates_list_cubit.dart';
import 'package:employee_app_team/features/candidates/candidates_list/presentation/candidates_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CandidateListPage extends StatelessWidget {
  CandidateListPage({super.key});

  final List<CandidateModel> candidates = [
    CandidateModel(
      uid: '973f133c-9d90-4d0a-8701-54af682645aa',
      firstName: 'Daren',
      lastName: 'Smith',
      email: 'daren.smith@email.com',
      avatar:
          'https://robohash.org/mollitiarerumdolor.png?size=300x300&set=set1',
      password: 'UztZAnELFO',
      username: 'daren.smith',
      phoneNumber: '+381 1-403-911-8339 x06142',
      employment: const Employment(title: 'Corporate Consulting Specialist'),
      dateOfBirth: DateTime.parse('1991-09-10'),
      address: const Address(city: 'South Marcellusside'),
    ),
    CandidateModel(
      uid: '470cb05b-af0d-4b91-aba9-250e9c189f27',
      firstName: 'Daren',
      lastName: 'Smith',
      email: 'daren.smith@email.com',
      avatar: 'https://robohash.org/auttemporibuset.png?size=300x300&set=set1',
      password: 'UztZAnELFO',
      username: 'daren.smith',
      phoneNumber: '+381 1-403-911-8339 x06142',
      employment: const Employment(title: 'Corporate Consulting Specialist'),
      dateOfBirth: DateTime.parse('1983-11-26'),
      address: const Address(city: 'South Marcellusside'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CandidatesListCubit>(
      create: (_) => CandidatesListCubit(usersProvider: UsersProvider())
        ..loadInitialData(),
      child: CandidatesListWidget(),
    );
  }
}
