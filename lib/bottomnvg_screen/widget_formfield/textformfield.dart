import 'package:app_tutorial1/bottomnvg_screen/screen_account.dart';
import 'package:app_tutorial1/db/db_profile.dart';
import 'package:app_tutorial1/home.dart';
import 'package:app_tutorial1/models/model_profile.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Textformfield extends StatefulWidget {
  final Function function;

  Textformfield(this.function);
  @override
  State<Textformfield> createState() => _TextformfieldState();
}

class _TextformfieldState extends State<Textformfield> {
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

  getitem() async {
    List<Map<String, dynamic>> list = await db.getData();

    setState(() {
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
    });
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
    } else {
      result = await _insertItem();
    }

    if (result > 0) {
      setState(() {
        widget.function;
      });
      // Navigator.push(context, MaterialPageRoute(builder: (context) {
      //   return Home(screenIndex: 0,);
      // },));
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(
      //     content: Text('แก้ไขข้อมูลสำเร็จ!'),
      //   ),
      // );
    }
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

  Row TextFormfieldd(
      String name, TextEditingController controller, String modelProfile) {
    return Row(
      children: [
        Expanded(
          child: Text(
            name,
            style: TextStyle(fontSize: 17, color: Colors.black87),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.grey.shade200,
              ),
              child: TextFormField(
                controller: controller,
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'กรุณาใส่ ลิงค์ Url';
                  }
                  return null;
                },
                onSaved: (newValue) {
                  modelProfile = newValue.toString();
                },
                decoration: InputDecoration(
                  isDense: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Row ImageTextFormfield(String sGetProfile) {
    return Row(
      children: [
        Expanded(
          child: Text(
            'รูปภาพ',
            style: TextStyle(fontSize: 15, color: Colors.black87),
          ),
        ),
        Expanded(
          flex: 2,
          child: Form(
            key: formKey,
            child: TextFormField(
              // validator: (value) {
              //   if (value!.isEmpty) {
              //     return 'กรุณาใส่ ลิงค์ Url';
              //   }
              //   return null;
              // },
              controller: imagesController,
              decoration: InputDecoration(hintText: 'ใส่ Url รูปภาพ'),
              onChanged: (value) {
                setState(
                  () {
                    // value = imagesController.text;
                  },
                );
              },
              // onSaved: (newValue) {
              //   sGetProfile = newValue.toString();
              // },
            ),
          ),
        ),
      ],
    );
  }

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

  @override
  void initState() {
    getitem();

    super.initState();
  }

  @override
  void dispose() {
    controllerDispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: Container(
          margin: EdgeInsets.all(14),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'ข้อมูลส่วนตัว',
                      // style: Theme.of(context).textTheme.headline5,
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.black45),
                    ),
                  ),
                  ElevatedButton.icon(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Colors.greenAccent.shade700,
                      ),
                    ),
                    onPressed: submit,
                    icon: Icon(
                      Icons.save,
                      color: Colors.white
                    ),
                    label: Text(
                      'บันทึก',
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),
                    ),
                  )
                ],
              ),
              sizedBox5,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  imagesController.text.isEmpty
                      ? Stack(
                          alignment: AlignmentDirectional.bottomEnd,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Container(
                                width: 140,
                                height: 140,
                                color: Colors.grey.shade200,
                                child: Image.asset(
                                  'assets/placeholder-image.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Icon(
                              Icons.image,
                              size: 28,
                            ),
                          ],
                        )
                      : Container(
                          width: 140,
                          height: 140,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: CachedNetworkImage(
                              fit: BoxFit.cover,
                              imageUrl: imagesController.text,
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                              placeholder: (context, url) {
                                return CircularProgressIndicator();
                              },
                            ),
                          ),
                        )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              ImageTextFormfield(idController.text),
              SizedBox(
                height: 10,
              ),
              Form(
                key: formKeytest,
                child: Column(
                  children: [
                    TextFormfieldd(
                      'ID ผู้ใช้งาน',
                      idController,
                      idController.text,
                    ),
                    sizedBox5,
                    TextFormfieldd(
                      'ชื่อเล่น',
                      nickNameController,
                      nickNameController.text,
                    ),
                    sizedBox5,
                    TextFormfieldd(
                      'ชื่อจริง',
                      firstNameController,
                      firstNameController.text,
                    ),
                    sizedBox5,
                    TextFormfieldd(
                      'นามสกุล',
                      lastNameController,
                      lastNameController.text,
                    ),
                    sizedBox5,
                    TextFormfieldd(
                      'เบอร์โทรสัพท์',
                      numberPhoneController,
                      numberPhoneController.text,
                    ),
                    sizedBox5,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'ที่อยู่',
                          style: TextStyle(
                              fontSize: 22,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    sizedBox5,
                    TextFormfieldd(
                      'บ้านเลขที่',
                      numberHouseController,
                      numberHouseController.text,
                    ),
                    sizedBox5,
                    TextFormfieldd(
                      'หมู่บ้าน',
                      villageController,
                      villageController.text,
                    ),
                    sizedBox5,
                    TextFormfieldd(
                      'หมู่ที่',
                      villageNoController,
                      villageNoController.text,
                    ),
                    sizedBox5,
                    TextFormfieldd(
                      'ซอย',
                      laneController,
                      laneController.text,
                    ),
                    sizedBox5,
                    TextFormfieldd(
                      'ถนน',
                      roadController,
                      roadController.text,
                    ),
                    sizedBox5,
                    TextFormfieldd(
                      'ตำบล',
                      subDistrictController,
                      subDistrictController.text,
                    ),
                    sizedBox5,
                    TextFormfieldd(
                      'อำเภอ',
                      districtController,
                      districtController.text,
                    ),
                    sizedBox5,
                    TextFormfieldd(
                      'จังหวัด',
                      provincetController,
                      provincetController.text,
                    ),
                    sizedBox5,
                    TextFormfieldd(
                      'เลขไปรษณีย์',
                      postalCodeController,
                      postalCodeController.text,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
