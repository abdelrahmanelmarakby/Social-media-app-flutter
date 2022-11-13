import 'dart:io';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

import '../../../../../core/resourses/color_manger.dart';
import '../../../../../core/services/chat/private/private_chat.dart';
import '../../../../data/models/private_chat_message.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

double getFileSize({required int bytes, int decimals = 0}) {
  const suffixes = ["b", "kb", "mb", "gb", "tb"];
  var i = (log(bytes) / log(1024)).floor();
  return double.parse(
      ((bytes / pow(1024, i)).toStringAsFixed(decimals)) + suffixes[i]);
}

class Attachment {
  final String myId, hisId, hisName, hisImage, myName, myImage;
  String percent = '0';
  final TextEditingController _controller = TextEditingController();

  Attachment({
    required this.myId,
    required this.hisId,
    required this.hisName,
    required this.hisImage,
    required this.myImage,
    required this.myName,
  });

  Widget messageComposer(BuildContext context) {
    String fluff = '';

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
      height: 70.0,
      // color: MyColors().mainColor,
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextFormField(
              textInputAction: TextInputAction.done,
              onFieldSubmitted: (value) {
                fluff.isNotEmpty ? postMsg(fluff: fluff) : null;
              },
              controller: _controller,
              textCapitalization: TextCapitalization.sentences,
              onChanged: (value) {
                fluff = value;
              },
              decoration: const InputDecoration.collapsed(
                hintText: 'Send a message',
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.attach_file),
            iconSize: 25.0,
            // color: MyColors().btnColor,
            onPressed: () {
              //fluff.isNotEmpty ? postMsg(fluff) : null;
              attachmentDialog(context);
            },
          ),
          IconButton(
            icon: const Icon(Icons.send),
            iconSize: 25.0,
            // color: MyColors().btnColor,
            onPressed: () {
              fluff.isNotEmpty ? postMsg(fluff: fluff) : null;
            },
          ),
        ],
      ),
    );
  }

  void attachmentDialog(BuildContext ctx) {
    showModalBottomSheet(
        // shape: Border.all(color: MyColors().btnColor),
        context: ctx,
        builder: (context) => Container(
              color: Colors.white,
              //    height: Dimensions.getDesirableHeight(25),
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      dialogBtn(
                          icon: Icons.image,
                          text: 'صورة',
                          onTap: () {
                            Navigator.pop(context);
                            uploadImageToStorage(ctx);
                          }),
                      dialogBtn(
                          icon: Icons.play_circle_filled,
                          text: 'فيديو',
                          onTap: () {
                            Navigator.pop(context);
                            uploadVideoToStorage(ctx);
                          }),
                    ],
                  ),
                ],
              ),
            ));
  }

  Future uploadVideoToStorage(BuildContext context) async {
    print('video ttt');
    try {
      final file = await ImagePicker().pickVideo(source: ImageSource.gallery);
      final DateTime now = DateTime.now();
      final int millSeconds = now.millisecondsSinceEpoch;
      final String month = now.month.toString();
      final String date = now.day.toString();
      final String storageId = ('${millSeconds.toString()}+id:$myId+');
      final String today = ('$month-$date');
      print(storageId);

      /// create thumbnail from file///////////////////////
      final thumbnail = await VideoThumbnail.thumbnailData(
        video: file!.path,
        imageFormat: ImageFormat.JPEG,
        maxWidth:
            128, // specify the width of the thumbnail, let the height auto-scaled to keep the source aspect ratio
        quality: 75,
      );

      final tempDir = await getTemporaryDirectory();
      final thumbnailFile = await File('${tempDir.path}/image.jpg').create();
      thumbnailFile.writeAsBytesSync(thumbnail!);

      /// create thumbnail ref  //////////////////////////////////////////////////
      Reference thumbnailRef = FirebaseStorage.instance
          .ref()
          .child("images")
          .child(today)
          .child(storageId);
      UploadTask thumbnailUploadTask =
          thumbnailRef.putFile(File(thumbnailFile.path));

      /// create video ref  //////////////////////////////////////////////////
      Reference ref = FirebaseStorage.instance
          .ref()
          .child("video")
          .child(today)
          .child(storageId);
      UploadTask uploadTask = ref.putFile(
          File(file.path), SettableMetadata(contentType: 'video/mp4'));
      int size = File(file.path).lengthSync();
      downloadDialog(context, uploadTask, size);

      /// upload video  //////////////////////////////////////////////////
      var storageTaskSnapshot = await uploadTask;
      var downloadUrl = await storageTaskSnapshot.ref.getDownloadURL();
      final String url = downloadUrl.toString();

      /// upload thumbnail image  //////////////////////////////////////////////////
      var storageThumbnailTaskSnapshot = await thumbnailUploadTask;
      var downloadThumbnailUrl =
          await storageThumbnailTaskSnapshot.ref.getDownloadURL();
      final String urlThumbnail = downloadThumbnailUrl.toString();

      Navigator.pop(context);
      postMsg(video: url, image: urlThumbnail);
      print(url);
    } catch (error) {
      print(error);
    }
  }

  Future uploadImageToStorage(BuildContext context) async {
    try {
      // set max high & width
      final file = await ImagePicker()
          .pickImage(source: ImageSource.gallery, imageQuality: 100);
      //to create new folder for each day
      final DateTime now = DateTime.now();
      final int millSeconds = now.millisecondsSinceEpoch;
      final String month = now.month.toString();
      final String date = now.day.toString();
      final String storageId = ('${millSeconds.toString()}+id:$myId+');
      final String today = ('$month-$date');
      Reference ref = FirebaseStorage.instance
          .ref()
          .child("images")
          .child(today)
          .child(storageId);
      UploadTask uploadTask = ref.putFile(File(file!.path));
      int size = File(file.path).lengthSync();
      downloadDialog(context, uploadTask, size);
      /* uploadTask.events.listen((StorageTaskEvent snapshot) {
        double _progress = (snapshot.snapshot.bytesTransferred.round() * 100) /
            snapshot.snapshot.totalByteCount.round();

        this.percent = '${_progress.round()}';
        print('${_progress.round()}');
      });*/
      var storageTaskSnapshot = await uploadTask;

      var downloadUrl = await storageTaskSnapshot.ref.getDownloadURL();
      final String url = downloadUrl.toString();

      Navigator.pop(context);
      postMsg(image: url);
      print(url);
    } catch (error) {
      print(error);
    }
  }

  //image + صورة
  Widget dialogBtn(
      {required IconData icon, required String text, required Function onTap}) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
            border: Border.all(width: 2, color: ColorsManger.primary)),
        child: Column(
          children: [
            Icon(
              icon,
              //  size: Dimensions.getDesirableWidth(10),
              //  color: MyColors().btnColor,
            ),
            Text(
              text,
              style: const TextStyle(
                  // fontSize: Dimensions.getDesirableWidth(6),
                  fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }

  void postMsg({
    String? fluff,
    String? image,
    String? video,
  }) async {
    PrivateMessage newFluff = PrivateMessage(
        sender: myId,
        image: image,
        text: fluff,
        video: video,
        time: Timestamp.now().toDate());

    String userA, userB, aName, bName, aImage, bImage;
    if (int.parse(myId) > int.parse(hisId)) {
      userA = myId;
      userB = hisId;
      aName = myName;
      bName = hisName;
      aImage = myImage;
      bImage = hisImage;
    } else {
      userA = hisId;
      userB = myId;
      aName = hisName;
      bName = myName;
      aImage = hisImage;

      bImage = myImage;
    }

    await PrivateChatService(myId: myId, hisId: hisId).postPrivateMessage(
        privateMessage: newFluff,
        userA: userA,
        userB: userB,
        bName: bName,
        bImage: bImage,
        aName: aName,
        aImage: aImage);
    //String hisToken = await ApiProvider().getToken(hisId);
    //todo : send Notification

    _controller.clear();
  }

  downloadDialog(BuildContext context, UploadTask uploadTask, size) {
    // show the dialog
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return DownloadDialogContent(context, uploadTask, size);
      },
    );
  }
}

class DownloadDialogContent extends StatefulWidget {
  const DownloadDialogContent(this.context, this.uploadTask, this.size,
      {Key? key})
      : super(key: key);
  final BuildContext context;
  final UploadTask uploadTask;
  final int size;
  @override
  _DownloadDialogContentState createState() => _DownloadDialogContentState();
}

class _DownloadDialogContentState extends State<DownloadDialogContent> {
  double _prog = 0;
  @override
  void initState() {
    widget.uploadTask.snapshotEvents.listen((event) {
      setState(() {
        print('_prog : $_prog');
        _prog = event.bytesTransferred.toDouble();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: const Text("جاري رفع الملف"),
        content: SizedBox(
          height: 60,
          child: Column(
            children: [
              const Text("يرجى الإنتظار جاري رفع الملف ..."),
              const SizedBox(
                height: 20,
              ),
              Directionality(
                textDirection: TextDirection.ltr,
                child: LinearProgressIndicator(
                  color: ColorsManger.success,
                  value: _prog / widget.size,
                ),
              )
            ],
          ),
        ));
  }
}
