

import 'package:flutter_basics_app/notes/data/models/notes_model.dart';

abstract class NotesState {}

class NotesInitial extends NotesState {}

class AddNotesLoading extends NotesState {}
class AddNotesSuccess extends NotesState {}
class AddNotesError extends NotesState {
  final String error;
  AddNotesError(this.error);
}

class GetNotesLoading extends NotesState {}
class GetNotesSuccess extends NotesState {}
class GetNotesError extends NotesState {}

class DeleteNotesLoading extends NotesState {}
class DeleteNotesSuccess extends NotesState {}
class DeleteNotesError extends NotesState {}

class UpdateNotesLoading extends NotesState {}
class UpdateNotesSuccess extends NotesState {}
class UpdateNotesError extends NotesState {}


class GetNotesStreamLoading extends NotesState {}
class GetNotesStreamSuccess extends NotesState {
  final List<NotesModel> notes;
  GetNotesStreamSuccess(this.notes);
}
class GetNotesStreamError extends NotesState {
  final String error;
  GetNotesStreamError(this.error);
}