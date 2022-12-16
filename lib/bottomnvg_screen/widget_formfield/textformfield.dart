import 'package:app_tutorial1/bottomnvg_screen/screen_account.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Textformfield extends StatefulWidget {
  @override
  State<Textformfield> createState() => _TextformfieldState();
}

class _TextformfieldState extends State<Textformfield> {
  var sizedBox5 = SizedBox(
    height: 10,
  );

  final formKey = GlobalKey<FormState>();
  final formKeytest = GlobalKey<FormState>();

  submit() {
    if (!formKey.currentState!.validate()) {
      formKey.currentState!.save();
    }
    if(!formKeytest.currentState!.validate()){

    }
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

  Row TextFormfieldd(String name, TextEditingController controller) {
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
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'กรุณาใส่ ลิงค์ Url';
                  }
                  return null;
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

  Row ImageTextFormfield() {
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
              validator: (value) {
                if (value!.isEmpty) {
                  return 'กรุณาใส่ ลิงค์ Url';
                }
                return null;
              },
              controller: imagesController,
              decoration: InputDecoration(hintText: 'ใส่ Url รูปภาพ'),
              onChanged: (value) {
                setState(
                  () {
                    value = imagesController.text;
                  },
                );
              },
              onSaved: (newValue) {},
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(top: 15),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
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
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ),
                  TextButton.icon(
                      onPressed: submit,
                      icon: Icon(
                        Icons.save,
                        color: Colors.black,
                      ),
                      label: Text(
                        'บันทึก',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ))
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
              ImageTextFormfield(),
              SizedBox(
                height: 10,
              ),
              Form(
                key: formKeytest,
                child: Column(
                  children: [
                    TextFormfieldd('ID ผู้ใช้งาน', idController),
                    sizedBox5,
                    TextFormfieldd('ชื่อเล่น', nickNameController),
                    sizedBox5,
                    TextFormfieldd('ชื่อจริง', firstNameController),
                    sizedBox5,
                    TextFormfieldd('นามสกุล', lastNameController),
                    sizedBox5,
                    TextFormfieldd('เบอร์โทรสัพท์', numberPhoneController),
                    sizedBox5,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'ที่อยู่',
                          style: TextStyle(
                              fontSize: 22,
                              color: Colors.red,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    sizedBox5,
                    TextFormfieldd('บ้านเลขที่', numberHouseController),
                    sizedBox5,
                    TextFormfieldd('หมู่บ้าน', villageController),
                    sizedBox5,
                    TextFormfieldd('หมู่ที่', villageNoController),
                    sizedBox5,
                    TextFormfieldd('ซอย', laneController),
                    sizedBox5,
                    TextFormfieldd('ถนน', roadController),
                    sizedBox5,
                    TextFormfieldd('ตำบล', subDistrictController),
                    sizedBox5,
                    TextFormfieldd('อำเภอ', districtController),
                    sizedBox5,
                    TextFormfieldd('จังหวัด', provincetController),
                    sizedBox5,
                    TextFormfieldd('เลขไปรษณีย์', postalCodeController),
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
