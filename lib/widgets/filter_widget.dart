import 'package:be_home/widgets/filter_item_widget.dart';
import 'package:flutter/material.dart';

class FilterWidget extends StatelessWidget {
  const FilterWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var listFilterButtons = [
      GestureDetector(
          onTap: () {},
          child: FilterItemWidget(childItem: Icon(Icons.filter_list))),
      GestureDetector(
          onTap: () {},
          child: FilterItemWidget(
              childItem: Text('Giới tính', style: TextStyle(fontSize: 16.0)))),
      GestureDetector(
          onTap: () {},
          child: FilterItemWidget(
              childItem: Text('Loại', style: TextStyle(fontSize: 16.0)))),
      GestureDetector(
          onTap: () {},
          child: FilterItemWidget(
              childItem: Text('Giá', style: TextStyle(fontSize: 16.0)))),
    ];

    return Container(
      height: 45.0,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: listFilterButtons.length,
        itemBuilder: (BuildContext context, int index) {
          return listFilterButtons[index];
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            width: 5.0,
          );
        },
      ),
    );
  }
}
