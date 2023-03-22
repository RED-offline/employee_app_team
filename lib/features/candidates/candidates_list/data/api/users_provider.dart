import 'dart:io';

import 'package:dio/dio.dart';
import 'package:employee_app_team/features/candidates/candidates_list/data/api/api_result.dart';

import 'package:employee_app_team/features/candidates/candidates_list/data/models/candidate_model.dart';

class UsersProvider {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://random-data-api.com/api/v2',
      validateStatus: (_) => true,
    ),
  );

  Future<ApiResult<List<CandidateModel>>> getUsers() async {
    try {
      final response = await dio.get<dynamic>(
        '/users',
        queryParameters: <String, dynamic>{
          'size': 20,
        },
      );

      if (response.statusCode != HttpStatus.ok) {
        return const ApiResult.error();
      }

      final list = response.data as List<dynamic>;
      final candidates = List<CandidateModel>.from(
        list.map(
          (e) => CandidateModel.fromJson(e as Map<String, dynamic>),
        ),
      );
      return ApiResult.data(candidates);
    } catch (error, stacktrace) {
      return ApiResult.error(message: error.toString());
    }
  }
}
