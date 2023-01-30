import 'package:flutter/material.dart';

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Ui());
  }
}

class Ui extends StatefulWidget {
  const Ui({Key? key}) : super(key: key);

  @override
  State<Ui> createState() => _UiState();
}

class _UiState extends State<Ui> {
  TextStyle styleText({double? size, FontWeight? fontweight, Color? color}) {
    return TextStyle(fontSize: size, fontWeight: fontweight, color: color);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            child: Column(
              children: [
                _buildProfileHeadBody(),
                _buildBodylistActivity(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildProfileHeadBody() {
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 15),
      child: Column(
        children: [
          Text(
            'กิจกรรม',
            style: styleText(
              size: 21,
              fontweight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey.shade300,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            'Pornlawan panwon',
            style: styleText(size: 18, fontweight: FontWeight.bold),
          ),
          SizedBox(
            height: 7,
          ),
          Text(
            'Pornlawan panwon',
            style: styleText(size: 16, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  _buildBodylistActivity() {
    bool open = true;

    var _isVisible = false;
    return Container(
      child: Column(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.redAccent.withOpacity(0.1),
            ),
            margin: EdgeInsets.only(
              top: 8,
              right: 15,
              left: 15,
              bottom: 10,
            ),
            padding: EdgeInsets.all(15),
            child: Row(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      color: Color(0xFFFE5AE0E),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '16',
                            style: styleText(
                              color: Colors.white,
                              size: 16,
                              fontweight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'ยอดสวดรวม',
                            style: styleText(
                              color: Colors.white,
                              size: 16,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      color: Color(0xFFFE5AE0E),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '16',
                            style: styleText(
                              color: Colors.white,
                              size: 16,
                              fontweight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'ยอดสวดรวม',
                            style: styleText(
                              color: Colors.white,
                              size: 16,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 8,
              right: 15,
              left: 15,
              bottom: 10,
            ),
            height: 100,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                        color: Colors.grey.shade300,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.add_location_alt_outlined,
                          size: 25,
                          color: Color(0xFFF821D1A),
                        ),
                        Text(
                          'รายการกิจกรรม',
                          style: styleText(
                              size: 14,
                              color: Color(0xFFF821D1A),
                              fontweight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                          color: Colors.grey.shade300,
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.add_location_alt_outlined,
                          size: 25,
                          color: Color(0xFFF821D1A),
                        ),
                        Text(
                          'รายละเอียดเพื่มเติม',
                          style: styleText(
                              size: 14,
                              color: Color(0xFFF821D1A),
                              fontweight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 68,
                  color: Color(0xFFFFCF7E7),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'รางวัลยอดสวด',
                        style: styleText(
                          size: 16,
                          fontweight: FontWeight.w700,
                          color: Color(0xFFFA32421),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                            color: Color(0xFFFA32421), shape: BoxShape.circle),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 68,
                  color: Color(0xFFFFCF7E7),
                  padding: EdgeInsets.only(top: 13),
                  child: Column(
                    children: [
                      Text(
                        'รางวัลเช็คอิน',
                        style: styleText(
                            color: Color(0xFFF5C4606),
                            size: 16,
                            fontweight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(
              top: 15,
              right: 15,
              left: 15,
              bottom: 10,
            ),
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'รางวัลล่าสุดที่ได้รับ',
                  style: styleText(
                    color: Colors.black,
                    size: 16,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      open = !open;
                      print('asd');
                    });
                  },
                  child: Container(
                    child: Icon(Icons.arrow_drop_down, size: 40),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Text(
                  'title',
                  style: styleText(
                    color: Colors.black,
                    size: 18,
                  ),
                ),
              ),
              ExpandIcon(
                onPressed: (open) {
                  setState(() {
                    open = !open;
                  });
                },
                color: Colors.black,
                expandedColor: Colors.black,
              )
            ],
          ),
          if (open)
            Padding(
              padding: EdgeInsets.all(15),
              child: Text('data'),
            ),
        ],
      ),
    );
  }
}
