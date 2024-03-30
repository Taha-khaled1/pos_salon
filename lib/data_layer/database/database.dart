// ignore_for_file: depend_on_referenced_packages

import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:convert';
import 'package:path/path.dart';
import 'package:pos_animal/application_layer/utils/checkenternet.dart';
import 'package:pos_animal/application_layer/utils/statusrequst.dart';
import 'package:pos_animal/main.dart';

// headers: <String, String>{'Content-Type': 'application/json'},
// String _basicAuth = 'Basic ${base64Encode(utf8.encode('wael:wael1'))}';

class Curd {
  Map<String, String> myheadersfail = {
    'Authorization':
        'Bearer ${sharedPreferences.getString('token').toString()}',
  };
  Map<String, String> myheaders = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'Authorization':
        'Bearer ${sharedPreferences.getString('token').toString()}',
    'Accept-Language': '${sharedPreferences.getString('lang').toString()}',
  };
  Map<String, String> myheaders2 = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'Authorization':
        'Bearer ${sharedPreferences.getString('token').toString()}',
    'Accept-Language': '${sharedPreferences.getString('lang').toString()}',
  };

  Map<String, String> myheaders3 = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'Authorization':
        'Bearer ${sharedPreferences.getString('token').toString()}',
    'Accept-Language': '${sharedPreferences.getString('lang').toString()}',
  };
  getrequest(String url,
      {bool? encode, Map<String, String>? myheadersres}) async {
    try {
      if (await checkInternet()) {
        var respos = await http.get(Uri.parse(url), headers: myheaders3);
        // print('----------------------------------------------------------');
        // print(respos.statusCode);
        // print(respos.body);
        if (respos.statusCode == 200 || respos.statusCode == 201) {
          dynamic body = jsonDecode(respos.body);
          return body;
        } else {
          print('serverfailure');
          return StatusRequest.erorr;
        }
      } else {
        print('offline');
        return StatusRequest.offlinefailure;
      }
    } catch (e) {
      print('Catch : $e');
      return StatusRequest.serverfailure;
    }
  }

  postrequest(String url, Map data,
      {bool? encode, Map<String, String>? myheadersres}) async {
    try {
      if (await checkInternet()) {
        Response respos = await http.post(
          Uri.parse(url),
          body: encode == true ? jsonEncode(data) : data,
          headers: myheadersres,
        );
        dynamic body = jsonDecode(respos.body);
        print(body);
        if (respos.statusCode >= 2) {
          return body;
        } else {
          return StatusRequest.erorr;
        }
      } else {
        print('offline');
        return StatusRequest.offlinefailure;
      }
    } catch (e) {
      print('Catch : $e');
      return StatusRequest.serverfailure;
    }
  }

  putrequest(String url, Map data, {bool? encode}) async {
    try {
      if (await checkInternet()) {
        Response respos = await http.put(
          Uri.parse(url),
          body: encode == true ? jsonEncode(data) : data,
          headers: myheaders2,
        );
        if (respos.statusCode == 200 || respos.statusCode == 201) {
          dynamic body = jsonDecode(respos.body);
          return body;
        } else {
          print(respos.body);
          return StatusRequest.serverfailure;
        }
      } else {
        return StatusRequest.offlinefailure;
      }
    } catch (e) {
      print('ERorr $e');
      return StatusRequest.erorr;
    }
  }

  putrequestforFile(
    String url,
    Map data,
    File file,
  ) async {
    MultipartRequest requst = http.MultipartRequest('Put', Uri.parse(url));
    int length = await file.length();
    ByteStream stream = http.ByteStream(file.openRead());
    MultipartFile multefile = http.MultipartFile(
      'uploads/',
      stream,
      length,
      filename: basename(file.path),
    );
    requst.headers.addAll(myheaders2);
    requst.files.add(multefile);
    data.forEach((key, value) {
      requst.fields[key] = value;
    });
    StreamedResponse myrequest = await requst.send();
    Response response = await http.Response.fromStream(myrequest);
    print('-----------------------------------------');
    print(response.body);
    print(response.statusCode);
    if (myrequest.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print('erorrrrrr');
    }
  }

  postrequestforFile(String url, namepost, Map data, File file,
      {bool? encode, Map<String, String>? myheadersres}) async {
    MultipartRequest requst = http.MultipartRequest('Post', Uri.parse(url));
    int length = await file.length();
    ByteStream stream = http.ByteStream(file.openRead());
    MultipartFile multefile = http.MultipartFile(namepost, stream, length,
        filename: basename(file.path));
    requst.headers.addAll(myheaders);
    requst.files.add(multefile);
    data.forEach((key, value) {
      requst.fields[key] = value;
    });
    StreamedResponse myrequest = await requst.send();
    Response response = await http.Response.fromStream(myrequest);
    print(response.body);
    if (myrequest.statusCode == 200) {
      print(response.body);
      return jsonDecode(response.body);
    } else {}
  }
}
