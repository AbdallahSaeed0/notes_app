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
              child: const Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  CustomTextField(
                    hint: "Title",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    hint: "Content",
                    maxlines: 5,
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  CustomButton(),
                  SizedBox(
                    height: 16,
                  ),
                ],
              ),
            ),
          ),
        );
      });
}
