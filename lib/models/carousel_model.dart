class CarouselModel {
  String image;

  CarouselModel(this.image);
}

List<CarouselModel> carousels =
    carouselsData.map((item) => CarouselModel(item['image'])).toList();

var carouselsData = [
  {"image": "assets/images/carousel_image_1.jpg"},
  {"image": "assets/images/carousel_image_2.jpg"},
  {"image": "assets/images/carousel_image_3.jpg"},
  {"image": "assets/images/carousel_image_4.jpg"},
];
