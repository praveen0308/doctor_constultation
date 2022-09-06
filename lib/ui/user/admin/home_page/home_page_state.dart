part of 'home_page_cubit.dart';

@immutable
abstract class HomePageState {}

class HomePageInitial extends HomePageState {}

class Error extends HomePageState {
  final String msg;

  Error(this.msg);
}

