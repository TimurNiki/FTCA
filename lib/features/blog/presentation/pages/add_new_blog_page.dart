import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_arc_application/core/theme/app_palette.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/utils/pick_image.dart';
import '../widgets/blog_editor.dart';

class AddNewBlogPage extends StatefulWidget {
  const AddNewBlogPage({super.key});

  @override
  State<AddNewBlogPage> createState() => _AddNewBlogPageState();
}

class _AddNewBlogPageState extends State<AddNewBlogPage> {
  final titleController = TextEditingController();
  final contentController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  List<String> selectedTopics = [];
  File? image;

  void selectImage() async {
    final pickedImage = await pickImage();
    if (pickedImage != null) {
      setState(() {
        image = pickedImage;
      });
    }
  }

  void uploadBlog() {}
  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
    contentController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            
            onPressed: uploadBlog,
            icon: const Icon(Icons.done_rounded),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                image != null
                    ? GestureDetector(
                        onTap: selectImage,
                        child: SizedBox(
                          width: double.infinity,
                          height: 150,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.file(
                              image!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          selectImage();
                        },
                      ),
                DottedBorder(
                  color: AppPalette.borderColor,
                  dashPattern: const [10, 4],
                  radius: const Radius.circular(10),
                  borderType: BorderType.RRect,
                  strokeCap: StrokeCap.round,
                  child: const SizedBox(
                    height: 150,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.folder_open,
                          size: 40,
                        ),
                        SizedBox(height: 15),
                        Text(
                          'Select your image',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: Constants.topics
                        .map(
                          (e) => Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: GestureDetector(
                              onTap: () {
                                selectedTopics.contains(e)
                                    ? selectedTopics.remove(e)
                                    : selectedTopics.add(e);
                                setState(() {});
                              },
                              child: Chip(
                                label: Text(e),
                                color: selectedTopics.contains(e)
                                    ? const MaterialStatePropertyAll(
                                        AppPalette.gradient1,
                                      )
                                    : null,
                                side: selectedTopics.contains(e)
                                    ? null
                                    : const BorderSide(
                                        color: AppPalette.borderColor,
                                      ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
                const SizedBox(height: 10),
                BlogEditor(
                  controller: titleController,
                  hintText: 'Blog title',
                ),
                const SizedBox(height: 10),
                BlogEditor(
                  controller: contentController,
                  hintText: 'Blog content',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
