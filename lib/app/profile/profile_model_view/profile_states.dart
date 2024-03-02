part of 'profile_cubit.dart';


abstract class ProfileCubitState{}

class InitialState extends ProfileCubitState{}

class ProfileLoading extends ProfileCubitState{}

class ProfileUnAuthenticated extends ProfileCubitState{}

class ProfileFailure extends ProfileCubitState{
  final String errMessage;
  ProfileFailure({required this.errMessage});
}
