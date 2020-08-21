import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageService {
  final _storage = FirebaseStorage.instance;

  Future<String> uploadImage(File file, String uid) async {
    final StorageReference ref = _storage.ref().child(uid);
    final StorageUploadTask uploadTask = ref.putFile(file);
    final dynamic downLoadUrl =
        await (await uploadTask.onComplete).ref.getDownloadURL();
    final String downLoadUrlString = downLoadUrl.toString();
    return downLoadUrlString;
  }
}
