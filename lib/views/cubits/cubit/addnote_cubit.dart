import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/views/constants.dart';
import 'package:notes_app/views/models/note_model.dart';

part 'addnote_state.dart';

class AddnoteCubit extends Cubit<AddnoteState> {
  AddnoteCubit() : super(AddnoteInitial());

  Color color = Color(0xffAC3931);
  addNote(NoteModel note) async {
    note.color = color.value;
    emit(AddnoteLoading());

    try {
      var notesbox = Hive.box<NoteModel>(kNotesbox);

      await notesbox.add(note);
      emit(AddnoteSuccess());
    } catch (e) {
      emit(AddnoteFaliure(e.toString()));
    }
  }
}
