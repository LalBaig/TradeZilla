import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:trade_zilla/Models/user_class.dart';
import 'package:trade_zilla/utilities/constants.dart';

class DatabaseHelper {
  Future<Database> initDatabase() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'user.db'),
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE Users(uid TEXT PRIMARY KEY, name TEXT, email TEXT, phone TEXT)',
        );
        print('Table Created');
      },
      version: 1,
    );
  }

  Future<bool> insertUserData(UserData userData) async {
    final Database db = await initDatabase();
    db.insert(
      "Users",
      userData.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    return true;
  }

  Future<List<UserData>> retrieveUserData(String? uid) async {
    print('User Id: $uid');
    // Get a reference to the database.
    final db = await initDatabase();

    // Query the table for all The Users.
    final List<Map<String, dynamic>> maps =
        await db.rawQuery('SELECT * FROM Users WHERE uid = \"$uid\" ');

    // Convert the List<Map<String, dynamic> into a List<User>.
    return List.generate(maps.length, (i) {
      return UserData(
          name: maps[i]['name'],
          email: maps[i]['email'],
          phone: maps[i]['phone'],
          uid: maps[i]['uid']);
    });
  }

  Future<void> updateUser(String uid, String name, String phone) async {
    // Get a reference to the database.
    final db = await initDatabase();

    // Update the given Dog.
    await db.rawUpdate('''
       UPDATE Users 
    SET name = ?, phone = ? 
    WHERE uid = ?
    ''', [name, phone, uid]);
  }
}
