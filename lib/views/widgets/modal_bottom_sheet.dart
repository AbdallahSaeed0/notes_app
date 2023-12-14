// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:notes_app/views/cubits/cubit/addnote_cubit.dart';

import 'custom_button.dart';
import 'custom_text_field.dart';
import 'note_form.dart';

Future<dynamic> ModalBottomSheet(BuildContext context) {
  return showModalBottomSheet(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      context: context,
      builder: (index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: BlocConsumer<AddnoteCubit, AddnoteState>(
            listener: (context, state) {
              if (state is AddnoteFaliure) {
                print('failied ${state.erormessage}');
              }

              if (state is AddnoteSuccess) {
                Navigator.pop(context);
              }
            },
            builder: (context, state) {
              return ModalProgressHUD(
                  inAsyncCall: state is AddnoteLoading ? true : false,
                  child: SingleChildScrollView(child: NoteForm()));
            },
          ),
        );
      });
}
