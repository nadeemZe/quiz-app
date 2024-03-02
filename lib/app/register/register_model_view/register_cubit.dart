import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../services/firebase_auth_service.dart';

part 'register_states.dart';


class RegisterCubit extends Cubit<RegisterCubitState>{
  RegisterCubit():super(InitialState());


  final _authService=AuthService();

  Future<void> register({required String name, required String email,required String password,})async{

    try {
      emit(RegisterLoading());
      await _authService.register(name: name,email:email,password:password,);
      emit(RegisterSuccess());

    }on Exception catch(e){
      emit(RegisterFailure(errMessage: e.toString()));
      emit(InitialState());
    }

  }


}