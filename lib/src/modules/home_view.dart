import 'package:flutter/material.dart';
import 'package:the_masters/src/modules/order/new_order_view.dart';
import 'package:the_masters/src/widgets/order_chip.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    final searchColor = primaryColor.withOpacity(.15);

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: TextField(
            decoration: InputDecoration(
              filled: true,
              hintText: 'Search orders',
              fillColor: searchColor,
              contentPadding: EdgeInsets.zero,
              prefixIcon: const Icon(Icons.search),
              border: const OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
            ),
          ),
          bottom: const TabBar(
            splashFactory: InkSparkle.splashFactory,
            tabs: [
              Tab(
                child: Row(mainAxisSize: MainAxisSize.min, children: [
                  Icon(Icons.pending_actions_outlined),
                  SizedBox(width: 10),
                  Text('Working'),
                ]),
              ),
              Tab(
                child: Row(mainAxisSize: MainAxisSize.min, children: [
                  Icon(Icons.done),
                  SizedBox(width: 10),
                  Text('Ready'),
                ]),
              ),
              Tab(
                child: Row(mainAxisSize: MainAxisSize.min, children: [
                  Icon(Icons.done_all),
                  SizedBox(width: 10),
                  Text('Completed'),
                ]),
              ),
            ],
          ),
        ),
        body: ListView.builder(
          itemCount: 100,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('Icons.chevron_right'),
              leading: OrderChip(text: (1000 + index).toString()),
              subtitle: Text('+92-300-6309211'),
              trailing: Text('12-Jun-2023'),
              onTap: () {},
            );
          },
        ),
        floatingActionButton: FloatingActionButton.extended(
          icon: const Icon(Icons.add_rounded),
          label: const Text('New Order'),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => NewOrderView(),
                fullscreenDialog: true,
              ),
            );
          },
        ),
      ),
    );
  }
}
