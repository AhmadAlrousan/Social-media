import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/bloc/SocialLoginState.dart';

class SocialLoginCubit extends Cubit<SocialLoginState>{
  SocialLoginCubit(): super(SocialLoginInitialState());


  static SocialLoginCubit get(context)=>BlocProvider.of(context);


  void userLogin({
    required String email,
    required String password,

  }){

    emit(SocialLoginLoadingState());

    FirebaseAuth.instance.signInWithEmailAndPassword(
        email:email, password:password).then((value) {
          emit(SocialLoginSuccessState());

    }).catchError((error){
          emit(SocialLoginErrorState(error.toString()));
    });

  }

}


