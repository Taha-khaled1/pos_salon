import 'package:pos_animal/presentation_layer/src/get_packge.dart';

handlingData(response) {
  if (response is StatusRequest) {
    return response;
  } else {
    return StatusRequest.success;
  }
}
