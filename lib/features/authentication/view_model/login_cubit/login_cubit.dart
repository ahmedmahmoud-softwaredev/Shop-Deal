import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:online_shop/core/failure/error/firebase_auth_error_handler.dart';
import 'package:online_shop/core/helpers/shared_preferences_helper.dart';
import 'package:online_shop/core/utils/contants.dart';
import 'package:online_shop/core/utils/service_locator.dart';
import 'package:online_shop/features/account/view_model/user_cubit/user_cubit.dart';
import 'package:online_shop/features/authentication/models/user_model.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());
  static LoginCubit get(context) => BlocProvider.of(context);
  late String verificationId;
  void login({required String smsCode}) {
    emit(LoginLoadingState());
    final firebaseAuth = FirebaseAuth.instance;
    final firebaseFirestore = FirebaseFirestore.instance;
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: smsCode);
    firebaseAuth.signInWithCredential(credential).then((user) {
      SharedPreferencesHelper.setBoolean(key: "isLoggedIn", value: true);
      firebaseFirestore.collection(usersCollection).doc(user.user!.uid).update(
        {
          "fcmToken": kFCMToken,
        },
      ).then((value) {
        sl<UserCubit>().getUserData();
        emit(LoginSuccessfulState());
      }).catchError((error) {
        emit(
          LoginFailureState(
            errorMessage: error.toString(),
          ),
        );
      });
    }).catchError((error) {
      if (error is FirebaseAuthException) {
        emit(
          LoginFailureState(
            errorMessage: fireBaseAuthErrorHandler(errorCode: error.code),
          ),
        );
      } else {
        emit(
          LoginFailureState(
            errorMessage: error.toString(),
          ),
        );
      }
    });
  }

  void loginWithGoogle() async {
    GoogleSignIn().signIn().then(
      (googleUser) {
        googleUser?.authentication.then(
          (googleAuth) {
            if (googleAuth.accessToken != null) {
              emit(LoginWithGoogleLoadingState());
              final credential = GoogleAuthProvider.credential(
                accessToken: googleAuth.accessToken,
                idToken: googleAuth.idToken,
              );

              FirebaseAuth.instance
                  .signInWithCredential(credential)
                  .then((user) {
                UserModel userModel = UserModel(
                  name: user.user!.displayName!,
                  email: user.user!.email!,
                  uid: user.user!.uid,
                  phoneNumber: user.user?.phoneNumber ?? "",
                  image: user.user!.photoURL!,
                  fcmToken: kFCMToken!,
                  isPhoneNumberVerified: false,
                );
                if (user.additionalUserInfo!.isNewUser) {
                  addUserData(userModel: userModel, user: user, isGoogle: true);
                } else {
                  SharedPreferencesHelper.setBoolean(
                      key: "isLoggedIn", value: true);
                  FirebaseFirestore.instance
                      .collection(usersCollection)
                      .doc(user.user!.uid)
                      .update(
                    {
                      "fcmToken": kFCMToken,
                    },
                  );
                  sl<UserCubit>().getUserData();

                  emit(LoginWithGoogleSuccessfulState());
                }
              }).catchError((error) {
                if (error is FirebaseAuthException) {
                  emit(
                    LoginWithGoogleFailureState(
                      errorMessage:
                          fireBaseAuthErrorHandler(errorCode: error.code),
                    ),
                  );
                } else {
                  emit(
                    LoginWithGoogleFailureState(
                      errorMessage: error.toString(),
                    ),
                  );
                }
              });
            }
          },
        ).catchError(
          (error) {
            if (error is FirebaseAuthException) {
              emit(
                LoginWithGoogleFailureState(
                  errorMessage: fireBaseAuthErrorHandler(errorCode: error.code),
                ),
              );
            } else {
              emit(
                LoginWithGoogleFailureState(
                  errorMessage: error.toString(),
                ),
              );
            }
          },
        );
      },
    ).catchError(
      (error) {
        if (error is FirebaseAuthException) {
          emit(
            LoginWithGoogleFailureState(
              errorMessage: fireBaseAuthErrorHandler(errorCode: error.code),
            ),
          );
        } else {
          emit(
            LoginWithGoogleFailureState(
              errorMessage: error.toString(),
            ),
          );
        }
      },
    );
  }

  void loginWithFacebook() async {
    await FacebookAuth.instance.login().then((loginResult) {
      if (loginResult.accessToken != null) {
        final OAuthCredential facebookAuthCredential =
            FacebookAuthProvider.credential(
                loginResult.accessToken!.tokenString);
        emit(LoginWithFacebookLoadingState());
        FirebaseAuth.instance
            .signInWithCredential(facebookAuthCredential)
            .then((user) {
          UserModel userModel = UserModel(
            name: user.user!.displayName!,
            email: user.user!.email!,
            uid: user.user!.uid,
            phoneNumber: user.user?.phoneNumber ?? "",
            image: user.user!.photoURL!,
            fcmToken: kFCMToken!,
            isPhoneNumberVerified: false,
          );
          if (user.additionalUserInfo!.isNewUser) {
            addUserData(userModel: userModel, user: user, isGoogle: false);
          } else {
            SharedPreferencesHelper.setBoolean(key: "isLoggedIn", value: true);
            FirebaseFirestore.instance
                .collection(usersCollection)
                .doc(user.user!.uid)
                .update(
              {
                "fcmToken": kFCMToken,
              },
            );
            sl<UserCubit>().getUserData();
            emit(LoginWithFacebookSuccessfulState());
          }
        }).catchError((error) {
          if (error is FirebaseAuthException) {
            emit(
              LoginWithFacebookFailureState(
                errorMessage: fireBaseAuthErrorHandler(errorCode: error.code),
              ),
            );
          } else {
            emit(
              LoginWithFacebookFailureState(
                errorMessage: error.toString(),
              ),
            );
          }
        });
      }
    }).catchError((error) {
      if (error is FirebaseAuthException) {
        emit(
          LoginWithFacebookFailureState(
            errorMessage: fireBaseAuthErrorHandler(errorCode: error.code),
          ),
        );
      } else {
        emit(
          LoginWithFacebookFailureState(
            errorMessage: error.toString(),
          ),
        );
      }
    });
  }

  void addUserData({
    required UserModel userModel,
    required UserCredential user,
    required bool isGoogle,
  }) {
    FirebaseFirestore.instance
        .collection(usersCollection)
        .doc(user.user!.uid)
        .set(
          UserModel.toMap(userModel),
        )
        .then((value) {
      SharedPreferencesHelper.setBoolean(key: "isLoggedIn", value: true);
      FirebaseFirestore.instance
          .collection(usersCollection)
          .doc(user.user!.uid)
          .update(
        {
          "fcmToken": kFCMToken,
        },
      );
      sl<UserCubit>().getUserData();
      emit(isGoogle
          ? LoginWithGoogleSuccessfulState()
          : LoginWithFacebookSuccessfulState());
    }).catchError((error) {
      emit(
        isGoogle
            ? LoginWithGoogleFailureState(errorMessage: error.toString())
            : LoginWithFacebookFailureState(errorMessage: error.toString()),
      );
    });
  }

  void phoneAuth({
    required String phoneNumber,
  }) async {
    emit(PhoneAuthLoadingState());
    checkIfPhoneNumberAddedBefore(phoneNumber: phoneNumber)
        .then((isAlreadyExisted) async {
      if (isAlreadyExisted) {
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
                ? "رقم الهاتف هذا غير مسجل، يرجى التسجيل للمتابعة."
                : "this phone number is not registered please signup to continue.",
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
