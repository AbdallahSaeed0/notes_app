// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/views/cubits/cubit/addnote_cubit.dart';
import 'note_form.dart';

Future<dynamic> ModalBottomSheet(BuildContext context) {
  return showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      context: context,
      builder: (index) {
        return BlocProvider(
          create: (context) => AddnoteCubit(),
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
              return AbsorbPointer(
                absorbing: state is AddnoteLoading ? true : false,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 16,
                      right: 16,
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: SingleChildScrollView(child: NoteForm()),
                ),
              );
            },
          ),
        );
      });
}
