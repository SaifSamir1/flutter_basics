



import 'package:dartz/dartz.dart';
import 'package:flutter_basics_app/notes/data/models/notes_model.dart';

abstract class NotesRepo {

  Future<Either<String, List<NotesModel>>> getNotes();

  Future<Either<String, void>> addNote(NotesModel note);

  Future<Either<String, void>> updateNote(NotesModel note);

  Future<Either<String, void>> deleteNote(NotesModel note);
  Stream<Either<String, List<NotesModel>>> notesStream();
 }