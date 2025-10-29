import 'package:first_wtf_app/data/dummy_user_details.dart';
import 'package:first_wtf_app/model/user_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserCubit extends Cubit<UserDetail?>{
  UserCubit(): super(null);

  void login(BuildContext context, String email, String password) async{
    print("Got in to log in function");
    // You can do more like validate if it is a valid
    //
    //
    Future.delayed(Duration(seconds: 2));

    for(var userDetail in USER_DETAILS){
      if(userDetail.email == email && userDetail.password == password){
        
        emit(userDetail);
        Navigator.of(context).pushReplacementNamed("/home");
      }else{
        // notfy user using
        
      }
    }

  }
}