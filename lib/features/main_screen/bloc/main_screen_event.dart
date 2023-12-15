part of 'main_screen_bloc.dart';

abstract class MainScreenEvent {}

class MainScreenTabChangeEvent extends MainScreenEvent {
  final int tabIndex;

  MainScreenTabChangeEvent({required this.tabIndex});
}
