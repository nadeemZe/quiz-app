part of 'login_cubit.dart';


abstract class LogInCubitState{}

class InitialState extends LogInCubitState{}

class LogInLoading extends LogInCubitState{}

class LogInSuccess extends LogInCubitState{}

class LogInFailure extends LogInCubitState{
  final String errMessage;
  LogInFailure({required this.errMessage});
}

