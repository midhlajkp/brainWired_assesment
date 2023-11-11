import 'package:brainwired_assesment/model/companyModel.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CompanyProvider extends ChangeNotifier {
  List<CompanyModel> companyList = [];
  Future getCompanyData(BuildContext context) async {
    Dio dio = Dio();

    try {
      var response =
          await dio.get('https://jsonplaceholder.typicode.com/users');
      var data = response.data;
      companyList = companyModelFromJson(data);

      notifyListeners();
    } catch (e) {
      Fluttertoast.showToast(msg: 'Could not fetch data at the moment');
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
