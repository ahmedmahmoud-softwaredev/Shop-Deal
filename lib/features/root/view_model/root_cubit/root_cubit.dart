import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'root_state.dart';

class RootCubit extends Cubit<RootState> {
  RootCubit() : super(RootInitialState());

  static RootCubit get(context) => BlocProvider.of(context);
  int selectedScreen = 0;

  void changeSelectedScreen({required int index}) {
    emit(RootInitialState());
    selectedScreen = index;
    emit(ScreenChangedState());
  }
}
