import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/views/cubits/cubit/addnote_cubit.dart';
import 'package:notes_app/views/models/note_model.dart';

import 'custom_button.dart';
import 'custom_text_field.dart';

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
          const SizedBox(
            height: 40,
          ),
          CustomTextField(
            hint: "Title",
            onsaved: (value) {
              title = value;
            },
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextField(
            hint: "Content",
            maxlines: 5,
            onsaved: (value) {
              subtitle = value;
            },
          ),
          const SizedBox(
            height: 32,
          ),
          BlocBuilder<AddnoteCubit, AddnoteState>(
            builder: (context, state) {
              return CustomButton(
                isLoading: state is AddnoteLoading ? true : false,
                ontap: () {
                  if (formkey.currentState!.validate()) {
                    formkey.currentState!.save();
                    var currentdate = DateTime.now();

                    var currentforrmattedate =
                        DateFormat.yMd().format(currentdate);
                    var notemodel = NoteModel(
                        title: title!,
                        content: subtitle!,
                        date: currentforrmattedate,
                        color: Colors.blue.value);
                    BlocProvider.of<AddnoteCubit>(context).addNote(notemodel);
                  } else {
                    autovalidatemode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              );
            },
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
