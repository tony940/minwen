part of 'main_scaffold_cubit.dart';

@immutable
sealed class MainScaffoldState {}

final class MainScaffoldInitial extends MainScaffoldState {}

final class MainScaffoldChanged extends MainScaffoldState {}
