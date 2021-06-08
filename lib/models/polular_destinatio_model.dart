class PopularDestinationModel {
  String name;
  String image;
  String city;

  PopularDestinationModel(this.name, this.image, this.city);
}

List<PopularDestinationModel> populars = popularsData
    .map((item) =>
        PopularDestinationModel(item['name'], item['image'], item['city']))
    .toList();

var popularsData = [
  {
    "name": "Binh Thanh",
    "city": "Ho Chi Minh",
    "image": "assets/images/binh-thanh.jpg"
  },
  {
    "name": "Quan 1",
    "city": "Ho Chi Minh",
    "image": "assets/images/quan-1.jpg"
  },
  {
    "name": "Quan 7",
    "city": "Ho Chi Minh",
    "image": "assets/images/quan-7.jpg"
  },
  {
    "name": "Thu Duc",
    "city": "Ho Chi Minh",
    "image": "assets/images/thu-duc.jpg"
  },
];
