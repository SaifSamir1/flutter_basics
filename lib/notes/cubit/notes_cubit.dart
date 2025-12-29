import 'dart:ffi';

import 'package:flutter_basics_app/notes/cubit/notes_state.dart';
import 'package:flutter_basics_app/notes/data/models/notes_model.dart';
import 'package:flutter_basics_app/notes/data/repo/notes_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotesCubit extends Cubit<NotesState> {
  final NotesRepo notesRepository;

  NotesCubit({required this.notesRepository}) : super(NotesInitial());

  Future<void> addNotes(NotesModel notesModel) async {
    emit(AddNotesLoading());
    final result = await notesRepository.addNote(notesModel);
    result.fold(
      (error) {
        emit(AddNotesError(error));
      },
      (_) {
        emit(AddNotesSuccess());
      },
    );
  }

  void getNotesStream() {
    emit(GetNotesStreamLoading());
    notesRepository.notesStream().listen((result) {
      result.fold(
        (error) {
          emit(GetNotesStreamError(
              error
          ));
        },
        (notesList) {
          emit(GetNotesStreamSuccess(
              notesList
          ));
        },
      );
    });

  }
}