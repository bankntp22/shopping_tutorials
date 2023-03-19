import 'dart:io';

import 'package:app_tutorial1/models/constant.dart';
import 'package:app_tutorial1/models/model_profile.dart';
import 'package:app_tutorial1/provider/provider_profile.dart';
import 'package:app_tutorial1/screen_new_all/screen_create_menushop.dart';
import 'package:app_tutorial1/style/font.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProviderProfile(context),
      child: Profile(),
    );
  }
}

class Profile extends StatelessWidget {
  late ProviderProfile ctxWatch;
  late Constant constant = Constant();

  String sInk = '';

  @override
  Widget build(BuildContext context) {
    ctxWatch = context.watch<ProviderProfile>();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey.shade700.withOpacity(0.6),
          elevation: 0,
          title: Text(
            'กรอกข้อมูล',
            style: StyleFont.fontGoogleMali,
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            color: Colors.white54,
            child: Column(
              children: [
                _buildInputForm(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildInputForm(BuildContext ctx) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Container(
        margin: EdgeInsets.only(top: 5, right: 10, left: 10, bottom: 5),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text('ข้อมูลส่วนตัว',
                      // style: Theme.of(context).textTheme.headline5,
                      // style: TextStyle(
                      //     fontSize: 25,
                      //     fontWeight: FontWeight.bold,
                      //     color: Colors.black45),
                      style: GoogleFonts.mali(
                          fontSize: 23, color: Colors.grey.shade600)),
                ),
                ElevatedButton.icon(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Colors.greenAccent.shade700,
                    ),
                  ),
                  onPressed: () => ctxWatch.submit(),
                  icon: Icon(Icons.save, color: Colors.white),
                  label: Text(
                    'บันทึก',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                )
              ],
            ),
            SizedBox(
              width: 190,
              height: 30,
              child: Divider(
                color: Colors.grey.shade300,
                thickness: 2,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => ctxWatch.pickImage(ImageSource.gallery),
                  child: Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Container(
                          width: 140,
                          height: 140,
                          color: Colors.grey.shade200,
                          child: ctxWatch.imageBytes == null
                              ? Image.asset(
                                  'assets/placeholder-image.png',
                                  fit: BoxFit.cover,
                                )
                              : Container(
                                  width: 140,
                                  height: 140,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                                    child: Image.memory(
                                      ctxWatch.imageBytes!,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                        ),
                      ),
                      Icon(
                        Icons.image,
                        size: 28,
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            // ImageTextFormfield(ctxWatch.idController.text),
            SizedBox(
              height: 10,
            ),
            Form(
              key: ctxWatch.formKeytest,
              child: Column(
                children: [
                  TextFormfieldd(
                    'ID ผู้ใช้งาน',
                    ctxWatch.idController,
                    ctxWatch.idController.text,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormfieldd(
                    'ชื่อเล่น',
                    ctxWatch.nickNameController,
                    ctxWatch.nickNameController.text,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormfieldd(
                    'ชื่อจริง',
                    ctxWatch.firstNameController,
                    ctxWatch.firstNameController.text,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormfieldd(
                    'นามสกุล',
                    ctxWatch.lastNameController,
                    ctxWatch.lastNameController.text,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormfieldd(
                    'เบอร์โทรสัพท์',
                    ctxWatch.numberPhoneController,
                    ctxWatch.numberPhoneController.text,
                  ),
                  SizedBox(
                    height: 5,
                  ),
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
                  SizedBox(
                    height: 5,
                  ),
                  TextFormfieldd(
                    'บ้านเลขที่',
                    ctxWatch.numberHouseController,
                    ctxWatch.numberHouseController.text,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormfieldd(
                    'หมู่บ้าน',
                    ctxWatch.villageController,
                    ctxWatch.villageController.text,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormfieldd(
                    'หมู่ที่',
                    ctxWatch.villageNoController,
                    ctxWatch.villageNoController.text,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormfieldd(
                    'ซอย',
                    ctxWatch.laneController,
                    ctxWatch.laneController.text,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormfieldd(
                    'ถนน',
                    ctxWatch.roadController,
                    ctxWatch.roadController.text,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormfieldd(
                    'ตำบล',
                    ctxWatch.subDistrictController,
                    ctxWatch.subDistrictController.text,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormfieldd(
                    'อำเภอ',
                    ctxWatch.districtController,
                    ctxWatch.districtController.text,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormfieldd(
                    'จังหวัด',
                    ctxWatch.provincetController,
                    ctxWatch.provincetController.text,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormfieldd(
                    'เลขไปรษณีย์',
                    ctxWatch.postalCodeController,
                    ctxWatch.postalCodeController.text,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(ctx, MaterialPageRoute(
                        builder: (context) {
                          return ScreenCreateMenushop();
                        },
                      ));
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 10),
                      height: 50,
                      width: double.infinity,
                      color: Colors.deepOrange.shade300.withOpacity(0.9),
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 30,
                          ),
                          Text(
                            'สร้างร้านค้า',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row ImageTextFormfield(String sGetProfile) {
    return Row(
      children: [
        Expanded(
          child: Text('รูปภาพ', style: StyleFont.fontGoogleMali1),
        ),
        Expanded(
          flex: 2,
          child: Form(
            key: ctxWatch.formKey,
            child: TextFormField(
              // validator: (value) {
              //   if (value!.isEmpty) {
              //     return 'กรุณาใส่ ลิงค์ Url';
              //   }
              //   return null;
              // },
              controller: ctxWatch.imagesController,
              decoration: InputDecoration(hintText: 'ใส่ Url รูปภาพ'),
              onChanged: (value) {},
              // onSaved: (newValue) {
              //   sGetProfile = newValue.toString();
              // },
            ),
          ),
        ),
      ],
    );
  }
}

Row TextFormfieldd(
    String name, TextEditingController controller, String modelProfile) {
  return Row(
    children: [
      Expanded(
        child: Text(
          name,
          style: StyleFont.fontGoogleMaliUnBold,
          // style: TextStyle(fontSize: 17, color: Colors.black87),
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
