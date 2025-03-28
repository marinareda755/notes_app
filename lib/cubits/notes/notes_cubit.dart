// import 'package:bloc/bloc.dart';
// import 'package:hive/hive.dart';
// import 'package:meta/meta.dart';
// import 'package:notes_app/constans.dart';
// import 'package:notes_app/models/note_model.dart';

// part 'notes_state.dart';

// class NotesCubit extends Cubit<NotesState> {
//   NotesCubit() : super(NotesInitial());

//   fetchAllNotes() async {

//     try {
//       var notesBox = Hive.box<NoteModel>(kNoteBox);
//      List<NoteModel>notes= notesBox.values.toList();
//       emit(NotesSuccess(notes));
//     } catch (e) {
//       emit(NotesFailure(e.toString()));
//     }
//   }
// }

import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/constans.dart';
import 'package:notes_app/models/note_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

  List<NoteModel>? notes;
  fetchAllNotes() async {
    var notesBox = Hive.box<NoteModel>(kNoteBox);
    notes = notesBox.values.toList();
    emit(NotesSuccess());
  }
}
