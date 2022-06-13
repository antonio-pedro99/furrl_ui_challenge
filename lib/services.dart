import 'dart:convert';
import 'dart:io';

import 'package:furrl_ui_challenge/model/photo.dart';
import 'package:furrl_ui_challenge/response.dart';
import 'package:http/http.dart' as http;

class Services {
  static Future<ResponseHandler> getID() async {
    const String _url = 'https://www.uuidtools.com/api/generate/v1';
    ResponseHandler handler = ResponseHandler();

    var response = await http.get(Uri.parse(_url));
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      handler.setData = data[0];
    } else {
      var error = json.decode(response.body[0]);
      handler.setError = error[0];
    }
    return handler;
  }

  static Future<ResponseHandler> getPhotos(int? p) async {
    const String _url = 'https://picsum.photos/v2/list';
    ResponseHandler handler = ResponseHandler();
    var photos = <Photo>[];

    try {
      var response = await http.get(Uri.parse(_url));
      var jsonList = jsonDecode(response.body);
      for (var photo in jsonList) {
        photos.add(Photo.fromJson(photo));
      }
      handler.setStatusCode = 200;
      handler.setData = photos;
    } catch (e) {
      if (e is IOException) {
        handler.setError = "Check Internet Connection";
      } else {
        handler.setError = "Something Went wrong!";
      }
    }

    return handler;
  }
}
