import 'package:brainwired_assesment/providers/companyProvider.dart';
import 'package:brainwired_assesment/res/style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../supportingWidgets/companyCard.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

CompanyProvider companyProvider = CompanyProvider();
late List<bool> isPressedList;

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        companyProvider.getCompanyData(context);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    companyProvider = Provider.of(context);
    isPressedList =
        List.generate(companyProvider.companyList.length, (index) => false);
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 1,
          title: Text(
            "Companies",
            style: openSansFont(size: size18, fontWeight: fontWeightSemiBold),
          ),
        ),
        body: ListView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: companyProvider.companyList.length,
          itemBuilder: (context, index) => CompanyInfoCard(
            companyModel: companyProvider.companyList[index],
            isPressed: isPressedList,
            index: index,
          ),
        ));
  }
}
