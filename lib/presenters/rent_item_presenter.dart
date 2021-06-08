import 'dart:math';
import 'package:be_home/models/rent_item_model.dart';

var nearByRentItemData = [
  {
    "address": "34 Lê Văn Việt",
    "area": 20,
    "ward": "Quận 9",
    "price": "2.5",
    "distance": "1.9km",
    "imageCover":
        "https://res.cloudinary.com/thinhtpt/image/upload/v1622692614/hci-behome/nha-01_knghtv.jpg"
  },
  {
    "address": "Vinhome Nguyễn Xiển",
    "area": 68,
    "ward": "Quận 9",
    "price": "6.5",
    "distance": "3.8km",
    "imageCover":
        "https://res.cloudinary.com/thinhtpt/image/upload/v1622692616/hci-behome/nha-03_eaodxp.jpg"
  },
  {
    "address": "4A đường 12",
    "area": 24,
    "ward": "Quận 9",
    "price": "2.1",
    "distance": "950m",
    "imageCover":
        "https://res.cloudinary.com/thinhtpt/image/upload/v1622692617/hci-behome/nha-02_o01cva.png"
  },
  {
    "address": "Sky9 Phú Hữu",
    "area": 70,
    "ward": "Quận 9",
    "price": "7.5",
    "distance": "7.4km",
    "imageCover":
        "https://res.cloudinary.com/thinhtpt/image/upload/v1622692616/hci-behome/nha-05_xdpbvr.jpg"
  },
  {
    "address": "KTX quận 9",
    "area": 38,
    "ward": "Quận 9",
    "price": "1.2",
    "distance": "2.8km",
    "imageCover":
        "https://res.cloudinary.com/thinhtpt/image/upload/v1622692616/hci-behome/nha-04_nk7bjk.jpg"
  },
];

List<RentItemModel> getNearByRentItems() {
  List<RentItemModel> nearByRentItems = nearByRentItemData
      .map((item) => RentItemModel(
          address: item['address'],
          area: item['area'],
          ward: item['ward'],
          distance: item['distance'],
          price: item['price'],
          imageCover: item['imageCover']))
      .toList();
  return nearByRentItems;
}

var newRentItemData = [
  {
    "address": "4A đường 12",
    "area": 24,
    "ward": "Quận 9",
    "price": "2.1",
    "distance": "950m",
    "imageCover":
        "https://res.cloudinary.com/thinhtpt/image/upload/v1622692617/hci-behome/nha-02_o01cva.png"
  },
  {
    "address": "Sky9 Phú Hữu",
    "area": 70,
    "ward": "Quận 9",
    "price": "7.5",
    "distance": "7.4km",
    "imageCover":
        "https://res.cloudinary.com/thinhtpt/image/upload/v1622692616/hci-behome/nha-05_xdpbvr.jpg"
  },
  {
    "address": "34 Lê Văn Việt",
    "area": 20,
    "ward": "Quận 9",
    "price": "2.5",
    "distance": "1.9km",
    "imageCover":
        "https://res.cloudinary.com/thinhtpt/image/upload/v1622692614/hci-behome/nha-01_knghtv.jpg"
  },
  {
    "address": "Vinhome Nguyễn Xiển",
    "area": 68,
    "ward": "Quận 9",
    "price": "6.5",
    "distance": "3.8km",
    "imageCover":
        "https://res.cloudinary.com/thinhtpt/image/upload/v1622692616/hci-behome/nha-03_eaodxp.jpg"
  },
  {
    "address": "KTX quận 9",
    "area": 38,
    "ward": "Quận 9",
    "price": "1.2",
    "distance": "2.8km",
    "imageCover":
        "https://res.cloudinary.com/thinhtpt/image/upload/v1622692616/hci-behome/nha-04_nk7bjk.jpg"
  },
];

List<RentItemModel> getNewRentItems() {
  List<RentItemModel> nearByRentItems = newRentItemData
      .map((item) => RentItemModel(
          address: item['address'],
          area: item['area'],
          ward: item['ward'],
          distance: item['distance'],
          price: item['price'],
          imageCover: item['imageCover']))
      .toList();
  return nearByRentItems;
}

