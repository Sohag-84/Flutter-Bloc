import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker_using_bloc/bloc/image_picker_event.dart';
import 'package:image_picker_using_bloc/bloc/image_picker_state.dart';

import '../bloc/image_picker_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
        centerTitle: true,
      ),
      body: BlocBuilder<ImagePickerBloc, ImagePickerState>(
        builder: (context, state) {
          return state.file == null
              ? Center(
                  child: InkWell(
                    onTap: () {
                      context
                          .read<ImagePickerBloc>()
                          .add(GalleryImagePickerEvent());
                    },
                    child: const Icon(Icons.camera, size: 45),
                  ),
                )
              : Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: FileImage(
                        File(
                          state.file!.path.toString(),
                        ),
                      ),
                    ),
                  ),
                );
        },
      ),
    );
  }
}
