import 'package:dio/dio.dart';
import 'package:koinonia/core/constants/constants.dart';
import 'package:koinonia/features/biblereading-feature/data/model/PassageModel.dart';
import 'package:retrofit/retrofit.dart';
part 'PassageApiService.g.dart';

@RestApi(baseUrl: MainPassageApiUrl)
abstract class passageApiService {
  factory passageApiService(Dio dio) = _passageApiService;

  @GET('/bible')
  Future<HttpResponse<PassageModel>> getPassages({
    @Query('lang') String? book,
    @Query('doc') String? chapter,
    @Query('start') String? start,
    @Query('end') String? end,
  });
}
