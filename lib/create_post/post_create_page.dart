import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_fifth_dz/create_post/bloc/create_post_bloc.dart';
import 'package:my_fifth_dz/model/Post_respons_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostCreatePage extends StatefulWidget {
  PostCreatePage({super.key});

  @override
  State<PostCreatePage> createState() => _PostCreatePageState();
}

class _PostCreatePageState extends State<PostCreatePage> {
  final TextEditingController _texTitleController = TextEditingController();

  final TextEditingController _textDescController = TextEditingController();

  final TextEditingController _textUserIdController = TextEditingController();
  final CreatePostBloc _createPostBloc = CreatePostBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: _texTitleController,
              decoration: InputDecoration(
                  hint: Text('tittle')
              ),
            ),
            TextField(controller: _textDescController,
              decoration: InputDecoration(
                  hint: Text('desc')
              ),
            ),

            TextField(controller: _textUserIdController,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: InputDecoration(
                hint: Text('desc'),
              ),
            ),

            BlocListener<CreatePostBloc, PostState>(

                bloc:_createPostBloc,
              listener: (context, state) {
                if (State is SuccessCreatedState) {
                  _textUserIdController.clear();
                  _textDescController.clear();
                  _texTitleController.clear();
                }
                if (state is ErrorPostState) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error'),
                  duration: Duration(seconds: 2),
                  action: SnackBarAction(label: 'undo', onPressed: (){},)));

                }
                }

                ),

               ElevatedButton(onPressed: () {
                _createPostBloc.add(CreatePostEvent(
                    createPost: PostResponsModel(
                        userId: int.parse(_textUserIdController.text),
                        tittle: _texTitleController.text,
                        body: _textDescController.text)));
              }, child: Text('Save')

               )


          ],

        ),
                  )

    );
  }
}
