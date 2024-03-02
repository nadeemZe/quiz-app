import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../app_style/app_colors.dart';
import '../../../app_style/app_text_style.dart';
import '../../../widgets/log_button.dart';
import '../../../widgets/log_label_button.dart';
import '../login_model_view/login_cubit.dart';

class LogInView extends StatefulWidget {
  const LogInView({Key? key}) : super(key: key);

  @override
  State<LogInView> createState() => _LogInViewState();
}

class _LogInViewState extends State<LogInView> {

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LogInCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(" Quiz App",style: appBarStyle),
          backgroundColor: primaryColor,
        ),
        body: BlocListener<LogInCubit, LogInCubitState>(
          listener: (context, state) {
            if (state is LogInSuccess) {
              Navigator.pushReplacementNamed(context,'/dashboard');
            }
            if (state is LogInFailure) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.errMessage)));
            }
          },
          child: BlocBuilder<LogInCubit, LogInCubitState>(
            builder: (context, state) {
              if (state is LogInLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is InitialState) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SingleChildScrollView(
                      reverse: true,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                           Text(
                            "Welcome back, Log In",
                            style: loginRegisterStyle
                          ),
                          const SizedBox(
                            height:51,
                          ),
                          Center(
                            child: Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  TextFormField(
                                    keyboardType: TextInputType.emailAddress,
                                    controller: _emailController,
                                    decoration: const InputDecoration(
                                      hintText: "Email",
                                      border: OutlineInputBorder(),
                                    ),
                                    autovalidateMode: AutovalidateMode.onUserInteraction,
                                    validator: (value) {
                                      return value != null && !value.contains('@')
                                          ? 'Enter a valid email'
                                          : null;
                                    },
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    keyboardType: TextInputType.text,
                                    controller: _passwordController,
                                    decoration: const InputDecoration(
                                      hintText: "Password",
                                      border: OutlineInputBorder(),
                                    ),
                                    autovalidateMode:AutovalidateMode.onUserInteraction,
                                    validator: (value) {
                                      return value != null && value.length < 6
                                          ? "Enter min. 6 characters"
                                          : null;
                                    },
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  LogButton(
                                    text: 'Log in',
                                    color: primaryColor,
                                    onPressed: () {
                                      _authenticateWithEmailAndPassword(context);
                                    },
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text("or", style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),),
                          const SizedBox(
                            height: 20,
                          ),
                          LogLabelButton(
                            title: "Don't have an account?",
                            onTap: () {
                              Navigator.pushReplacementNamed(context,'/register');
                            },
                            subTitle: 'Register',
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }

  void _authenticateWithEmailAndPassword(context) {
    if (_formKey.currentState!.validate()) {
      BlocProvider.of<LogInCubit>(context).logIn(email:_emailController.text,password: _passwordController.text);
    }
  }

}