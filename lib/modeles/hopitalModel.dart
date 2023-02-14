import 'package:cloud_firestore/cloud_firestore.dart';

class Hopitals {
  String? hopitalID, hopitalName, hopitalUrlImg, hopitalUserID, hopitalUserName;
  Timestamp? hopitalTimestamp;

  Hopitals(
      {this.hopitalID,
      this.hopitalName,
      this.hopitalUrlImg,
      this.hopitalUserID,
      this.hopitalUserName,
      this.hopitalTimestamp,
      });
}
