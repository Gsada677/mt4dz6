import 'package:dio/dio.dart';
import 'package:my_fifth_dz/model/Post_respons_model.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
class ApiService {
  final Dio _dio = Dio(BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com'));

  ApiService() {
    _dio.interceptors.add(TalkerDioLogger());
  }

  Future<PostResponsModel> postCreate(PostResponsModel createPost) async {
    final Response response = await _dio.post(
        '/posts',data: createPost.toJson(),
        options: Options(headers: {'User_Agent': 'weather_app'}),
        queryParameters: {'q': createPost, 'format': 'json'}

    );
    return PostResponsModel.fromJson(response.data);
        }
  }
