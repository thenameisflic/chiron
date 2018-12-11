import 'dart:async' show Future;
import 'dart:convert' show json;
import 'package:flutter/services.dart' show rootBundle;

class Secret {
  final String googleAppID;
  final String apiKey;
  final String databaseURL;
  Secret({this.googleAppID = "", this.apiKey = "", this.databaseURL = ""});

  factory Secret.fromJson(Map<String, dynamic> jsonMap) {
    return new Secret(
        apiKey: jsonMap["api_key"],
        googleAppID: jsonMap["google_app_id"],
        databaseURL: jsonMap["database_url"]);
  }
}

class SecretLoader {
  final String secretPath;
  
  SecretLoader({this.secretPath});
  Future<Secret> load() {
    return rootBundle.loadStructuredData<Secret>(this.secretPath,
        (jsonStr) async {
      final secret = Secret.fromJson(json.decode(jsonStr));
      return secret;
    });
  }
}