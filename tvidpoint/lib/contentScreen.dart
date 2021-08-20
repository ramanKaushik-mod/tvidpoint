import 'package:flutter/material.dart';
import 'package:tvidpoint/channelInfo.dart';
import 'package:tvidpoint/services.dart';
import 'package:tvidpoint/videoPlayerScreen.dart';
import 'package:tvidpoint/videosList.dart';

class ContentScreen extends StatefulWidget {
  final int i;
  ContentScreen(this.i);
  @override
  _ContentScreenState createState() => _ContentScreenState();
}

class _ContentScreenState extends State<ContentScreen> {
  late ChannelInfo _channelInfo;
  List<VideoItem> list = [];
  late Item _item;
  bool _loading = true;
  String _nextPageToken = '';
  ScrollController _scrollController = ScrollController();
  String getPlayID = '';
  String getChannelID = '';
  int noItmes = 0;
  @override
  void initState() {
    super.initState();
    setCPIDS();
    _loading = true;
    list = [];
    _getChannelInfo();
  }

  _getChannelInfo() async {
    _channelInfo = await Services(getChannelID).getChannelInfo();
    _item = _channelInfo.items[0];
    await _loadVideos();
    setState(() {
      _loading = false;
    });
  }

  _loadVideos() async {
    VideosList tempVideosList =
        await Services(getChannelID).getVideosList(getPlayID, _nextPageToken);
    _nextPageToken = tempVideosList.nextPageToken;
    list.addAll(tempVideosList.videos);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        body: _loading
            ? Container(
                color: Colors.grey[400],
                child: Center(child: CircularProgressIndicator(color: Colors.black,)))
            : Container(
                color: Colors.grey[400],
                child: Column(
                  children: [
                    _buildInfoView(),
                    Expanded(
                      child: NotificationListener<ScrollEndNotification>(
                        onNotification: (ScrollNotification notification) {
                          if (list.length >= noItmes) {
                            return true;
                          }
                          if (notification.metrics.pixels ==
                              notification.metrics.maxScrollExtent) {
                            _loadVideos();
                          }
                          return true;
                        },
                        child: ListView.builder(
                          controller: _scrollController,
                          itemCount: list.length,
                          itemBuilder: (context, index) {
                            VideoItem vedioItem = list[index];
                            return InkWell(
                              onTap: () async {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return VideoPlayerScreen(
                                    videoItem: vedioItem,
                                  );
                                }));
                              },
                              child: Column(
                                children: [
                                  Container(
                                    child: Row(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Image.network(
                                            vedioItem
                                                .video.thumbnails.medium.url,
                                            height: 80,
                                            width: 140,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Flexible(
                                            child: Text(
                                          vedioItem.video.title,
                                          style: TextStyle(
                                              color: Colors.grey[700],
                                              fontSize: 15,
                                              fontWeight: FontWeight.w800),
                                        )),
                                        SizedBox(
                                          width: 20,
                                        ),
                                      ],
                                    ),
                                    padding: EdgeInsets.all(10),
                                    color: Colors.black12,
                                  ),
                                  Divider(color: Colors.black),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                      color: Colors.black12,
                    )
                  ],
                ),
              ));
  }

  _buildInfoView() {
    return Container(
      child: Container(
        height: 160,
        margin: EdgeInsets.only(top: 20, bottom: 10),
        padding: EdgeInsets.all(10),
        color: Colors.grey[200],
        child: Row(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage:
                  NetworkImage(_item.snippet.thumbnails.medium.url),
            ),
            SizedBox(
              width: 40,
            ),
            Expanded(
              child: Text(
                _item.snippet.title,
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey[700],
                    fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              _item.statistics.videoCount,
              style: TextStyle(
                  fontSize: 16,
                    color: Colors.grey[700],
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 10,
            )
          ],
        ),
      ),
    );
  }

  setCPIDS() {
    switch (widget.i) {
      case 0:
        {
          getChannelID = 'UCeVMnSShP_Iviwkknt83cww';
          getPlayID = 'PLu0W_9lII9agS67Uits0UnJyrYiXhDS6q';
          noItmes = 44; //for Java
          break;
        }
      case 1:
        {
          getChannelID = 'UCOknqk-MSOCf3SANW8Wumfg';
          getPlayID = 'PLRKyZvuMYSIMW3-rSOGCkPlO1z_IYJy3G';
          noItmes = 41; //for kotlin
          break;
        }
      case 2:
        {
          getChannelID = 'UC8butISFwT-Wl7EV0hUK0BQ';
          getPlayID = 'PLWKjhJtqVAbkmRvnFmOd4KhDdlK1oIq23';
          noItmes = 11; //for python
          break;
        }
      case 3:
        {
          getChannelID = 'UCW5YeuERMmlnqo4oq8vwUpg';
          getPlayID = 'PL4cUxeGkcC9goXbgTDQ0n_4TBzOO0ocPR';
          noItmes = 12; //for Github
          break;
        }
      case 4:
        {
          getChannelID = 'UCW5YeuERMmlnqo4oq8vwUpg';
          getPlayID = 'PL4cUxeGkcC9haFPT7J25Q9GRB_ZkFrQAc';
          noItmes = 6; //for JavaScript
          break;
        }
      case 5:
        {
          getChannelID = 'UCiACNfj4GpXGwEypKQgKflw';
          getPlayID = 'PLknSwrodgQ72X4sKpzf5vT8kY80HKcUSe';
          noItmes = 126; //for Android
          break;
        }
      case 6:
        {
          getChannelID = 'UCeVMnSShP_Iviwkknt83cww';
          getPlayID = 'PLu0W_9lII9agpFUAlPFe_VNSlXW5uE0YL';
          noItmes = 74; //for C++
          break;
        }
      case 7:
        {
          getChannelID = 'UCeVMnSShP_Iviwkknt83cww';
          getPlayID = 'PLu0W_9lII9aiXlHcLx-mDH1Qul38wD3aR';
          noItmes = 76; //for C
          break;
        }
      case 8:
        {
          getChannelID = 'UCzyuZJ8zZ-Lhfnz41DG5qLw';
          getPlayID = 'PL0eyrZgxdwhwNC5ppZo_dYGVjerQY3xYU';
          noItmes = 42; //for HTML/CSS
          break;
        }
      case 9:
        {
          getChannelID = 'UCM-yUTYGmrNvKOCcAl21g3w';
          getPlayID = 'PLdo5W4Nhv31bbKJzrsKfMpo_grxuLl8LU';
          noItmes = 112; //for Data Structures
          break;
        }
      case 10:
        {
          getChannelID = 'UCeVMnSShP_Iviwkknt83cww';
          getPlayID = 'PLu0W_9lII9agK8pojo23OHiNz3Jm6VQCH';
          noItmes = 14; //for Data Science
          break;
        }
      case 11:
        {
          getChannelID = 'UC0cd_-e49hZpWLH3UIwoWRA';
          getPlayID = 'PLybg94GvOJ9FoGQeUMFZ4SWZsr30jlUYK';
          noItmes = 165; //for Maths
          break;
        }
    }
  }
}
