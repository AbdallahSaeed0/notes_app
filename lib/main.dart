import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/views/cubits/cubit/addnote_cubit.dart';
import 'package:notes_app/views/models/note_model.dart';
import 'package:notes_app/views/notes_view.dart';

import 'views/constants.dart';

void main() async {
  await Hive.initFlutter();

  await Hive.openBox(kNotesbox);
  Hive.registerAdapter(NoteModelAdapter());
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AddnoteCubit(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          fontFamily: 'Poppins',
        ),
        routes: {
          NotesView().id: (context) => NotesView(),
        },
        initialRoute: NotesView().id,
      ),
    );
  }
}
