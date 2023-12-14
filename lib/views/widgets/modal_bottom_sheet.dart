// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'custom_button.dart';
import 'custom_text_field.dart';

Future<dynamic> ModalBottomSheet(BuildContext context) {
  return showModalBottomSheet(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      context: context,
      builder: (index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Container(
            child: SingleChildScrollView(
              child: NoteForm(),
            ),
          ),
        );
      });
}

class NoteForm extends StatefulWidget {
  const NoteForm({
    super.key,
  });

  @override
  State<NoteForm> createState() => _NoteFormState();
}

class _NoteFormState extends State<NoteForm> {
  final GlobalKey<FormState> formkey = GlobalKey();

  AutovalidateMode autovalidatemode = AutovalidateMode.disabled;

  String? title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      autovalidateMode: autovalidatemode,
      child: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          CustomTextField(
            hint: "Title",
            onsaved: (value) {
              title = value;
            },
          ),
          SizedBox(
            height: 20,
          ),
          CustomTextField(
            hint: "Content",
            maxlines: 5,
            onsaved: (value) {
              subtitle = value;
            },
          ),
          SizedBox(
            height: 32,
          ),
          CustomButton(
            ontap: () {
              if (formkey.currentState!.validate()) {
                formkey.currentState!.save();
              } else {
                autovalidatemode = AutovalidateMode.always;
              }
            },
          ),
          SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
