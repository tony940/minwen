import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'create_post_state.dart';

class CreatePostCubit extends Cubit<CreatePostState> {
  CreatePostCubit() : super(CreatePostInitial());

  List<File> images = [];
  void createPost() async {
    emit(CreatePostLoadingState());

    Future.delayed(Duration(seconds: 2), () {
      emit(CreatePostSuccessState());
    });
  }
}
