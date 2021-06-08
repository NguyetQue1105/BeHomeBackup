import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:be_home/constants/color_constant.dart';
import 'package:be_home/constants/style_constant.dart';
import 'package:be_home/models/carousel_model.dart';
import 'package:be_home/models/polular_destinatio_model.dart';
import 'package:be_home/widgets/bottom_navigation_motelinder.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key, key}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<StatefulWidget> {
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }
  double size1 = 150;
  double size2 = 150;
  double size3 = 150;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        // title: SvgPicture.asset('assets/svgs/motelinder_logo.svg'),
        title: Image.asset("assets/icons/logo.png"),
        centerTitle: true,
        elevation: 0.0,
      ),
      backgroundColor: backgroundColor,
      bottomNavigationBar: BottomNavigationMoteliner(selectIndex: 0),
      extendBody: true,
      body:
      Container(
        alignment: Alignment.centerLeft,
        width: MediaQuery.of(context).size.width,
        child: ListView(
          physics: ClampingScrollPhysics(),
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.all(15.0),
              child: Text(
                'NHÀ TRỌ AN KHANG',
                style: homeTitleStyle,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.all(30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedContainer(duration: const Duration(seconds: 1),
                  child: InkWell(
                      child: Expanded(
                        child: Image.asset(
                          'images/detail-1.jpg',
                          height: size1,
                        ),
                      ),onTap: (){},
                    onHover: (isHovering){
                        if(isHovering){
                          setState(() {
                            if(size1 == 150){
                              size1 = 300;
                              size2 = 100;
                              size3 = 100;
                            }
                          });
                        }else{
                          setState(() {
                            size1 =150;
                            size2 =150;
                            size3 =150;
                          });
                        }
                    },
                  ),
                  ),
                  AnimatedContainer(duration: const Duration(seconds: 1),
                  child: InkWell(
                      child: Expanded(
                        child: Image.asset(
                          'images/detail-2.jpg',
                          height: size2,
                        ),
                      ),onTap: (){},
                    onHover: (isHovering){
                        if(isHovering){
                          setState(() {
                            if(size2 == 150){
                              size2 = 300;
                              size1 = 100;
                              size3 = 100;
                            }
                          });
                        }else{
                          setState(() {
                            size2 =150;
                            size1 =150;
                            size3 =150;
                          });
                        }
                    },
                  ),
                  ),
                  AnimatedContainer(duration: const Duration(seconds: 1),
                  child: InkWell(
                      child: Expanded(
                        child: Image.asset(
                          'images/detail-3.jpg',
                          height: size3,
                        ),
                      ),onTap: (){},
                    onHover: (isHovering){
                        if(isHovering){
                          setState(() {
                            if(size3 == 150){
                              size3 = 300;
                              size2 = 100;
                              size1 = 100;
                            }
                          });
                        }else{
                          setState(() {
                            size3 =150;
                            size2 =150;
                            size1 =150;
                          });
                        }
                    },
                  ),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child:  Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 10.0, left: 90.0),
                    width: 600,
                    alignment: Alignment.center,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text("Motel's Details",
                              style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                          margin: EdgeInsets.only(bottom: 30),
                        ),
                        Row(
                          children: [
                            Container(
                              width: 120,
                              child: Text('Name' , style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, ), textAlign: TextAlign.left),
                              margin: EdgeInsets.only(right: 20, bottom: 10, top: 10),
                            ),
                            Container(
                              width: 460,
                              child: Text('An Khang' , style: TextStyle(fontSize: 20)),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              width: 120,

                              child: Text('Description' , style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), textAlign: TextAlign.left,),

                              margin: EdgeInsets.only(right: 20, bottom: 10, top: 10),
                            ),
                            Container(
                              width: 460,
                              child: Text('Beautiful Motel, what can make you feel comfortable when staying like your home!' , style: TextStyle(fontSize: 20)),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              width: 120,
                              child: Text('Price' , style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, ), textAlign: TextAlign.left),
                              margin: EdgeInsets.only(right: 20, bottom: 10, top: 10),
                            ),
                            Container(
                              width: 460,
                              child: Text('2.5M VNĐ / Month' , style: TextStyle(fontSize: 20)),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              width: 120,
                              child: Text('Area' , style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, ), textAlign: TextAlign.left),
                              margin: EdgeInsets.only(right: 20, bottom: 10, top: 10),
                            ),
                            Container(
                              width: 460,
                              child: Text('20m2' , style: TextStyle(fontSize: 20)),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              width: 120,
                              child: Text('Owner' , style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, ), textAlign: TextAlign.left),
                              margin: EdgeInsets.only(right: 20, bottom: 10, top: 10),
                            ),
                            Container(
                              width: 460,
                              child: Text('Mr. Lam Hau Huong' , style: TextStyle(fontSize: 20)),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              width: 120,
                              child: Text('Type' , style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, ), textAlign: TextAlign.left),
                              margin: EdgeInsets.only(right: 20, bottom: 10, top: 10),
                            ),
                            Container(
                              width: 460,
                              child: Text('Phòng trọ' , style: TextStyle(fontSize: 20)),
                            )
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Container(
                              width: 120,
                              child: Text('Rating' , style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, ), textAlign: TextAlign.left),
                              margin: EdgeInsets.only(right: 20, bottom: 10, top: 10),
                            ),
                            Container(
                              width: 460,
                              child: Row(
                                children: [
                                  Icon(Icons.star),
                                  Icon(Icons.star),
                                  Icon(Icons.star),
                                  Icon(Icons.star),
                                  Icon(Icons.star_border),
                                ],
                              )
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 30.0),
                    child: Column(
                      children: [
                        Container(
                          child: Text("Facility",
                              style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                          margin: EdgeInsets.only(bottom: 30),
                        ),
                        Row(
                          children: [
                            Container(
                              width: 120,
                              child: Icon(Icons.wifi),
                              margin: EdgeInsets.only(right: 20, bottom: 10, top: 10),
                            ),
                            Container(
                              width: 200,
                              child: Text('Wifi' , style: TextStyle(fontSize: 20)),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              width: 120,
                              child: Icon(Icons.local_parking),
                              margin: EdgeInsets.only(right: 20, bottom: 10, top: 10),
                            ),
                            Container(
                              width: 200,
                              child: Text('Garage' , style: TextStyle(fontSize: 20)),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              width: 120,
                              child: Icon(Icons.ac_unit),
                              margin: EdgeInsets.only(right: 20, bottom: 10, top: 10),
                            ),
                            Container(
                              width: 200,
                              child: Text('Air Conditioner' , style: TextStyle(fontSize: 20)),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              width: 120,
                              child: Icon(Icons.airline_seat_flat_rounded),
                              margin: EdgeInsets.only(right: 20, bottom: 10, top: 10),
                            ),
                            Container(
                              width: 200,
                              child: Text('Bed' , style: TextStyle(fontSize: 20)),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                                margin: EdgeInsets.only(bottom: 10, top: 50),
                              width: 200,
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  primary: appMainColor,
                                ),
                                onPressed: () {
                                  Navigator.pushReplacementNamed(context, '/search');
                                },
                                child: Text('Go Back', style: TextStyle(fontSize: 20)),
                              )
                            ),
                            Container(
                                margin: EdgeInsets.only(bottom: 10, top: 50),
                              width: 250,
                                child: TextButton(

                                  style: TextButton.styleFrom(
                                    primary: appMainColor,
                                  ),
                                  onPressed: () { },
                                  child: Text('Make An Appointment Now', style: TextStyle(fontSize: 20)),
                                )
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container( width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.all(30.0),
            child: Row
              (children: [
                Image(image: AssetImage('assets/images/logo.png'), height: 60,),
                Text('Location', style: TextStyle(color: appMainColor, fontSize: 20, fontWeight: FontWeight.bold),)],),),
            Container( width: 800,
              alignment: Alignment.center,
              margin: EdgeInsets.all(30.0),
              child: Row
                (children: [
                Image(image: AssetImage('assets/images/maps.png'), height: 500),
                ],),),
          ],
        ),
      ),
    );
  }
}
