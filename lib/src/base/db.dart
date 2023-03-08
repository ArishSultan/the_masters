import 'package:mongo_dart/mongo_dart.dart';

class Database {
  static const _connectionString =
      'mongodb+srv://arish:1234@cluster0.ogvmmiq.mongodb.net/'
      'the-masters?retryWrites=true&w=majority';

  static void initialize() async {
    _database = await Db.create(
      'mongodb+srv://arish:1234@cluster0.ogvmmiq.mongodb.net/the-masters?retryWrites=true&w=majority',
      // 'mongodb://localhost:27017/the-masters'
    );
    await _database.open();

    _database.collection('users').find().listen((event) {
      print(event);
    });
  }

  static DbCollection collection(String collection) {
    return _database.collection(collection);
  }

  static late Db _database;
}
