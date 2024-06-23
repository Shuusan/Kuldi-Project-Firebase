// The Class For the topic
import 'package:kuldi_firebase/firebase/cloud_firebase_export.dart';

// Class CloudFirebaseTopic
class CloudFirebaseTopic {
  String title;
  dynamic page;

  CloudFirebaseTopic(this.title, this.page);
}

// List all the Topic here
List<CloudFirebaseTopic> lsCloudFirebaseTopic = [
  //Module 2 : Lesson 1
  CloudFirebaseTopic("Simple add data", SimpleAddData()),

  //Module 2 : Lesson 2
  CloudFirebaseTopic("Read Data", const StreamData()),
];
