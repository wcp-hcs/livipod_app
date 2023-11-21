import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:livipod_app/models/livi_pod.dart';

class LiviPodController extends ChangeNotifier {
  final StreamController<List<LiviPod>> _liviPodStreamController =
      StreamController<List<LiviPod>>.broadcast();

  Future<LiviPod> addLiviPod(LiviPod liviPod) async {
    var json = await FirebaseFirestore.instance
        .collection('livipods')
        .add(liviPod.toJson());
    liviPod.id = json.id;
    return Future.value(liviPod);
  }

  Future updateLiviPod(LiviPod liviPod) async {
    try {
      var jsonMap = liviPod.toJson();
      final pod = await FirebaseFirestore.instance
          .collection('livipods')
          .where('macAddress', isEqualTo: liviPod.macAddress)
          .get()
          .then((querySnapshot) {
        return querySnapshot.docs[0].reference;
      });
      var batch = FirebaseFirestore.instance.batch();
      batch.update(pod, jsonMap);
      batch.commit();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }

    return Future.value();
  }

  Future<bool> liviPodExists(LiviPod liviPod) async {
    var exists = false;
    await FirebaseFirestore.instance
        .collection('livipods')
        .where('macAddress', isEqualTo: liviPod.macAddress)
        .get()
        .then((querySnapshot) {
      exists = querySnapshot.size > 0;
    });
    return Future.value(exists);
  }

  Stream<List<LiviPod>> listenToLiviPodsRealTime() {
    FirebaseFirestore.instance.collection('livipods').snapshots().listen(
        (liviPodsSnapshot) {
          if (liviPodsSnapshot.docs.isNotEmpty) {
            var liviPods = liviPodsSnapshot.docs.map((snapshot) {
              var liviPod = LiviPod.fromJson(snapshot.data());
              liviPod.id = snapshot.id;
              return liviPod;
            }).toList();
            _liviPodStreamController.add(liviPods);
          }
        },
        cancelOnError: true,
        onError: (error) {
          if (kDebugMode) {
            print(error);
          }
        });
    return _liviPodStreamController.stream;
  }
}