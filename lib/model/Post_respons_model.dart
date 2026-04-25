import 'package:equatable/equatable.dart';
class PostResponsModel extends Equatable{
  final int? userId;
  final int? id;
  final String? tittle;
  final String? body;

  PostResponsModel({ this.userId,  this.id,  this.tittle,  this.body});
  factory PostResponsModel.fromJson(Map<String,dynamic>json,){
    return PostResponsModel(userId: json['userId'], id: json['id'],
        tittle: json['title'], body: json['body']);
  }
  Map<String,dynamic>toJson(){
  return  {'userId':userId,'title':tittle,'body':body,'id':id};
  }


  @override
  List<Object?> get props => [userId,tittle,body,id];
}