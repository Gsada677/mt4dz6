import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:my_fifth_dz/model/Post_respons_model.dart';
import 'package:my_fifth_dz/service/posts_api_service.dart';

part 'create_post_event.dart';
part 'create_post_state.dart';

class CreatePostBloc extends Bloc<PostEvent, PostState> {
  final ApiService _apiService=ApiService();
  CreatePostBloc() : super(PostInitial()) {
    on<CreatePostEvent>((event, emit) async{
      try{
        emit(LoadingPostState());
        final PostResponsModel response=await _apiService.postCreate(event.createPost);
        emit(SuccessCreatedState(response));
      }catch(e,s){
        print(e);
        emit(ErrorPostState());
      }
    });
  }
}
