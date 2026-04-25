
part of 'create_post_bloc.dart';


sealed class PostEvent extends Equatable{
  const PostEvent();
}
final class CreatePostEvent extends PostEvent{
  CreatePostEvent({required this.createPost});
  final PostResponsModel createPost;



  @override
  List<Object?> get props => [createPost];
}
