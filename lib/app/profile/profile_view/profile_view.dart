import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/app/profile/profile_model_view/profile_cubit.dart';
import '../../../app_style/app_colors.dart';
import '../../../app_style/app_text_style.dart';

class ProfileView extends StatelessWidget {
  final _currentUser = FirebaseAuth.instance.currentUser;
  ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(),
      child: Scaffold(
        body: BlocListener<ProfileCubit, ProfileCubitState>(
          listener: (context, state) {
            if (state is ProfileUnAuthenticated) {
              Navigator.pushNamedAndRemoveUntil(context, '/logIn',(r) => false);
            }
            if (state is ProfileFailure) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.errMessage)));
            }
          },
          child: BlocBuilder<ProfileCubit, ProfileCubitState>(
              builder: (context, state) {
            if (state is ProfileLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is InitialState) {
              return ListView(
                padding: const EdgeInsets.all(25),
                children: [
                  const SizedBox(height:17,),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                        'Profile',
                        style: categoryStyle
                    ),
                  ),
                  const SizedBox(height: 51,),
                  UserAccountsDrawerHeader(
                    currentAccountPicture: const Icon(Icons.person,color: Colors.white,),
                    decoration: BoxDecoration(color: secondColor),
                    accountName: Text(
                      _currentUser!.displayName??'',
                        style:profileNameStyle
                    ),
                    accountEmail: Text(
                      _currentUser!.email??'',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  AboutListTile(
                    // <-- SEE HERE
                    icon: const Icon(
                      Icons.info,
                    ),
                    applicationIcon: const Icon(
                      Icons.task_alt,
                    ),
                    applicationName: 'Quiz App',
                    applicationVersion: '1.0.0',
                    applicationLegalese: 'E.Nadeem Zeifa',
                    aboutBoxChildren: const [
                      ///Content goes here...
                    ],
                    child: Text(
                      'About app',
                      style: profileListTileStyle
                    ),
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.logout_rounded,
                    ),
                    title: Text(
                      'Log out',
                      style: profileListTileStyle
                    ),
                    onTap: () {
                      BlocProvider.of<ProfileCubit>(context).logOut();
                    },
                  ),
                ],
              );
            }
            return Container();
          }),
        ),
      ),
    );
  }
}
