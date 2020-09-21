import 'dart:io';
import 'package:chat_flutter/model/storage_type.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageService {
  final _storage = FirebaseStorage.instance;

  Future<String> uploadImage(
      File file, String uid, StorageType storageType) async {
    final StorageReference ref =
        _storage.ref().child('${storageTypeToString(storageType)}/$uid');
    final StorageUploadTask uploadTask = ref.putFile(file);

    await uploadTask.onComplete;

    final dynamic downloadUrl = await ref.getDownloadURL();
    final String downloadUrlString = downloadUrl.toString();

    return downloadUrlString;
  }
}
