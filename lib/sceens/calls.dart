import 'package:flutter/material.dart';
import '../model/callsModel.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Calls extends StatelessWidget {
  final String listType;

  Calls(this.listType);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(
          listType,
          style: TextStyle(color: const Color(0xFFFFFFFF)),
        ),
        leading: IconButton(icon: Icon(Icons.search), onPressed: () {}),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          )
        ],
      ),
      body: ListView.builder(
          itemCount: callMockData.length,
          itemBuilder: (context, position) => Padding(
                padding: EdgeInsets.all(0.0),
                child: Card(
                  elevation: 1.0,
                  color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        leading: CircleAvatar(
                          backgroundImage: CachedNetworkImageProvider(
                              callMockData[position].profileImageUrl),
                          backgroundColor: Colors.grey,
                        ),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              callMockData[position].name,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            Icon(
                              callMockData[position].callSource == 'video'
                                  ? Icons.videocam
                                  : Icons.call,
                              color: Color(0xFF2845E7),
                            )
                          ],
                        ),
                        subtitle: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Text(
                                  callMockData[position].day,
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      color: Colors.grey),
                                ),
                                Text(
                                  ' | ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey),
                                ),
                                Text(
                                  callMockData[position].time,
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      color: Colors.grey),
                                )
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text(
                                  callMockData[position].callType,
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      color: Colors.grey),
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )),
    );
  }
}
