part of 'create_post_cubit.dart';

@immutable
sealed class CreatePostState {}

final class CreatePostInitial extends CreatePostState {}

final class CreatePostLoadingState extends CreatePostState {}

final class CreatePostSuccessState extends CreatePostState {}

final class CreatePostFailureState extends CreatePostState {}
