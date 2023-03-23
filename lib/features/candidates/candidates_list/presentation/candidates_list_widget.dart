import 'package:employee_app_team/features/candidates/candidates_list/data/models/candidate_model.dart';
import 'package:employee_app_team/features/candidates/candidates_list/domain/candidates_list_cubit.dart';
import 'package:employee_app_team/features/candidates/candidates_list/domain/candidates_list_state.dart';
import 'package:employee_app_team/features/candidates/candidates_list/presentation/candidate_tile.dart';
import 'package:employee_app_team/l10n/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class CandidatesListWidget extends StatelessWidget {
  const CandidatesListWidget({required this.candidates, super.key});
  final List<CandidateModel> candidates;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(context.l10n.counterAppBarTitle),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: context.read<CandidatesListCubit>().loadInitialData,
        child: const Icon(CupertinoIcons.refresh),
      ),
      body: BlocBuilder<CandidatesListCubit, CandidatesListState>(
        builder: (BuildContext context, CandidatesListState state) {
          return state.map(
            loading: (_) => const Center(child: CircularProgressIndicator()),
            error: (_) => const FlutterLogo(),
            loaded: (state) => _LoadedBody(
              candidates: state.candidates,
            ),
          );
        },
      ),
    );
  }
}

class _LoadedBody extends StatelessWidget {
  const _LoadedBody({required this.candidates, super.key});
  final List<CandidateModel> candidates;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: ListView.builder(
        itemCount: candidates.length,
        itemBuilder: (BuildContext context, int index) {
          final item = candidates[index];
          return CandidateTile(
            candidate: item,
          );
        },
      ),
    );
  }
}
