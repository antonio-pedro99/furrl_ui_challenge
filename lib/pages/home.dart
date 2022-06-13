import 'package:flutter/material.dart';
import 'package:flutter_paginator/flutter_paginator.dart';
import 'package:furrl_ui_challenge/model/photo.dart';
import 'package:furrl_ui_challenge/response.dart';
import 'package:furrl_ui_challenge/services.dart';
import 'package:furrl_ui_challenge/widgets/photo_tile.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var photos = [];

  GlobalKey<PaginatorState> key = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Paginator.listView(
            pageLoadFuture: Services.getPhotos,
            pageItemsGetter: (ResponseHandler handler) {
              List<Photo> photos = [];
              for (var element in (handler.data as List<Photo>)) {
                photos.add(element);
              }
              return photos;
            },
            listItemBuilder: (value, index) {
              return PhotTile(photo: value);
            },
            loadingWidgetBuilder: () {
              return const Center(child: CircularProgressIndicator());
            },
            errorWidgetBuilder: (ResponseHandler handler, retry) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(handler.error as String),
                  TextButton(
                      onPressed: retry, child: const Icon(Icons.update_rounded))
                ],
              );
            },
            emptyListWidgetBuilder: (ResponseHandler handler) {
              return const Center(child: Text("Empty List"));
            },
            totalItemsGetter: (ResponseHandler handler) {
              return (handler.data as List).length;
            },
            pageErrorChecker: (ResponseHandler handler) {
              return handler.statusCode != 200;
            })

        /* FutureBuilder<ResponseHandler>(
          future: Services.getPhotos(),
          builder: ((context, snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text(snapshot.error as String));
            } else if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }
            var photos = snapshot.data!.data as List<Photo>;
            return ListView.builder(
                itemCount: photos.length,
                itemBuilder: (context, index) {
                  if (index < photos.length) {
                    return PhotTile(photo: photos[index]);
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                });
          })), */
        );
  }
}
