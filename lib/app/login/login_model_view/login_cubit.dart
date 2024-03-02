import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../services/firebase_auth_service.dart';

part 'login_states.dart';


class LogInCubit extends Cubit<LogInCubitState>{
  LogInCubit():super(InitialState());

  final  _authService=AuthService();

  Future<void> logIn({required String email,required String password})async{

      try {
        emit(LogInLoading());
        await _authService.logIn(email:email,password:password);
          emit(LogInSuccess());


      }on Exception catch(e){
        emit(LogInFailure(errMessage: e.toString()));
        emit(InitialState());
      }

  }


}