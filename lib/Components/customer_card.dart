import 'package:flutter/material.dart';
import 'package:the_masters/Models/customer.dart';
import 'package:the_masters/Screens/customer_screen.dart';

class CustomerCard extends StatelessWidget {
  Customer customer;

  CustomerCard({Key? key, required this.customer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CustomerScreen(
              customer: customer,
            ),
          ),
        );
      },
      child: Container(
          width: 400,
          height: 100,
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('ID : ${customer.customerNo}'),
                  SizedBox(
                    height: 10,
                  ),
                  Text('${customer.primaryPhone}'),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${customer.name}'),
                  SizedBox(
                    height: 10,
                  ),
                  Text('${customer.orders.length}'),
                ],
              )
            ],
          )),
    );
  }
}
