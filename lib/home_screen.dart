import 'dart:io';
import 'package:bloc_image_picker/Bloc/image_picker_bloc.dart';
import 'package:bloc_image_picker/Bloc/image_picker_event.dart';
import 'package:bloc_image_picker/Widgets/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Bloc/image_picker_state.dart';
import 'Widgets/custom_material-button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ImagePickerBloc bloc = ImagePickerBloc();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
            child: Column(
          children: [
            SizedBox(
              height: size.width / 5,
            ),
            GestureDetector(
              onTap: () {
                bloc.add(TapImagePickerEvent());
              },
              child: BlocBuilder<ImagePickerBloc, ImagePickerState>(
                  bloc: bloc,
                  builder: (context, state) {
                    if (state is ImagePickerLoadingState) {
                      return CustomContainer(
                          size: size,
                          child: SizedBox(
                              height: size.height/10,
                              child: const Center(
                                child: CircularProgressIndicator(
                                    strokeWidth: 3),
                              )));
                    } else if (state is ImagePickerLoadedState) {
                      return CustomContainer(
                          size: size,
                          child: Image.file(File(state.pickedFile!.path),fit: BoxFit.fill,height: size.height,));
                    }
                    return CustomContainer(
                        size: size,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.camera_alt_rounded,
                                color: Colors.black.withOpacity(.5),
                                size: 100,
                              ),
                              SizedBox(
                                height: size.height / 50,
                              ),
                              const Text(
                                "Tap to open Camera",
                                style: TextStyle(fontSize: 16),
                              )
                            ],
                          ),
                        ));
                  }),
            ),

            //  =================  submit Button ===================
            const SizedBox(
              height: 50,
            ),
            SizedBox(
                width: size.width / 1.75,
                child: CustomMaterialButton(
                    onPressed: () {},
                    buttonText: "Submit",
                    height: size.height / 80))
          ],
        )),
      ),
    );
  }
}
