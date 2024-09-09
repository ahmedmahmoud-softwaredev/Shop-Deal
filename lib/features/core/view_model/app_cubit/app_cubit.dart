import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_deal/core/helpers/shared_preferences_helper.dart';
import 'package:shop_deal/core/utils/contants.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitialState());
  static AppCubit get(context) => BlocProvider.of(context);
  String? currentLanguage;
  bool? isDarkMode;

  void init() {
    emit(AppInitialState());
    kCurrentLanguage =
        currentLanguage = SharedPreferencesHelper.currentlanguage;
    kIsDarkMode = isDarkMode = SharedPreferencesHelper.isDarkMode;
    emit(LangugeChangedSuccessfulyState());
  }

  void changeLanguage({required String language}) async {
    emit(AppInitialState());
    await SharedPreferencesHelper.setString(key: languageKey, value: language);
    kCurrentLanguage = currentLanguage = language;
    emit(LangugeChangedSuccessfulyState());
  }

  void changeThemeMode({required bool isDark}) async {
    emit(AppInitialState());
    await SharedPreferencesHelper.setBoolean(key: themeModeKey, value: isDark);
    kIsDarkMode = isDarkMode = isDark;
    emit(ThemeModeChangedSuccessfulyState());
  }
}
