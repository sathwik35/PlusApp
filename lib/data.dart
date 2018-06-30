// credits naar Joost voor deze databaseconnectie ;)

import 'dart:async';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'package:firebase_database/firebase_database.dart';

class Group {
  String key;

  String department;
  String email;
  String firstname;
  String function;
  String lastname;
  String password;
  String phone;
  String username;

  Group(
    this.department, 
    this.email, 
    this.firstname, 
    this.function, 
    this.lastname,
    this.password,
    this.phone,
    this.username
  );

  Group.fromSnapshot(DataSnapshot snapshot)
        : key = snapshot.key,
          department = snapshot.value["department"],
          email = snapshot.value["email"],
          firstname = snapshot.value["firstname"],
          function = snapshot.value["function"],
          lastname = snapshot.value["lastname"],
          password = snapshot.value["password"],
          phone = snapshot.value["phone"],
          username = snapshot.value["username"];  
          
  toJson() {
    return{
      "department" : department,
      "email" : email,
      "firstname" : firstname,
      "function" : function,
      "lastname" : lastname,
      "password" : password,
      "phone" : phone,
      "username" : username
    };
  }
}

class SQFLiteConnect{

  SQFLiteConnect();

  Future<String> connectionstring() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "medewerkers.db");
    return path;
  }

  // Future<String> connectionstringGroup() async {
  //   Directory documentsDirectory = await getApplicationDocumentsDirectory();
  //   String path = join(documentsDirectory.path, "groups.db");
  //   return path;
  // }

  Future<String> insertIntoTable(
    String department, 
    String email,
    String firstname,
    String function,
    String lastname,
    String password,
    String phone,
    String username
  ) async {
    Database _db = await openDatabase(await connectionstring(), version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
          onCreateDb
        );
      }
    );

    Map<String, dynamic> maps = new Map<String, dynamic>();

    maps["department"] = department;
    maps["email"] = email;
    maps["firstname"] = firstname;
    maps["function"] = function;
    maps["lastname"] = lastname;
    maps["password"] = password;
    maps["phone"] = phone;
    maps["username"] = username;

    _db.insert("medewerkers", maps);
    return print("Gegevens succesvol verwerkt!");
  }

  Future<List<Map<String, dynamic>>> getMedewerkers() async {
    Database _db = await openDatabase(await connectionstring(), version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
          onCreateDb
        );
      }
    );
    var result = await _db.query("medewerkers");

    return result;
  }

  Future<bool> updateWorkers(
    String department, 
    String email,
    String firstname,
    String function,
    String lastname,
    String password,
    String phone,
    String username,    
    [String path]
  ) async {
    Database _db = await openDatabase(await connectionstring(), version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
          onCreateDb
        );
      }
    );
    Map<String, dynamic> maps = new Map<String, dynamic>();
    
    maps["department"] = department;
    maps["email"] = email;
    maps["firstname"] = firstname;
    maps["function"] = function;
    maps["lastname"] = lastname;
    maps["password"] = password;
    maps["phone"] = phone;
    maps["username"] = username;  
    
    if (path != null) {
      maps["image"] = path;
    }  
    _db.update("medewerkers", maps, where: "username == '" + username + "'");

    return true;
  }

  Future<bool> deleteWorker(String username) async {
    Database _db = await openDatabase(await connectionstring(), version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
          onCreateDb,
          
        );
      }
    );
    _db.delete("medewerkers", where: "username == + '" + username + "'");

    return true;
  }

  Future<Map<String, dynamic>> getWorker(String username) async {
    Database _db = await openDatabase(await connectionstring(), version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
          onCreateDb
        );
      }
    );
    var m = await _db.query("medewerkers", where: "username == '" + username + "'");
    return m.first;
  }

  get onCreateDb {
    return "CREATE TABLE medewerkers (username VARCHAR PRIMARY KEY, department VARCHAR, firstname VARCHAR, function VARCHAR, lastname VARCHAR, password VARCHAR, phone VARCHAR);";
  }
}