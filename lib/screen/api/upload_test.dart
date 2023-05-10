import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:video_compress/video_compress.dart';

class UploadController extends GetxController {
  compressVideoFile(String videoFilePath) async {
    final compressVideoFilePath = await VideoCompress.compressVideo(
        videoFilePath,
        quality: VideoQuality.LowQuality);

    return compressVideoFilePath?.file;
  }

  uploadCompressedVideo(String videoId, String videoFilePath) async {
    UploadTask videoUploadTask = FirebaseStorage.instance
        .ref()
        .child("All videos")
        .child(videoId)
        .putFile(await compressVideoFile(videoFilePath));

    TaskSnapshot snapshot = await videoUploadTask;

    String downloadUrlOfUploadedVideo = await snapshot.ref.getDownloadURL();

    return downloadUrlOfUploadedVideo;
  }
}
