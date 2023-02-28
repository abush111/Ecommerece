import 'package:flutter/material.dart';

class OrderNotification extends StatelessWidget {
  const OrderNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(220, 220, 220, 0.9),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(163),
                ),
                height: 100,
                margin: EdgeInsets.all(100),
                child: Icon(
                  Icons.done,
                  color: Colors.green,
                  size: 100,
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Text(" Order Completed !"),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(22.0),
                    bottomLeft: Radius.circular(22.0),
                    bottomRight: Radius.circular(22.0),
                    topRight: Radius.circular(50.0),
                  ),
                ),
                height: MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
