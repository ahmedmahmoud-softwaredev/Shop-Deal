import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop/core/failure/error/firebase_auth_error_handler.dart';
import 'package:online_shop/core/helpers/shared_preferences_helper.dart';
import 'package:online_shop/core/utils/contants.dart';

part 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit() : super(LogoutInitialState());
  static LogoutCubit get(context) => BlocProvider.of(context);

  void logout() {
    emit(LogoutLoadingState());
    FirebaseAuth.instance.signOut().then((value) {
      SharedPreferencesHelper.setBoolean(key: "isLoggedIn", value: false)
          .then((value) {
        SharedPreferencesHelper.init();
        currentUser = null;
        emit(LogoutSuccessState());
      }).catchError(
        (error) {
          emit(
            LogoutFailureState(
              errorMessage: error.toString(),
            ),
          );
        },
      );
    }).catchError(
      (error) {
        emit(
          LogoutFailureState(
            errorMessage: fireBaseAuthErrorHandler(
              errorCode: error.toString(),
            ),
          ),
        );
      },
    );
  }
}
