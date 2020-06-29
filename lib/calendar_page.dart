import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalendarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () {},
              ),
              Text('2020年6月'),
              FlatButton(
                child: Text('人数'),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.arrow_forward_ios),
                onPressed: () {},
              ),
            ],
          ),
          Divider(),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('日'),
              Text('月'),
              Text('火'),
              Text('水'),
              Text('木'),
              Text('金'),
              Text('土'),
            ],
          ),
          Divider(),
          SizedBox(
            height: 300,
            child: GridView.count(
              crossAxisCount: 4,
              scrollDirection: Axis.horizontal,
              children: List.generate(
                31,
                (index) {
                  return Center(
                    child: Container(
                      height: 120,
                      child: Column(
                        children: [
                          Text('${index + 1}'),
                          Icon(Icons.accessibility),
                          Icon(Icons.person)
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
