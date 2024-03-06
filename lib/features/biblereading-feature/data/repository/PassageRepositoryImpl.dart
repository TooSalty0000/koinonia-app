import 'package:dio/dio.dart';
import 'package:koinonia/core/resources/data_state.dart';
import 'package:koinonia/features/biblereading-feature/data/data_sources/remote/PassageApiService.dart';
import 'package:koinonia/features/biblereading-feature/data/model/PassageModel.dart';
import 'package:koinonia/features/biblereading-feature/domain/repository/PassageRepository.dart';

class PassageRepositoryImpl extends PassageRepository {
  final passageApiService _passageApiService;

  PassageRepositoryImpl(this._passageApiService);

  @override
  Future<DataState<PassageModel>> getPassages(
      {required String book,
      required String chapter,
      required String start,
      required String end}) async {
    final httpResponse = await _passageApiService.getPassages(
      book: book,
      chapter: chapter,
      start: start,
      end: end,
    );

    if (httpResponse.response.statusCode == 200) {
      return DataSuccess(data: httpResponse.data);
    } else {
      return DataError(
          error: DioException(
              error: httpResponse.response.statusMessage!,
              requestOptions: httpResponse.response.requestOptions,
              type: DioExceptionType.badResponse,
              response: httpResponse.response));
    }
  }
}
