import 'package:employee_app_team/features/candidates/candidates_list/presentation/candidate_list_page.dart';
import 'package:employee_app_team/l10n/l10n.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: CandidateListPage(),
    );
  }
}
