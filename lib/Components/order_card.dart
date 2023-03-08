// import 'package:flutter/material.dart';
//
// class OrderCard extends StatelessWidget {
//   const OrderCard({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: Container(
//         padding: EdgeInsets.all(10),
//         color: Colors.green,
//         child: Column(
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text('Customer Number'),
//                 Text('Customer Name'),
//               ],
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Divider(
//               color: Colors.black,
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text('Completed'),
//                 Text('UnCompleted'),
//               ],
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Table(
//               border: TableBorder.all(),
//               children: <TableRow>[
//                 TableRow(
//                   children: [
//                     TableCell(
//                       verticalAlignment: TableCellVerticalAlignment.fill,
//                       child: Container(
//                         child: Text('5 Shalwar Qameez'),
//                       ),
//                     ),
//                     TableCell(
//                       child: Container(
//                         child: Text('1 Shalwar Qameez'),
//                       ),
//                     ),
//                   ],
//                 )
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
