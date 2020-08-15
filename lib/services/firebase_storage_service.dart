import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class FirebaseStorageService {
  final _storage = FirebaseStorage.instance;

  Future<String> uploadImage(File file, String uid) async {
    final StorageTaskSnapshot uploadTask =
        await _storage.ref().child(uid).putFile(file).onComplete;
    final String url = uploadTask.ref.getDownloadURL().toString();
    print('Download URL : $url');
    return url;
  }
}
