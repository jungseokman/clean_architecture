part of 'main_page_bloc.dart';

@immutable
abstract class MainPageState {}

class MainPageInitial extends MainPageState {}

class MainPageStateLoading extends MainPageState {}

class MainPageStateLoaded extends MainPageState {}

class MainPageError extends MainPageState {}
