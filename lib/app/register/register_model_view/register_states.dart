part of 'register_cubit.dart';


abstract class RegisterCubitState{}

class InitialState extends RegisterCubitState{}

class RegisterLoading extends RegisterCubitState{}

class RegisterSuccess extends RegisterCubitState{}

class RegisterFailure extends RegisterCubitState{
  final String errMessage;
  RegisterFailure({required this.errMessage});
}
