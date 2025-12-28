import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'main_scaffold_state.dart';

class MainScaffoldCubit extends Cubit<MainScaffoldState> {
  MainScaffoldCubit() : super(MainScaffoldInitial());
  int currentIndex = 0;
  void changeIndex(int index) {
    if (currentIndex == index) return;
    currentIndex = index;
    emit(MainScaffoldChanged());
  }
}
