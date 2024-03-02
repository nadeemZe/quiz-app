import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/widgets/log_button.dart';
import 'package:quiz_app/widgets/log_label_button.dart';
import '../../../app_style/app_colors.dart';
import '../../../app_style/app_text_style.dart';
import '../register_model_view/register_cubit.dart';


class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(" Quiz App",style: appBarStyle,),
          backgroundColor: primaryColor,
        ),
        body: BlocConsumer<RegisterCubit, RegisterCubitState>(
          listener: (context, state) {
            if (state is RegisterSuccess) {
              Navigator.pushReplacementNamed(context,'/dashboard');
            }
            if (state is RegisterFailure) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.errMessage)));
            }
          },
          builder: (context, state) {
            if (state is RegisterLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is InitialState) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: SingleChildScrollView(
                    reverse: true,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                         Text(
                          "Register",
                          style: loginRegisterStyle
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        Center(
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: _nameController,
                                  decoration: const InputDecoration(
                                    hintText: "Full Name",
                                    border: OutlineInputBorder(),
                                  ),
                                  autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                                  validator: (value) {
                                    return value != null && value.isEmpty
                                        ? "Enter your name"
                                        : null;
                                  },
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
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
                                  controller: _passwordController,
                                  decoration: const InputDecoration(
                                    hintText: "Password",
                                    border: OutlineInputBorder(),
                                  ),
                                  autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
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
                                  text: "Register",
                                  color: primaryColor,
                                  onPressed: () {
                                    _createAccountWithEmailAndPassword(context);
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 25,),
                        const Text("or", style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),),
                        const SizedBox(
                          height: 20,
                        ),
                        LogLabelButton(
                          title: 'Already have an account?',
                          subTitle: 'LogIn',
                          onTap: () {
                            Navigator.pushReplacementNamed(context,'/logIn');
                          },
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
    );
  }

  void _createAccountWithEmailAndPassword(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      BlocProvider.of<RegisterCubit>(context).register(
          name:_nameController.text,
          email:_emailController.text,
          password:_passwordController.text,
        );
    }
  }


}