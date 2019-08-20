import 'package:flutter/material.dart';
import '../model/storiesModel.dart';
import '../model/chatModel.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Home extends StatelessWidget {
  final String listType;

  Home(this.listType);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(
          listType,
          style: TextStyle(color: Color(0xFFFFFFFF)),
        ),
        titleSpacing: -1.0,
        leading: IconButton(icon: Icon(Icons.search), onPressed: () {}),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 8.0),
          ),
          Container(
            height: 220.0,
            color: Colors.grey[200],
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: storiesMockData.length,
                itemBuilder: (context, position) => Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 5.0),
                          child: Container(
                            color: Colors.grey[200],
                            width: 100.0,
                            height: 210.0,
                            child: Stack(
                              alignment: Alignment.center,
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Container(
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: CachedNetworkImageProvider(
                                                  storiesMockData[position]
                                                      .storyImageUrl),
                                              fit: BoxFit.cover),
                                          borderRadius:
                                              BorderRadius.circular(20.0)),
                                      width: 100.0,
                                      height: 140.0,
                                      child: Padding(
                                        padding: EdgeInsets.fromLTRB(
                                            5.0, 85.0, 5.0, 5.0),
                                        child: Text(
                                          storiesMockData[position].name,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18.0,
                                              fontStyle: FontStyle.normal,
                                              color: Colors.white),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.fromLTRB(5.0, 65.0, 5.0, 0.0),
                                  child: PhysicalModel(
                                    borderRadius: BorderRadius.circular(25.0),
                                    color: Colors.transparent,
                                    child: Container(
                                      width: 50.0,
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: CachedNetworkImageProvider(
                                                  storiesMockData[position]
                                                      .profileImageUrl),
                                              fit: BoxFit.cover),
                                          borderRadius:
                                              BorderRadius.circular(25.0),
                                          border: Border.all(
                                              width: 3.0,
                                              color: storiesMockData[position]
                                                      .storySeen
                                                  ? Colors.grey
                                                  : const Color(0xFF2845E7))),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    )),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: chatMockData.length,
                itemBuilder: (context, position) {
                  return Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                    child: Card(
                      elevation: 1.0,
                      color: Color(0xFFFFFFFF),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: CachedNetworkImageProvider(
                              chatMockData[position].imageUrl),
                        ),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              chatMockData[position].name,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              chatMockData[position].time,
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 14.0),
                            )
                          ],
                        ),
                        subtitle: Container(
                          padding: EdgeInsets.only(top: 5.0),
                          child: Text(
                            chatMockData[position].message,
                            style:
                                TextStyle(color: Colors.grey, fontSize: 15.0),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
