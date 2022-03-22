import 'package:ami_radio/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../services/storage_service.dart';
import 'audio_player.dart';

class AudioList extends StatefulWidget {
  final String title;
  final String category;
  const AudioList({Key? key, required this.title, required this.category})
      : super(key: key);

  @override
  State<AudioList> createState() => _AudioListState();
}

class _AudioListState extends State<AudioList> {
  @override
  Widget build(BuildContext context) {
    final Storage storage = Storage();
    return Scaffold(
      appBar: AppBar(
        elevation: 1.0,
        backgroundColor: whiteColor,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: blackColor,
            )),
        centerTitle: true,
        title: Text(
          widget.title,
          style: appBarTextStyle,
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: FutureBuilder(
            future: storage.listFiles(widget.category),
            builder: (BuildContext context,
                AsyncSnapshot<firebase_storage.ListResult> snapshot) {
              if (snapshot.connectionState == ConnectionState.done &&
                  snapshot.hasData) {
                return Expanded(
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: snapshot.data!.items.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12.0, vertical: 6.0),
                          child: InkWell(
                            onTap: () async {
                              EasyLoadingStyle.light;
                              EasyLoading.show(
                                  status: "Loading...",
                                  maskType: EasyLoadingMaskType.black);
                              String url = await snapshot.data!.items[index]
                                  .getDownloadURL();
                              String name = snapshot.data!.items[index].name
                                  .substring(
                                      0,
                                      snapshot.data!.items[index].name.length -
                                          4);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AudioPlayerUrl(
                                            url: url,
                                            name: name,
                                          )));
                              EasyLoading.dismiss();
                            },
                            child: Card(
                              elevation: 2,
                              child: Row(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Icon(Icons.play_arrow_outlined,
                                        color: Colors.blue),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Text(
                                        snapshot.data!.items[index].name
                                            .substring(
                                                0,
                                                snapshot.data!.items[index].name
                                                        .length -
                                                    4),
                                        style: const TextStyle(fontSize: 20),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                );
              }
              if (snapshot.connectionState == ConnectionState.waiting ||
                  !snapshot.hasData) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height / 1.3,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
              return Container();
            }),
      )),
    );
  }
}
