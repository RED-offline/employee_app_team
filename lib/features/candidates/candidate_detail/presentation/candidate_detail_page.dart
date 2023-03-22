import 'package:employee_app_team/features/candidates/candidate_detail/domain/candidate_detail_cubit.dart';
import 'package:employee_app_team/features/candidates/candidate_detail/presentation/candidate_detail_widget.dart';
import 'package:employee_app_team/features/candidates/candidates_list/data/models/candidate_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CandidateDetailPage extends StatelessWidget {
  const CandidateDetailPage({required this.candidate, super.key});
  final CandidateModel candidate;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CandidateDetailCubit>(
      create: (_) => CandidateDetailCubit(),
      child: CandidateDetailWidget(
        candidate: candidate,
      ),
    );
  }
}
