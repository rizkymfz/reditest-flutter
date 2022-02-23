import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:reditest_flutter/Quiz3/Models/order_model.dart';
import 'package:reditest_flutter/Quiz3/services/services.dart';
import 'DrawerScreen.dart';
import 'Models/Chart_model.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  // var order = new List<OrderModel>();
  // _getOrder() {
  //   APIService.orderData().then((response) {
  //     setState(() {
  //       Iterable list = jsonDecode(response);
  //       order = list.map((model) => OrderModel.fromJson(model)).toList();
  //     });
  //   });
  // }

  // initState() {
  //   super.initState();
  //   _getOrder();
  // }

  // dispose() {
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Order History"),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.search),
          )
        ],
      ),
      drawer: DrawerScreen(),
      body: ListView.separated(
          itemBuilder: (ctx, i) {
            return ListTile(
              leading: CircleAvatar(
                radius: 28,
                backgroundImage: NetworkImage(items[i].image),
              ),
              title: Text(
                items[i].order_no,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(items[i].date),
              trailing: Text(items[i].price),
            );
          },
          separatorBuilder: (ctx, i) {
            return Divider();
          },
          itemCount: items.length),
      // <!--  //? #Soal No 3 (15 poin) -- ChatScreen.dart --
      //? Buatlah ListView widget agar dapat menampilkan list title, subtitle dan trailling, dan styling agar dapat
      //tampil baik di device -->
      //Tuliskan coding disini//
      //
      //end coding
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.create, color: Colors.white),
        backgroundColor: Color(0xFF65a9e0),
        onPressed: () {},
      ),
    );
  }
}
