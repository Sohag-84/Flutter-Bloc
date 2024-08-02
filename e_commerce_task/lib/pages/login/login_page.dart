import 'package:e_commerce_task/pages/home/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';

import 'bloc/login_bloc.dart';
import 'bloc/login_event.dart';
import 'bloc/login_state.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Gap(20),
                Image.network(
                  "https://cdn.pixabay.com/photo/2016/12/27/13/10/logo-1933884_640.png",
                  height: 150,
                ),
                const Gap(20),
                const Text(
                  "প্রবেশ করুন",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Gap(20),
                BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {
                    return Column(
                      children: [
                        TextField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            hintText: "eg: sohag@gmail.com",
                            label: const Text("ইমেইল"),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                        const Gap(15),
                        TextField(
                          controller: _passwordController,
                          obscureText:
                              state is LoginInitial && state.isPasswordVisible,
                          decoration: InputDecoration(
                            hintText: "eg: xxxxxxxxxxxxx",
                            label: const Text("পাসওয়ার্ড"),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                context
                                    .read<LoginBloc>()
                                    .add(TogglePasswordVisibility());
                              },
                              icon: Icon(
                                state is LoginInitial && state.isPasswordVisible
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
                const Gap(10),
                BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {
                    return Row(
                      children: [
                        Checkbox(
                          value: state is LoginInitial
                              ? state.isTermsChecked
                              : false,
                          onChanged: (value) {
                            context.read<LoginBloc>().add(
                                  ToggleTermsCheckbox(value ?? false),
                                );
                          },
                          activeColor: Colors.blueAccent,
                        ),
                        const Expanded(
                          child: Text(
                            "আমি মেনে নিচ্ছি এই পরিষেবার সকল শর্তাবলি",
                          ),
                        ),
                      ],
                    );
                  },
                ),
                const Gap(20),
                BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {
                    bool isButtonEnabled = state is LoginInitial &&
                        !state.isLoading &&
                        state.isTermsChecked;

                    return GestureDetector(
                      onTap: () {
                        if (!isButtonEnabled) {
                          Fluttertoast.showToast(
                              msg: "Please accept terms and conditions");
                          return;
                        }
                        context.read<LoginBloc>().add(
                              LoginButtonPressed(
                                email: _emailController.text,
                                password: _passwordController.text,
                              ),
                            );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: state is LoginInitial && state.isLoading
                              ? Colors.grey
                              : Colors.blue,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: state is LoginInitial && state.isLoading
                            ? const Text("Loading....")
                            : const Text(
                                "Sign In",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                      ),
                    );
                  },
                ),
                BlocListener<LoginBloc, LoginState>(
                  listener: (context, state) {
                    if (state is LoginSuccess) {
                      Fluttertoast.showToast(msg: state.message);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ),
                      );
                    }
                    if (state is LoginFailure) {
                      Fluttertoast.showToast(msg: state.error);
                    }
                  },
                  child: Container(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
