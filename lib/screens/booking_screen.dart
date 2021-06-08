import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:be_home/constants/color_constant.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({Key key}) : super(key: key);

  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  DateTime selectedDate = DateTime.now();
  TextEditingController _controller = TextEditingController();

  Future<void> _selectDate(BuildContext context) async{
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015,8),
        lastDate: DateTime(2101));
    if(picked != null && picked != selectedDate){
      _controller.text = DateFormat.yMd().format(selectedDate);
    };
  }

  Widget _buildTextComposer() {
    return Container(
      margin: EdgeInsets.all(10),
      child: ListView(
        padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 10, bottom: 10),
            child: Row(
              children: [
                Flexible(
                    child: TextField(
                        decoration: new InputDecoration(
                            border: new OutlineInputBorder(
                              borderSide: new BorderSide(color: Colors.black),
                            ),
                            hintText: 'First Name'))),
                SizedBox(
                  width: 10,
                ),
                Flexible(
                  child: TextField(
                    decoration: new InputDecoration(
                      border: new OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.black),
                      ),
                      hintText: 'Last Name',
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 10),
            child: Row(
              children: [
                Flexible(
                  child: TextField(
                    decoration: new InputDecoration(
                      border: new OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.black),
                      ),
                      hintText: 'Contact Number',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 10),
            child: Row(
              children: [
                Flexible(
                  child: TextField(
                    decoration: new InputDecoration(
                      border: new OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.black),
                      ),
                      hintText: 'Email',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 10),
            child: Row(
              children: [
                Flexible(
                  child: TextField(
                    controller: _controller,
                    onTap: (){
                      _selectDate(context);
                    },
                    decoration: new InputDecoration(
                      border: new OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.black),
                      ),
                      hintText: 'Date of meeting',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 10),
            child: Row(
              children: [
                Flexible(
                  child: Material(
                    elevation: 100,
                    borderRadius: BorderRadius.circular(10),
                    color: appMainColor,
                    child: MaterialButton(
                      minWidth: MediaQuery.of(context).size.width,
                      height: 50,
                      onPressed: () {},
                      child: Text("Book",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: backgroundColor,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: Text(
          'Booking Form',
          style: TextStyle(color: appMainColor),
        ),
        centerTitle: true,
      ),
      body: _buildTextComposer(),
    );
  }
}
