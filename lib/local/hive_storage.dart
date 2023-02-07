import 'dart:developer';
import 'package:hive/hive.dart';

class HiveStorage {
  static final HiveStorage _hiveStorage = HiveStorage._internal();

  factory HiveStorage() {
    return _hiveStorage;
  }

  HiveStorage._internal();

  static void post(
      {required int key, required dynamic data, required String box}) {
    // Hive.box(box).put(key, data);
    //check index
    Hive.box(box).put(key, data);
    updateIndex(box: box, index: key);
    log('${get(key: key, box: box)} was added to $box');
  }

  static void update(
      {required int key, required dynamic data, required String box}) {
    Hive.box(box).put(key, data);
    log('${get(key: key, box: box)} was added to $box');
  }

  static void delete({required int key, required String box}) {
    Hive.box(box).delete(key);
    log('$key was deleted from $box');
  }

  static dynamic get({required int key, required String box}) {
    return Hive.box(box).get(key);
  }

  static Map<dynamic, dynamic> list({required String box}) {
    return Hive.box(box).toMap();
  }

  static void deleteAll({required String box}) {
    for (int key in Hive.box(box).keys) {
      delete(key: key, box: box);
    }
  }

  static int getNextIndex({required String box}) {
    return Hive.box('indexes').get(box, defaultValue: 1);
  }

  static void updateIndex({required String box, required int index}) {
    Hive.box('indexes').put(box, index + 1);
    log('nextIndex: ' + getNextIndex(box: box).toString());
  }
}
