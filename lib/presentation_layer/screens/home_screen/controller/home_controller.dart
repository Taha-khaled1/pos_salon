import 'package:get/get.dart';
import 'package:pos_animal/application_layer/utils/handling.dart';
import 'package:pos_animal/application_layer/utils/statusrequst.dart';
import 'package:pos_animal/data_layer/database/database.dart';
import 'package:pos_animal/data_layer/models/cato.dart';
import 'package:pos_animal/data_layer/models/service.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pos_animal/presentation_layer/screens/service/widgets/right_side_widget.dart';
import 'package:pos_animal/presentation_layer/src/show_toast.dart';
import 'package:intl/intl.dart';
import '../../../../data_layer/database/sqlflite.dart';
import '../home_screen.dart';

String contime(originalTime) {
  // String originalTime = '09:15';

  // تحويل الوقت إلى كائن DateTime
  DateTime time = DateFormat('HH:mm').parse(originalTime);

  // زيادة ساعة واحدة إلى الوقت
  DateTime updatedTime = time.add(Duration(hours: 1));

  // تنسيق الوقت المحدث
  String formattedTime = DateFormat('HH:mm').format(updatedTime);
  return formattedTime;
}

class HomeController extends GetxController {
  bool hasUnreadNotifications = false;
  // ----------------------------------------------------
  bool isLoad1 = false;
  int customernumber = 0;
  int indvidual = 0;
  int price = 0;
  String slot = '';
  int discount = 0;
  DateTime selectedDateN = DateTime.now();
  // ---------------------// search -------------------------------
  late StatusRequest statusRequest;
  var response;
  var responset;
  var responsetNot;
  bool load = true;
  ServiceModel? serviceModel;
  CatogeryesModel? catogeryesModel;
  List<Data> search = [];
  Future<void> deleteServices() async {
    DatabaseHelper dbHelper = DatabaseHelper();
    services = await dbHelper.getServices();
    print('All services:');
    services.forEach((service) {
      dbHelper.deleteService(service.id!);
    });
  }

  Future<void> createOrder() async {
    if (customernumber == 0 || indvidual == 0) {
      showToast('Please fill in the required fields');
      return;
    }
    if (services.isEmpty) {
      showToast('Please fill in the required fields');
      return;
    }
    if (slot.isEmpty) {
      showToast('Please fill in the required fields');
      return;
    }
    isLoad1 = true;
    update();
    Curd curd = Curd();
    // Define the URL
    var url = Uri.parse('https://salon-app.nanots.ae/api/v1/user/order');
    List<Map<String, dynamic>> servicesJson =
        services.map((service) => service.toJson(slot)).toList();
    // print((servicesJson));
    // return;
    // Define the request body
    var body = json.encode({
      "customer_id": customernumber,
      "number_of_individuals": indvidual,
      "order_date":
          "${selectedDateN.day}-${selectedDateN.month}-${selectedDateN.year}", // "08-04-2024",
      "services": servicesJson,
    });

    try {
      // Make the POST request
      var response = await http.post(url, headers: curd.myheaders3, body: body);
      var bodyres = jsonDecode(response.body);
      // Check if the request was successful (status code 200)
      if (response.statusCode == 200) {
        // Request successful, print response body
        print('Response body: ${response.body}');
        showToast(bodyres['message']);
        await deleteServices();
        Get.offAll(() => HomeScreen());
        isLoad1 = false;
        update();
      } else {
        // Request failed, print error status code
        print('Request failed with status: ${bodyres['message']}');
        showToast(bodyres['message']);
        isLoad1 = false;
        update();
      }
    } catch (e) {
      // Catch any errors that occur during the request
      print('Error: $e');
      isLoad1 = false;
      update();
    }
    isLoad1 = false;
    update();
  }

  getHomeRes() async {
    try {
      statusRequest = StatusRequest.loading;
      response = await getServices();
      responset = await getCatogery();

      statusRequest = handlingData(response);
      print("=========x> ${statusRequest}");
      if (statusRequest == StatusRequest.success) {
        print("xxxxxxxxx> ${statusRequest}");
        catogeryesModel = await CatogeryesModel.fromJson(responset);
        serviceModel = await ServiceModel.fromJson(response);
        search = serviceModel!.data!;
      } else {
        statusRequest = StatusRequest.failure;
      }
    } catch (e) {
      statusRequest = StatusRequest.erorr;
    }
  }

  void manualUpdate() {
    update();
  }

  @override
  void onInit() async {
    load = true;
    await getHomeRes();
    update();
    load = false;
    super.onInit();
  }
}

dynamic getCatogery() async {
  Curd curd = Curd();
  var respons = await curd.getrequest(
    "https://salon-app.nanots.ae/api/v1/user/category",
    myheadersres: curd.myheaders3,
  );
  // print("$respons");
  return respons;
}

dynamic getServices() async {
  Curd curd = Curd();
  var respons = await curd.getrequest(
    "https://salon-app.nanots.ae/api/v1/user/service",
    myheadersres: curd.myheaders3,
  );

  return respons;
}
