// ignore_for_file: depend_on_referenced_packages

import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:convert';
import 'package:path/path.dart';
import 'package:pos_animal/main.dart';
import 'package:pos_animal/presentation_layer/src/get_packge.dart';

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
        'Bearer 9P2kPUdSUfVgWqFz4dy2M991TbAQY2iVwSVRpWvMiLZfLAFG2Xtt5svy6HIIqJ3wOVDyKuzt0jCKWYxRPf3PJMaCdOQPlslVNL4cqTobZMlbDpDm4bgtMTluibL3CYu8MJRJobxzZKlpJCBQsT8LB5xKRt8A1MxpXyeWdYpIZUx3CqxTMkUXi5M3yzdmOu1YEpAYlKHVLxci4Ln0ERQTq9trwKJfkasbKmeJJ5hAHSz8jY4gMFvN6BP5HpEiWnzaDCH6Yn6B3szBbm1cPukJm4UrYd2sZKpvgd45fPuITscVr4TsLjTnRDAMAPb3zL5XX7FRIeg4grToSNv571NU22oQESi0GeYF3LAfHwiCzhnIra1jSNWGERT5pV6hmguVug0awySnfZ3tQTZgjIggmQYMyG5npbQzjfUG5SQdNJJaW4H5npOwkfBALsBEguZdDUEm0LzKT5hoJRghiKh9a7ACs0uCEwVAObZHMLv5F3s4OAKHPrkEMpQyFwNcGGscErHqJk1CyGtl1BUZZDIzvSURco6pN3r24b3aG6ibg4kqN8Oaf1C4fcdItRK9cFqQRAOqsGbN8pxfGvqfQhlSjlVvR8wi3TCUibGhW7tq4TREUVhZoxAeuVkpl8wbxhSnoRU7Zmngpa2AKecgYaFpixtMubsyWdUbTn68PUIvOuMNg5DgwlGELssMmFnC7a532c30',
  };
  getrequest(String url) async {
    try {
      var respos = await http.get(Uri.parse(url), headers: myheaders3);
      print('============');
      print(respos.body);
      print(respos.statusCode);
      print('============');
      if (respos.statusCode == 200 || respos.statusCode == 201) {
        dynamic body = jsonDecode(respos.body);
        print(' body :  $body');
        return body;
      } else {
        print('erorr');
      }
    } catch (e) {
      // ignore: avoid_print
      print('$e');
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
