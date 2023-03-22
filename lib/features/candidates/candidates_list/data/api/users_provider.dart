import 'package:dio/dio.dart';

import 'package:employee_app_team/features/candidates/candidates_list/data/models/candidate_model.dart';

class UsersProvider {
  static Future<List<CandidateModel>> getUsers() async {
    final dio = Dio();
    var candidates = <CandidateModel>[];
    List<Map<String, dynamic>> jsonList;

    try {
      final response =
          await dio.get('https://random-data-api.com/api/v2/users?size=20');

      if (response.statusCode == 200) {
        final list = response.data as List<dynamic>;
        candidates = List<CandidateModel>.from(
          list.map(
            (candidateModel) =>
                CandidateModel.fromJson(candidateModel as Map<String, dynamic>),
          ),
        );
      }
    } catch (error, stacktrace) {
      throw Exception('Exception occurred: $error stackTrace: $stacktrace');
    }
    return candidates;
  }
}
