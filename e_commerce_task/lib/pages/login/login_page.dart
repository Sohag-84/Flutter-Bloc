import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
                TextField(
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
                  decoration: InputDecoration(
                    hintText: "eg: xxxxxxxxxxxxx",
                    label: const Text("পাসওয়ার্ড"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.visibility,
                      ),
                    ),
                  ),
                ),
                const Gap(10),
                Row(
                  children: [
                    Checkbox(
                      value: true,
                      onChanged: (value) {},
                      activeColor: Colors.blueAccent,
                    ),
                    const Text(
                      "আমি মেনে নিচ্ছি এই পরিষেবার সকল শর্তাবলি",
                    )
                  ],
                ),
                const Gap(20),
                Container(
                  padding: const EdgeInsets.all(10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text(
                    "Sign In",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
