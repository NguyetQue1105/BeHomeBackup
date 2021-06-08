class RentItemModel {
  int area;
  String ward;
  String address;
  String distance;
  String price;
  String gender;
  String imageCover;
  List<String> tags;

  RentItemModel(
      {this.address,
      this.area,
      this.ward,
      this.distance,
      this.gender,
      this.price,
      this.imageCover,
      this.tags});
}
