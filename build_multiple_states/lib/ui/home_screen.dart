import 'package:build_multiple_states/bloc/switch_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/switch_bloc.dart';
import '../bloc/switch_states.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BlocBuilder<SwitchBloc, SwitchState>(
              builder: (context, state) {
                return Row(
                  children: [
                    const Text(
                      "Notification",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const Spacer(),
                    Switch(
                      value: state.isEnable,
                      onChanged: (value) {
                        context
                            .read<SwitchBloc>()
                            .add(EnableDisableNotificationEvent());
                      },
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: 15),
            BlocBuilder<SwitchBloc, SwitchState>(
              builder: (context, state) {
                return Column(
                  children: [
                    Container(
                      height: 120,
                      decoration: BoxDecoration(
                        color: Colors.red.withOpacity(state.sliderValue),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Slider(
                      value: state.sliderValue,
                      onChanged: (double value) {
                        context
                            .read<SwitchBloc>()
                            .add(SliderEvent(sliderValue: value));
                      },
                    )
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
