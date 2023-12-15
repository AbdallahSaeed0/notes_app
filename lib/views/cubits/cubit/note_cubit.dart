import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/views/constants.dart';
import 'package:notes_app/views/models/note_model.dart';

part 'note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit() : super(NoteInitial());

  fetchAllNotes() {
    addNote(NoteModel note) async {
      emit(NoteLoading());

      try {
        var notesbox = Hive.box<NoteModel>(kNotesbox);

        List<NoteModel> notes = notesbox.values.toList();
        emit(NoteSuccess(notes));
      } catch (e) {
        emit(NoteFaliure(e.toString()));
      }
    }
  }
}