var sharingRentItemData = [
  {
    "address": "12/4A Nguyễn Văn Tăng",
    "area": 24,
    "ward": "Quận 9",
    "price": "2.1",
    "distance": "950m",
    "gender": "Nam",
    "imageCover":
        "https://res.cloudinary.com/thinhtpt/image/upload/v1622692615/hci-behome/ghep-04_wbqn9o.jpg"
  },
  {
    "address": "Sky9 Phú Hữu",
    "area": 70,
    "ward": "Quận 9",
    "price": "7.5",
    "distance": "7.4km",
    "gender": "Nam",
    "imageCover":
        "https://res.cloudinary.com/thinhtpt/image/upload/v1622692616/hci-behome/ghep-03_saiwfo.png"
  },
  {
    "address": "385/12 Lê Văn Việt",
    "area": 28,
    "ward": "Quận 9",
    "price": "5.5",
    "distance": "1.9km",
    "gender": "Nữ",
    "imageCover":
        "https://res.cloudinary.com/thinhtpt/image/upload/v1622692614/hci-behome/ghep-01_ihy61k.jpg"
  },
  {
    "address": "Vinhome Nguyễn Xiển",
    "area": 75,
    "ward": "Quận 9",
    "price": "7",
    "distance": "3.8km",
    "gender": "Nam",
    "imageCover":
        "https://res.cloudinary.com/thinhtpt/image/upload/v1622692615/hci-behome/ghep-02_v32c7r.jpg"
  },
  {
    "address": "672/31 Bưng Ông Thoàn",
    "area": 38,
    "ward": "Quận 9",
    "price": "1.4",
    "distance": "6.8km",
    "gender": "Nữ",
    "imageCover":
        "https://res.cloudinary.com/thinhtpt/image/upload/v1622692614/hci-behome/nha-01_knghtv.jpg"
  },
];

List<RentItemModel> getSharingRentItems() {
  List<RentItemModel> nearByRentItems = sharingRentItemData
      .map((item) => RentItemModel(
          address: item['address'],
          area: item['area'],
          ward: item['ward'],
          distance: item['distance'],
          price: item['price'],
          gender: item['gender'],
          imageCover: item['imageCover']))
      .toList();
  return nearByRentItems;
}

var otherRentItemData = [
  {
    "address": "4A đường 12",
    "area": 24,
    "ward": "Quận 9",
    "price": "2.1",
    "distance": "950m",
    "imageCover":
        "https://res.cloudinary.com/thinhtpt/image/upload/v1622692617/hci-behome/nha-02_o01cva.png"
  },
  {
    "address": "Sky9 Phú Hữu",
    "area": 70,
    "ward": "Quận 9",
    "price": "7.5",
    "distance": "7.4km",
    "imageCover":
        "https://res.cloudinary.com/thinhtpt/image/upload/v1622692616/hci-behome/nha-05_xdpbvr.jpg"
  },
  {
    "address": "34 Lê Văn Việt",
    "area": 20,
    "ward": "Quận 9",
    "price": "2.5",
    "distance": "1.9km",
    "imageCover":
        "https://res.cloudinary.com/thinhtpt/image/upload/v1622692614/hci-behome/nha-01_knghtv.jpg"
  },
  {
    "address": "Vinhome Nguyễn Xiển",
    "area": 68,
    "ward": "Quận 9",
    "price": "6.5",
    "distance": "3.8km",
    "imageCover":
        "https://res.cloudinary.com/thinhtpt/image/upload/v1622692616/hci-behome/nha-03_eaodxp.jpg"
  },
  {
    "address": "KTX quận 9",
    "area": 38,
    "ward": "Quận 9",
    "price": "1.2",
    "distance": "2.8km",
    "imageCover":
        "https://res.cloudinary.com/thinhtpt/image/upload/v1622692616/hci-behome/nha-05_xdpbvr.jpg"
  },
];

List<RentItemModel> getOtherRentItems() {
  List<RentItemModel> nearByRentItems = otherRentItemData
      .map((item) => RentItemModel(
          address: item['address'],
          area: item['area'],
          ward: item['ward'],
          distance: item['distance'],
          price: item['price'],
          imageCover: item['imageCover']))
      .toList();
  return nearByRentItems;
}

var totalItemData = [
  ...nearByRentItemData,
  ...newRentItemData,
  ...otherRentItemData,
  ...sharingRentItemData
];

var demoTags = [
  "wifi",
  "máy giặt",
  "máy lạnh",
  "giữ xe",
  "nội thất",
];

List<RentItemModel> getSearchResult() {
  var rng = new Random();
  List<RentItemModel> rentItems = totalItemData.map((item) {
    List<String> tags = new List();
    for (int i = 0; i < 3; i++) {
      int index = rng.nextInt(5);
      tags.add(demoTags[index]);
    }
    return RentItemModel(
        address: item['address'],
        area: item['area'],
        ward: item['ward'],
        distance: item['distance'],
        price: item['price'],
        gender: rng.nextInt(2) == 1 ? 'Nam' : 'Nữ',
        imageCover: item['imageCover'],
        tags: tags);
  }).toList();
  return rentItems;
}
