import 'package:doctor_consultation/models/api/video_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static const _databaseName = "doctordb.db";
  static const _databaseVersion = 1;

  static const table = 'videos';

  static const columnVideoID = 'VideoID';
  static const columnDoctorID = 'DoctorID';
  static const columnTitle = 'Title';
  static const columnDescription = 'Description';
  static const columnVideoPath = 'VideoPath';
  static const columnThumbnail = 'Thumbnail';
  static const columnVideoUrl = 'VideoUrl';
  static const columnIsPaid = 'IsPaid';
  static const columnSubscriptionID = 'SubscriptionID';
  static const columnAddedBy = 'AddedBy';
  static const columnAddedOn = 'AddedOn';
  static const columnUpdatedBy = 'UpdatedBy';
  static const columnUpdatedOn = 'UpdatedOn';
  static const columnIsActive = 'IsActive';

  // make this a singleton class
  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // only have a single app-wide reference to the database
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    // lazily instantiate the db the first time it is accessed
    _database = await _initDatabase();
    return _database!;
  }

  // this opens the database (and creates it if it doesn't exist)
  _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            $columnVideoID INTEGER,
            $columnDoctorID INTEGER,
            $columnTitle TEXT,
            $columnDescription TEXT,
            $columnVideoPath TEXT,
            $columnThumbnail TEXT,
            $columnVideoUrl TEXT,
            $columnSubscriptionID INTEGER,
            $columnAddedBy INTEGER,
            $columnAddedOn TEXT,
            $columnUpdatedBy INTEGER,
            $columnUpdatedOn TEXT
          )
          ''');
  }

  // Helper methods

  Future<int> insert(VideoModel videoModel) async {
    Database db = await instance.database;
    videoModel.toJson().remove("IsActive");
    videoModel.toJson().remove("IsPaid");
    return await db.insert(table, videoModel.toJson());
  }

  Future<int> insertAll(List<VideoModel> videos) async {
    Database db = await instance.database;
    List<dynamic> listRes = [];
    var res;
    try {
      await db.transaction((txn) async {
        videos.forEach((obj) async {
          try {
            var el = obj.toJson();
            el.remove("IsActive");
            el.remove("IsPaid");
            var iRes = await txn.insert(table, el,conflictAlgorithm: ConflictAlgorithm.replace);
            listRes.add(iRes);
          } catch (ex) {
            debugPrint("Error $ex" );
          }
        });
      });

      res = listRes.length;
    } catch (er) {
      debugPrint("Error $er" );
    }
    return res;



  }

  // All of the rows are returned as a list of maps, where each map is
  // a key-value list of columns.
  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await instance.database;
    var records = await db.query(table);

    List<Map<String, dynamic>> videos = [];
    for (var element in records) {
      final video = Map.of(element);

      video["IsPaid"] = true;
      video["IsActive"] = true;

      videos.add(video);
    }
    return videos;
  }
}
