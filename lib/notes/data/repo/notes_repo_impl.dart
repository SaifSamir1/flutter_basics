 
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_basics_app/notes/data/models/notes_model.dart';
import 'package:flutter_basics_app/notes/data/repo/notes_repo.dart';

class NotesRepoImpl implements NotesRepo {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final String collectionName = 'notes';

  @override
  Future<Either<String, void>> addNote(NotesModel note) async {
    try {
      await firestore.collection(collectionName).add(note.toJson());
      return const Right(null);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, void>> deleteNote(NotesModel note) async {
    try {
      await firestore.collection(collectionName).doc(note.id).delete();
      return const Right(null);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, List<NotesModel>>> getNotes() async {
    try {
      final snapshot = await firestore.collection(collectionName).get();
      final notes = snapshot.docs
          .map((doc) => NotesModel.fromJson(doc.data(), doc.id))
          .toList();
      return Right(notes);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Stream<Either<String, List<NotesModel>>> notesStream() {
    try {
      return firestore.collection(collectionName).snapshots().map((snapshot) {
        final notes = snapshot.docs
            .map((doc) => NotesModel.fromJson(doc.data(), doc.id))
            .toList();
        return Right(notes);
      });
    } catch (e) {
      return Stream.value(Left(e.toString()));
    }
  }

  @override
  Future<Either<String, void>> updateNote(NotesModel note) async {
    try {
      await firestore
          .collection(collectionName)
          .doc(note.id)
          .update(note.toJson());
      return const Right(null);
    } catch (e) {
      return Left(e.toString());
    }
  }

  // Implementation details would go here
}
