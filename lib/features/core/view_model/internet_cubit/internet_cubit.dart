import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop/core/utils/service_locator.dart';
import 'package:online_shop/features/account/view_model/user_cubit/user_cubit.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  InternetCubit() : super(InternetInitialState());
  static InternetCubit get(context) => BlocProvider.of(context);
  StreamSubscription? subscription;
  void checkInternetConnection() {
    subscription = Connectivity().onConnectivityChanged.listen(
      (List<ConnectivityResult> result) {
        if (result.contains(ConnectivityResult.none)) {
          emit(InternetNotConnectedState());
        } else {
          sl<UserCubit>().getUserData();
          emit(InternetConnectedState());
        }
      },
    );
  }

  @override
  Future<void> close() {
    subscription!.cancel();
    return super.close();
  }
}
