library jaguar.boilerplate.client;

import 'dart:io';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:jaguar_resty/jaguar_resty.dart' as resty;

const String base = 'http://localhost:10000';

const int kPort = 10000;

Future<Null> execVersion() async {
  print(await resty.get("$base/api/version").go().body);
}

Future<Null> execAdd() async {
  print(await resty
      .post('$base//api/add')
      .query('a', '5')
      .query('b', '20')
      .go()
      .body);
}

Future<Null> execInfo() async {
  print(await resty.get("$base/api/info").go().body);
}

main() async {
  resty.globalClient = http.IOClient();

  await execVersion();
  await execAdd();
  await execInfo();
  exit(0);
}
