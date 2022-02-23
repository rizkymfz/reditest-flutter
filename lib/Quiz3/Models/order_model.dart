import 'dart:convert';

OrderModel orderModel(String str) => OrderModel.fromJson(jsonDecode(str));

class OrderModel {
  OrderModel({
    this.status,
    this.message,
    this.data,
  });
  int status;
  String message;
  List<Data> data;

  OrderModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = List.from(json['data']).map((e) => Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['data'] = data.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Data {
  Data({
    this.id,
    this.orderNo,
    this.date,
    this.price,
  });
  int id;
  String orderNo;
  String date;
  int price;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderNo = json['order_no'];
    date = json['date'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['order_no'] = orderNo;
    _data['date'] = date;
    _data['price'] = price;
    return _data;
  }
}
