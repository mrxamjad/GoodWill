import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NetworkController extends GetxController {
  final Connectivity _connectivity = Connectivity();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  void _updateConnectionStatus(ConnectivityResult connectivityResult) {
    if (connectivityResult == ConnectivityResult.none) {
      // Get.rawSnackbar(
      //   message: "NO INTERNET CONNECTION",
      //   isDismissible: false,
      //   duration: Duration(days: 1),
      // );

      Get.dialog(
        WillPopScope(
          onWillPop: () async => false,
          child: Dialog(
            child: SizedBox(
              height: 150,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                        left: 20, right: 20, bottom: 20, top: 20),
                    // decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(10),
                    //     border: Border.all(color: Colors.red, width: 1)),
                    child: const Padding(
                      padding: EdgeInsets.only(top: 25, left: 25, right: 25),
                      child: Center(
                        child: Text(
                          "No Internet Connection!!",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Positioned(
                      right: 90,
                      // left: 100,
                      top: -60,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 50,
                        child: CircleAvatar(
                            backgroundColor: Colors.red,
                            radius: 49,
                            child: Icon(
                              Icons.cancel,
                              size: 80,
                              color: Colors.white,
                            )),
                      )),
                ],
              ),
            ),
          ),
        ),
        barrierDismissible: false,
      );
    } else {
      if (Get.isDialogOpen ?? false) {
        Get.back();
      }
    }
  }
}
