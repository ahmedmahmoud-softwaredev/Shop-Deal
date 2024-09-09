import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shop_deal/core/failure/error/firebase_auth_error_handler.dart';
import 'package:shop_deal/core/helpers/shared_preferences_helper.dart';
import 'package:shop_deal/core/utils/contants.dart';
import 'package:shop_deal/features/authentication/models/user_model.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitialState());
  static UserCubit get(context) => BlocProvider.of(context);
  late File profilePic;
  late String verificationId;
  String? newName;
  String? newEmail;
  String? newPhoneNumber;
  void getUserData() {
    if (FirebaseAuth.instance.currentUser != null) {
      emit(GetUserLoadingState());
      FirebaseFirestore.instance
          .collection(usersCollection)
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get()
          .then((userData) {
        currentUser = UserModel.fromJson(userData.data()!);

        emit(GetUserSuccessState());
      }).catchError((error) {
        SharedPreferencesHelper.setBoolean(
          key: isLoggedInKey,
          value: false,
        );
        GetUserFailureState(errorMessage: error.toString());
      });
    }
  }

  void pickUserImage({required bool isFromGallery}) {
    final ImagePicker picker = ImagePicker();
    picker
        .pickImage(
            source: isFromGallery ? ImageSource.gallery : ImageSource.camera)
        .then((value) {
      if (value != null) {
        profilePic = File(value.path);
        uploadProfilePicture();
      }
    }).catchError(
      (error) {},
    );
  }

  void uploadProfilePicture() {
    emit(UploadProfilePicLoadingState());
    FirebaseStorage.instance
        .ref()
        .child("Users/${Uri.file(profilePic.path).pathSegments.last}")
        .putFile(profilePic)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        emit(UploadProfilePicSuccesState());
        FirebaseFirestore.instance
            .collection(usersCollection)
            .doc(currentUser!.uid)
            .update({"image": value}).then((value) {
          getUserData();
        }).catchError((error) {
          emit(UploadProfilePicFailureState(errorMessage: error.toString()));
        });
      }).catchError(
        (error) {
          emit(UploadProfilePicFailureState(errorMessage: error.toString()));
        },
      );
    }).catchError((error) {
      emit(UploadProfilePicFailureState(errorMessage: error.toString()));
    });
  }

  void updateUserData(
      {required String name,
      required String email,
      required String phoneNumber}) {
    emit(UpdateUserDataLoadingState());
    newName = name;
    newEmail = email;
    newPhoneNumber = phoneNumber;
    if (currentUser!.phoneNumber != phoneNumber) {
      phoneAuth(phoneNumber: phoneNumber);
    } else {
      sendNewUserData();
    }
  }

  void verifyPhoneNumber({required String smsCode}) async {
    emit(VerifyPhoneNumberLoadingState());
    final firebaseAuth = FirebaseAuth.instance;

    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: smsCode);
    firebaseAuth.currentUser!.linkWithCredential(credential).then((value) {
      sendNewUserData(isPhoneNumberVerified: true);
    }).catchError((error) {
      emit(
        PhoneAuthFailureState(
          errorMessage: fireBaseAuthErrorHandler(
            errorCode: error.code.toString(),
          ),
        ),
      );
    });
  }

  void sendNewUserData({bool? isPhoneNumberVerified}) {
    Map<String, dynamic> userNewDataMap = {
      "name": newName,
      "email": newEmail,
      "phoneNumber": isPhoneNumberVerified == null
          ? currentUser!.phoneNumber
          : "+2$newPhoneNumber",
      "isPhoneNumberVerified":
          isPhoneNumberVerified ?? currentUser!.isPhoneNumberVerified,
    };
    FirebaseFirestore.instance
        .collection(usersCollection)
        .doc(currentUser!.uid)
        .update(
          userNewDataMap,
        )
        .then((value) {
      emit(UpdateUserDataSuccesState());
    }).catchError((error) {
      emit(
        UpdateUserDataFailureState(
          errorMessage: error.toString(),
        ),
      );
    });
  }

  void phoneAuth({
    required String phoneNumber,
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
