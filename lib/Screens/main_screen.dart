import 'package:flutter/material.dart';
import 'package:the_masters/Components/customer_card.dart';
import 'package:the_masters/Models/CustomerHandler.dart';
import 'package:the_masters/Models/customer.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool isVisible = false;
  bool isSearching = false;
  late var search;

  void addCustomer(String name, String phone) {
    setState(() {
      CustomerHandler.customers
          .add(Customer(name, phone, CustomerHandler.customers.length));
    });
  }

  List<Widget> getSearchedCustomerCard() {
    List<Widget> list = [];
    for (var c in CustomerHandler.customers) {
      var name = c.name.toLowerCase();
      if (name.contains(search) || c.primaryPhone.contains(search)) {
        list.add(Row(
          children: [
            Spacer(),
            CustomerCard(customer: c),
            Spacer(),
          ],
        ));
      }
    }
    return list;
  }

  List<Widget> getCustomerCard() {
    List<Widget> list = [];
    for (var c in CustomerHandler.customers) {
      list.add(Row(
        children: [
          Spacer(),
          CustomerCard(customer: c),
          Spacer(),
        ],
      ));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      isVisible = !isVisible;
                    });
                  },
                  child: Text('New Customer'),
                ),
                Visibility(
                  visible: isVisible,
                  child: NewCustomer(addCustomer),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text('New Order'),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 300,
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        search = value;
                      });
                      if (value == '')
                        isSearching = false;
                      else
                        isSearching = true;
                    },
                    decoration: InputDecoration(
                      hintText: 'Search',
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Expanded(
                  child: ListView(
                    children: [
                      GridView.count(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        childAspectRatio: 4,
                        crossAxisCount: 2,
                        children: isSearching
                            ? getSearchedCustomerCard()
                            : getCustomerCard(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class NewCustomer extends StatelessWidget {
  String name = '';
  String phone = '';
  Function onPressed;
  NewCustomer(this.onPressed, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            width: 300,
            child: TextField(
              onChanged: (value) {
                name = value;
              },
              decoration: InputDecoration(
                hintText: ('New Customer Name'),
              ),
            ),
          ),
          SizedBox(
            width: 300,
            child: TextField(
              onChanged: (value) {
                phone = value;
              },
              decoration: InputDecoration(
                hintText: ('Customer Number'),
              ),
            ),
          ),
          TextButton(
            onPressed: () => onPressed(name, phone),
            child: Text('Add'),
          ),
        ],
      ),
    );
  }
}
