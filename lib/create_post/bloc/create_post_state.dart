part of 'create_post_bloc.dart';

sealed class PostState extends Equatable{
 @override
  // TODO: implement props
  List<Object?> get props => [];
}

final class PostInitial extends PostState {}

final class LoadingPostState extends PostState{}
final class SuccessCreatedState extends PostState{

  SuccessCreatedState( this.postResponsModel);
  final PostResponsModel postResponsModel;


  @override
  List<Object?> get props => [postResponsModel];
}
final class ErrorPostState extends PostState{}
