import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ls/Core/DataBase/remote_database/DioHelper.dart';
import 'package:ls/Core/DataBase/remote_database/EndPoints.dart';
import 'package:ls/Featrue/MainLayout/view/Exercise/view/BodyParts/Model/BodyPartsModel.dart';
import 'package:meta/meta.dart';

part 'body_parts_state.dart';

class BodyPartsCubit extends Cubit<BodyPartsState> {
  BodyPartsCubit() : super(BodyPartsInitial());
  static BodyPartsCubit get(context) => BlocProvider.of(context);


}
