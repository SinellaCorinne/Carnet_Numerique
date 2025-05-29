import 'package:get/get.dart';

class CarnetController extends GetxController {
  static final CarnetController instance = CarnetController._internal();

  CarnetController._internal();

  var _curentIndex = 0.obs;

  updateCurentIndex(value) => _curentIndex.value = value;

  get curentIndex => _curentIndex.value;
}
