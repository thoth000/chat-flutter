enum StorageType {
  user,
  room,
}

String storageTypeToString(StorageType storageType) {
  switch (storageType) {
    case StorageType.user:
      return 'users';
    case StorageType.room:
      return 'rooms';
  }
  // ここは通らない
  return '';
}
