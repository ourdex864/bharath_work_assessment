import 'package:bloc/bloc.dart';

part 'main_screen_event.dart';
part 'main_screen_state.dart';

class MainScreenBloc extends Bloc<MainScreenEvent, MainScreenState> {
  MainScreenBloc() : super(MainScreenState(0)) {
    on<MainScreenTabChangeEvent>((event, emit) => emit(MainScreenState(event.tabIndex)));
  }
}
