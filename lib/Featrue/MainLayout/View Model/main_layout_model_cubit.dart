import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'main_layout_model_state.dart';

class MainLayoutModelCubit extends Cubit<MainLayoutModelState> {
  MainLayoutModelCubit() : super(MainLayoutModelInitial());

  int currentIndex = 0;

  static MainLayoutModelCubit get(context) => BlocProvider.of(context);

  void changePage({required int index, }) {
    if (index != currentIndex) {
      currentIndex = index + 4;
      emit(ChangePage());
    }
  }
  void changePageForFirstBar({required int index, }) {
    if (index != currentIndex) {
      currentIndex = index ;
      emit(ChangePage());
    }
  }
}
