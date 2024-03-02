import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../services/firebase_auth_service.dart';

part 'profile_states.dart';


class ProfileCubit extends Cubit<ProfileCubitState>{
  ProfileCubit():super(InitialState());

  final _authService=AuthService();

  Future<void> logOut()async{

    try {
      emit(ProfileLoading());
      await _authService.logOut();
      emit(ProfileUnAuthenticated());

    }on Exception catch(e){
      emit(ProfileFailure(errMessage: e.toString()));
      emit(InitialState());
    }

  }


}