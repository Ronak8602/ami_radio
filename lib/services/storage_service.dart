import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class Storage {
  final firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  Future<firebase_storage.ListResult> listFiles(String categoryName) async {
    firebase_storage.ListResult results = await storage.ref(categoryName).listAll();
    results.items.forEach((firebase_storage.Reference ref) {
      print("Found files: $ref");
    });
    return results;
  }

  Future<String> getDownloadUrl(String audioName) async {
    String downloadUrl =
        await storage.ref('audios/'+audioName).getDownloadURL();
    return downloadUrl;
  }
}
