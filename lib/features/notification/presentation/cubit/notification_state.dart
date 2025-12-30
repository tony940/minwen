part of 'notification_cubit.dart';

@immutable
sealed class NotificationState {}

final class NotificationInitial extends NotificationState {}

final class NotificationLoadingState extends NotificationState {}

final class NotificationILoadedState extends NotificationState {}

final class NotificationErrorState extends NotificationState {}
