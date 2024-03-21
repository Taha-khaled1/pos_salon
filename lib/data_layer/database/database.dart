// ignore_for_file: depend_on_referenced_packages

import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:convert';
import 'package:path/path.dart';
import 'package:pos_animal/main.dart';
import 'package:pos_animal/presentation_layer/src/get_packge.dart';

import '../../presentation_layer/screens/auth/auth_screen.dart';

class Curd {
  Map<String, String> myheaders = {
    'Content-Type': 'application/json',
    'X-Requested-With': 'XMLHttpRequest',
  };
  Map<String, String> myheaders2 = {
    'Content-Type': 'application/json',
    'Authorization':
        'Bearer ${sharedPreferences.getString('access_token').toString()}',
  };

  Map<String, String> myheaders3 = {
    'Authorization':
        'Bearer uVjFKSWFa7z70hJV5cQdVgYFKzQZFknuYjgNsqJV1Pi8dXlhtQ6aPkbq57DTymOWtRNc7u0FRD8ygR5eLdNvN5CKLZ8Bnivms3HPeaScn5eEETpRDD4SjvSfjAcy74ZPAVKv7AwQr9CGpb1iHMoWzVX5eYFhE5fDlMt8jTTKZom2ffj9yb0pip7eCXh5yOdbmpb2x3dPuWA4zjCCLa9QuCkacnJMtsKT7BcdGDH9k2KnL0Jpp2p63nPMtiO5X7TEn0aMUS85Z2uL2Qt607ya0qPvodJ8IeCrXEYacGF2rv6yz2jBxSrZyYp99Z5RKU7oEhoO3homDHgODJBu1OHR9XSjZ0h9eQIWDnRJUFtqtwVtVptdd1h2FEqfTBzYSA0dtecFmPP0bfTBYmmov3OtcHSaE02vIFxyjSA9deBlKyBa9NXFNCRG5PbGSRVOwUrXdUljjqJlY4fVARrgG8wqm5o5ZTxueSKCV4Lvp5t8hnYPqUqohAmzxK1PybFvfo8JkxhBgWt6UfftwZ3kAitrFOToHqZZTvDNn0m2HmCsNPmJMykrMU1UplyNsXcVWYMyKjPyITI2tD0i10rvEmSHsuRsbURifSBCB8fcLlcWZBYDfKGvZa2IbYNZY6m2SiQGOBWHjGu08AVnsuCdLYfGgm104wizKEZATvKMSG4Zxh0tNf7o0kyVDvOOQfbI137f731a',
  };
  getrequest(String url) async {
    try {
      var respos = await http.get(Uri.parse(url), headers: myheaders3);
      print('=======${respos.statusCode}=====');
      if (respos.statusCode == 401) {
        sharedPreferences.remove("id");
        Get.offAll(() => AuthScreen());
        return;
      }
      // print(respos.body);
      // print(respos.statusCode);
      print('============');
      if (respos.statusCode == 200 || respos.statusCode == 201) {
        dynamic body = jsonDecode(respos.body);
        // print(' body :  $body');
        return body;
      } else {
        sharedPreferences.remove("id");
        Get.offAll(() => AuthScreen());
        return;
      }
    } catch (e) {
      sharedPreferences.remove("id");
      Get.offAll(() => AuthScreen());
      return;
    }
  }

  deleterequest(String url, Map data,
      {bool? encode, Map<String, String>? myheadersres}) async {
    try {
      if (await checkInternet()) {
        var respos = await http.delete(
          Uri.parse(url),
          body: encode == true ? jsonEncode(data) : data,
          headers: myheadersres,
        );
        print(respos.body);
        print(respos.statusCode);
        if (respos.statusCode == 200 || respos.statusCode == 201) {
          dynamic body = jsonDecode(respos.body);
          return body;
        } else {
          print('serverfailure');
          return StatusRequest.none;
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
        var respos = await http.post(
          Uri.parse(url),
          body: encode == true ? jsonEncode(data) : data,
          headers: myheadersres,
        );
        print(respos.body);
        print(respos.statusCode);
        if (respos.statusCode == 200 || respos.statusCode == 201) {
          dynamic body = jsonDecode(respos.body);
          return body;
        } else {
          print('serverfailure');
          return StatusRequest.none;
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
        var respos = await http.put(
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
    var multefile = http.MultipartFile('uploads/', stream, length,
        filename: basename(file.path));
    requst.headers.addAll(myheaders2);
    requst.files.add(multefile);
    data.forEach((key, value) {
      requst.fields[key] = value;
    });
    StreamedResponse myrequest = await requst.send();
    var response = await http.Response.fromStream(myrequest);
    print('-----------------------------------------');
    print(response.body);
    print(response.statusCode);
    if (myrequest.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print('erorrrrrr');
    }
  }

  strequestforFile(
    String url,
    namepost,
    Map data,
    File file,
  ) async {
    MultipartRequest requst = http.MultipartRequest('Post', Uri.parse(url));
    int length = await file.length();
    ByteStream stream = http.ByteStream(file.openRead());
    var multefile = http.MultipartFile(namepost, stream, length,
        filename: basename(file.path));
    requst.headers.addAll(myheaders);
    requst.files.add(multefile);
    data.forEach((key, value) {
      requst.fields[key] = value;
    });
    StreamedResponse myrequest = await requst.send();
    var response = await http.Response.fromStream(myrequest);
    if (myrequest.statusCode == 200) {
      return jsonDecode(response.body);
    } else {}
  }
}
