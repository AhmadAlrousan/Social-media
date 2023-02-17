import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/bloc/SocialRegisterState.dart';
import 'package:social_media/models/social_user_model.dart';

class SocialRegisterCubit extends Cubit<SocialRegisterState> {
  SocialRegisterCubit() : super(SocialRegisterInitialState());


  static SocialRegisterCubit get(context) => BlocProvider.of(context);




  void userRegister({
    required String email,
    required String password,
    required String name,
    required String phone,

  }) {
    emit((SocialRegisterLoadingState()));
    print(name);

    FirebaseAuth.instance.createUserWithEmailAndPassword
      (email: email, password: password).then((value) {
          print(value.user?.email);
      print(value.user?.uid);
      userCreate(email: email, name: name, phone: phone,
          uId: value.user!.uid);

    } ).catchError((error){

      print("0000000000");

      print(error.toString());
      emit(SocialRegisterErrorState(error.toString()));
    });

  }

  void userCreate({
    required String email,
    required String name,
    required String phone,
    required String uId,

  })
  {

    SocialUserModel model = SocialUserModel(
      name: name,
      email: email,
      phone: phone,
      uId: uId,
    );
    FirebaseFirestore.instance
        .collection("users")
        .doc(uId)
        .set(model.toMap()).then((value) {

          emit(SocialCreateUserSuccessState());
    }).catchError((error){
      emit(SocialCreateUserErrorState(error.toString()));

    });
  }
}


