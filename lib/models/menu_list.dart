

class MenuList {
  String title;
  String imageUrl;

  MenuList({required this.imageUrl,required this.title});
}


List<MenuList> listmenu = [
  
  MenuList(imageUrl: "assets/somtum.png", title: "อาหารอีสาน"),
  MenuList(imageUrl: "assets/padkraplao.png", title: "อาหารตามสั่ง"),
  MenuList(imageUrl: "assets/whan.png", title: "ขนมหวาน"),
  MenuList(imageUrl: "assets/kanom.png", title: "ขนมคบเคี้ยว"),
  MenuList(imageUrl: "assets/kk.png", title: "เครื่องดื่ม"),
  // MenuList(imageUrl: "assets/kk.png", title: "เครื่องดื่ม"),
  
];
