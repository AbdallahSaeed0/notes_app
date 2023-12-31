import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/views/constants.dart';
import 'package:notes_app/views/models/note_model.dart';

part 'note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit() : super(NoteInitial());

  List<NoteModel>? notes;
  fetchAllNotes() {
    var notesbox = Hive.box<NoteModel>(kNotesbox);

    notes = notesbox.values.toList();
    emit(NoteSuccess());
  }
}
