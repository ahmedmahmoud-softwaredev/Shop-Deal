import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_deal/core/failure/error/firebase_auth_error_handler.dart';
import 'package:shop_deal/core/helpers/shared_preferences_helper.dart';
import 'package:shop_deal/core/utils/contants.dart';
import 'package:shop_deal/features/authentication/models/user_model.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitialState());
  static RegisterCubit get(context) => BlocProvider.of(context);
  late String verificationId;
  late String email;
  late String name;
  late String phoneNumber;

  void register({
    required String smsCode,
  }) async {
    emit(RegisterLoadingState());
    final firebaseAuth = FirebaseAuth.instance;
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: smsCode);
    firebaseAuth.signInWithCredential(credential).then((user) {
      createUser(
        email: email,
        name: name,
        uid: user.user!.uid,
        phoneNumber: phoneNumber,
      );
    }).catchError((error) {
      if (error is FirebaseAuthException) {
        emit(
          RegisterFailureState(
            errorMessage: fireBaseAuthErrorHandler(errorCode: error.code),
          ),
        );
      } else {
        emit(
          RegisterFailureState(
            errorMessage: error.toString(),
          ),
        );
      }
    });
  }

  void createUser(
      {required String email,
      required String name,
      required String uid,
      required String phoneNumber}) {
    UserModel user = UserModel(
      name: name,
      email: email,
      uid: uid,
      image: null,
      phoneNumber: "+2$phoneNumber",
      fcmToken: kFCMToken!,
      isPhoneNumberVerified: true,
    );
    addUserData(user: user);
  }

  void addUserData({required UserModel user}) {
    FirebaseFirestore.instance
        .collection(usersCollection)
        .doc(user.uid)
        .set(
          UserModel.toMap(user),
        )
        .then((value) {
      SharedPreferencesHelper.setBoolean(key: "isLoggedIn", value: true);
      currentUser = UserModel.fromJson(
        UserModel.toMap(user),
      );
      emit(CreateUserSuccessFulState());
    }).catchError((error) {
      CreateUserFailureState(
        errorMessage: error.toString(),
      );
    });
  }

  void phoneAuth({
    required String phoneNumber,
    required String email,
    required String name,
  }) async {
    emit(PhoneAuthLoadingState());
    checkIfPhoneNumberAddedBefore(phoneNumber: phoneNumber)
        .then((isAlreadyExisted) async {
      if (!isAlreadyExisted) {
        final firebaseAuth = FirebaseAuth.instance;
        await firebaseAuth.verifyPhoneNumber(
          phoneNumber: '+2$phoneNumber',
          verificationCompleted: (PhoneAuthCredential credential) {},
          verificationFailed: (FirebaseAuthException e) {
            emit(
              PhoneAuthFailureState(
                errorMessage: fireBaseAuthErrorHandler(
                  errorCode: e.code.toString(),
                ),
              ),
            );
          },
          codeSent: (String verificationId, int? resendToken) {
            this.verificationId = verificationId;
            this.email = email;
            this.name = name;
            this.phoneNumber = phoneNumber;
            emit(PhoneAuthSuccessState());
          },
          codeAutoRetrievalTimeout: (String verificationId) {},
        );
      } else {
        emit(
          PhoneAuthFailureState(
            errorMessage: kCurrentLanguage == "ar"
                ? "رقم الهاتف هذا مسجل بالفعل"
                : "This phone number is already registered.",
          ),
        );
      }
    }).catchError((error) {
      emit(
        PhoneAuthFailureState(
          errorMessage: error.toString(),
        ),
      );
    });
  }

  Future<bool> checkIfPhoneNumberAddedBefore(
      {required String phoneNumber}) async {
    bool isAlreadyExisted = false;
    final firebaseFirestore = FirebaseFirestore.instance;
    final collection =
        await firebaseFirestore.collection(usersCollection).get();
    for (var doc in collection.docs) {
      if ("+2$phoneNumber" == doc.data()["phoneNumber"]) {
        isAlreadyExisted = true;
      }
    }
    return isAlreadyExisted;
  }
}
