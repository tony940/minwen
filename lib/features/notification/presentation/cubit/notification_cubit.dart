import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(NotificationInitial());

  getAllNotification() async {
    emit(NotificationLoadingState());
    Future.delayed(
        Duration(seconds: 2), () => emit(NotificationILoadedState()));
  }
}
