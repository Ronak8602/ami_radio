import 'package:flutter/material.dart';

const Color whiteColor = Colors.white;
const Color blackColor = Colors.black;
const Color greyColor = Color(0xFF808080);

const double fixPadding = 10.0;

const TextStyle appBarTextStyle = const TextStyle(
  fontSize: 24.0,
  fontWeight: FontWeight.bold,
  color: blackColor,
);

const kSendButtonTextStyle = TextStyle(
  color: Colors.lightBlueAccent,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
  ),
);

const kTextFieldDecoration = InputDecoration(
  hintText: 'Enter a value',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

// SingleChildScrollView(
// child: FutureBuilder(
// future: storage.listFiles('audios'),
// builder: (BuildContext context,
//     AsyncSnapshot<firebase_storage.ListResult> snapshot) {
// if (snapshot.connectionState == ConnectionState.done &&
// snapshot.hasData) {
// return Expanded(
// child: ListView.builder(
// scrollDirection: Axis.vertical,
// shrinkWrap: true,
// itemCount: snapshot.data!.items.length,
// itemBuilder: (BuildContext context, int index) {
// return Padding(
// padding: const EdgeInsets.symmetric(
// horizontal: 12.0, vertical: 6.0),
// child: InkWell(
// onTap: () async {
// EasyLoadingStyle.light;
// EasyLoading.show(
// status: "Loading...",
// maskType: EasyLoadingMaskType.black);
// String url = await snapshot.data!.items[index]
//     .getDownloadURL();
// String name = snapshot.data!.items[index].name
//     .substring(
// 0,
// snapshot.data!.items[index].name
//     .length -
// 4);
// Navigator.push(
// context,
// MaterialPageRoute(
// builder: (context) => AudioPlayerUrl(
// url: url,
// name: name,
// )));
// EasyLoading.dismiss();
// },
// child: Card(
// elevation: 2,
// child: Row(
// children: [
// const Padding(
// padding: EdgeInsets.all(8.0),
// child: Icon(Icons.play_arrow_outlined,
// color: Colors.blue),
// ),
// Expanded(
// child: Padding(
// padding: const EdgeInsets.all(16.0),
// child: Text(
// snapshot.data!.items[index].name
//     .substring(
// 0,
// snapshot.data!.items[index]
//     .name.length -
// 4),
// style: const TextStyle(fontSize: 20),
// ),
// ),
// ),
// ],
// ),
// ),
// ),
// );
// }),
// );
// }
// if (snapshot.connectionState == ConnectionState.waiting ||
// !snapshot.hasData) {
// return SizedBox(
// height: MediaQuery.of(context).size.height / 1.3,
// child: const Center(
// child: CircularProgressIndicator(),
// ),
// );
// }
// return Container();
// }),
// )