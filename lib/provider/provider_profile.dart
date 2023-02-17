import 'package:app_tutorial1/db/db_profile.dart';
import 'package:app_tutorial1/home.dart';
import 'package:app_tutorial1/models/model_profile.dart';
import 'package:app_tutorial1/style/font.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class ProviderProfile extends ChangeNotifier {
  BuildContext context;
  ProviderProfile(this.context);

  int _count = 0;
  String? myValue;
  String? defaultValue;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }

  SQLiteDatabaseProfile db = SQLiteDatabaseProfile();
  ModelProfile _modelProfile = ModelProfile();

  Map<String, dynamic> getListmap() {
    Map<String, dynamic> mapp;
    return mapp = {
      _modelProfile.sID.toString(): idController.text,
      _modelProfile.sNickName.toString(): nickNameController.text,
      _modelProfile.sFirstName.toString(): firstNameController.text,
      _modelProfile.sLastName.toString(): lastNameController.text,
      _modelProfile.sNumberPhone.toString(): numberPhoneController.text,
      // _modelProfile.sImages.toString(): imagesController.text,
      _modelProfile.sNumberHouse.toString(): numberHouseController.text,
      _modelProfile.sVillage.toString(): villageController.text,
      _modelProfile.sVillageNo.toString(): villageNoController.text,
      _modelProfile.sLane.toString(): laneController.text,
      _modelProfile.sRoad.toString(): roadController.text,
      _modelProfile.sSubdistrict.toString(): subDistrictController.text,
      _modelProfile.sDistrict.toString(): districtController.text,
      _modelProfile.sProvince.toString(): provincetController.text,
      _modelProfile.sPostalCode.toString(): postalCodeController.text,
    };
  }

  Future<int> _insertItem() async {
    Map<String, dynamic> map = getListmap();
    return await db.insertItem(map);
  }

  Future<int> _updateData() async {
    Map<String, dynamic> map = getListmap();
    return db.updateData(map);
  }

  String sGetid = '';
  String sGetFirstName = '';
  String sGetLastName = '';
  String sGetNickName = '';
  String sGetNumberPhone = '';
  String sGetNumberHouse = '';
  String sGetVillage = '';
  String sGetVillageNo = '';
  String sGetLane = '';
  String sGetRoad = '';
  String sGetSubdistrict = '';
  String sGetDistrict = '';
  String sGetProvince = '';
  String sGetPostalCode = '';

  void recordSnackbar(String title) {
    
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => Home(screenIndex: 0),
      ));
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(title),
        ),
      );
    notifyListeners();
  }

  getitem() async {
    List<Map<String, dynamic>> list = await db.getData();
    
      list.forEach((row) {
        print(row);
        sGetid = row[_modelProfile.sID];
        sGetFirstName = row[_modelProfile.sFirstName];
        sGetLastName = row[_modelProfile.sLastName];
        sGetNickName = row[_modelProfile.sNickName];
        sGetNumberPhone = row[_modelProfile.sNumberPhone];
        sGetNumberHouse = row[_modelProfile.sNumberHouse];
        sGetVillage = row[_modelProfile.sVillage];
        sGetVillageNo = row[_modelProfile.sVillageNo];
        sGetLane = row[_modelProfile.sLane];
        sGetRoad = row[_modelProfile.sRoad];
        sGetSubdistrict = row[_modelProfile.sSubdistrict];
        sGetDistrict = row[_modelProfile.sDistrict];
        sGetProvince = row[_modelProfile.sProvince];
        sGetPostalCode = row[_modelProfile.sPostalCode];
        idController = TextEditingController(text: sGetid);
        nickNameController = TextEditingController(text: sGetNickName);
        firstNameController = TextEditingController(text: sGetFirstName);
        lastNameController = TextEditingController(text: sGetLastName);
        numberPhoneController = TextEditingController(text: sGetNumberPhone);
        numberHouseController = TextEditingController(text: sGetNumberHouse);
        villageController = TextEditingController(text: sGetVillage);
        villageNoController = TextEditingController(text: sGetVillageNo);
        laneController = TextEditingController(text: sGetLane);
        roadController = TextEditingController(text: sGetRoad);
        subDistrictController = TextEditingController(text: sGetSubdistrict);
        districtController = TextEditingController(text: sGetDistrict);
        provincetController = TextEditingController(text: sGetProvince);
        postalCodeController = TextEditingController(text: sGetPostalCode);

        // print(idController.text);
      });
    notifyListeners();
  }

  Future<bool> _checkRecordDatabase() async {
    bool haveData = false;
    List<Map<String, dynamic>> database = await db.getData();
    if (database.length < 1) {
      haveData = false;
    } else {
      haveData = true;
    }
    return haveData;
  }

  _save() async {
    int result = 0;
    bool haveData = await _checkRecordDatabase();

    if (haveData) {
      result = await _updateData();
      recordSnackbar('แก้ไขข้อมูลแล้ว');
    } else {
      result = await _insertItem();
      recordSnackbar('บันทึกสำเร็จ');
    }

    // if (result == 0) {
    //   recordSnackbar('แก้ไขข้อมูลแล้ว');
    // } else if (result > 0) {
    //   recordSnackbar('บันทึกสำเร็จ');
    //
  }

  var sizedBox5 = SizedBox(
    height: 10,
  );

  final formKey = GlobalKey<FormState>();
  final formKeytest = GlobalKey<FormState>();

  submit() {
    if (!formKey.currentState!.validate()) {
      formKey.currentState!.save();
    }
    if (!formKeytest.currentState!.validate()) {}

    _save();
  }

  TextEditingController idController = TextEditingController();
  TextEditingController nickNameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController numberPhoneController = TextEditingController();
  TextEditingController imagesController = TextEditingController();
  TextEditingController numberHouseController = TextEditingController();
  TextEditingController villageController = TextEditingController();
  TextEditingController villageNoController = TextEditingController();
  TextEditingController laneController = TextEditingController();
  TextEditingController roadController = TextEditingController();
  TextEditingController subDistrictController = TextEditingController();
  TextEditingController districtController = TextEditingController();
  TextEditingController provincetController = TextEditingController();
  TextEditingController postalCodeController = TextEditingController();

  //     void controller (){
  //   String sGetid = _modelProfile.sFirstName;
  //    idController  = TextEditingController(text: sGetid);
  // }

  

  

  controllerDispose() {
    idController.dispose();
    nickNameController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    numberPhoneController.dispose();
    imagesController.dispose();
    numberHouseController.dispose();
    villageController.dispose();
    villageNoController.dispose();
    laneController.dispose();
    roadController.dispose();
    subDistrictController.dispose();
    districtController.dispose();
    provincetController.dispose();
    postalCodeController.dispose();
  }
}

