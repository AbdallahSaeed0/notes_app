import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/views/constants.dart';
import 'package:notes_app/views/models/note_model.dart';

part 'addnote_state.dart';

class AddnoteCubit extends Cubit<AddnoteState> {
  AddnoteCubit() : super(AddnoteInitial());

  addNote(NoteModel note) async {
    emit(AddnoteLoading());

    try {
      var notesbox = Hive.box<NoteModel>(kNotesbox);
      emit(AddnoteSuccess());
      await notesbox.add(note);
    } catch (e) {
      AddnoteFaliure(e.toString());
    }
  }
}
