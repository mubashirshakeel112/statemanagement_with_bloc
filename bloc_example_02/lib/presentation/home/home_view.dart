import 'dart:io';

import 'package:bloc_example_02/presentation/home/bloc/capture_image_bloc.dart';
import 'package:bloc_example_02/presentation/home/bloc/capture_image_event.dart';
import 'package:bloc_example_02/presentation/home/bloc/capture_image_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  static const String id = '/home_view';

  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.grey[300],
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text('Bloc Example 02', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500, color: Colors.black),),
      ),
      body: BlocBuilder<CaptureImageBloc, CaptureImageState>(
        builder: (context, state) {
          if (state.status == CaptureImageEnum.loading) {
            return Center(child: CircularProgressIndicator(color: Colors.grey[300]));
          } else if (state.file == null) {
            return Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Material(
                    color: Colors.grey[300],
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(50),
                      onTap: () {
                        context.read<CaptureImageBloc>().add(CaptureImageFromCamera());
                      },
                      child: SizedBox(width: 100, height: 100, child: Icon(Icons.camera_alt_outlined)),
                    ),
                  ),
                  SizedBox(width: 20),
                  Material(
                    color: Colors.grey[300],
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(50),
                      onTap: () {
                        context.read<CaptureImageBloc>().add(CaptureImageFromGallery());
                      },
                      child: SizedBox(width: 100, height: 100, child: Icon(Icons.photo_outlined)),
                    ),
                  ),
                ],
              ),
            );
          } else if (state.file != null) {
            return Center(child: Image.file(File(state.file!.path)));
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }
}
