// import 'package:flutter/material.dart';
// import 'package:flutterapp/Home/model.dart';
// import 'package:flutterapp/provider/cartprovider.dart';
// import 'package:flutterapp/route/route.dart';

// import 'package:provider/provider.dart';

// class Categorylist extends StatelessWidget {
//  Categorylist({super.key});

//   @override
//   Widget build(BuildContext context) {
//     ListProduct productsAttributes = Provider.of<ListProduct>(context);
//     final cart = Provider.of<CartProvider>(context);
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: GestureDetector(
//         onTap: () {
//           Navigator.of(context)
//               .pushNamed(AppRoutes.deialPage, arguments: productsAttributes.id);
//         },
//         child: Container(
//           width: 250,
//           height: 290,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(6),
//           ),
//           child: Column(
//             children: [
//               Column(
//                 children: [
//                   Stack(
//                     children: [
//                       ClipRRect(
//                         borderRadius: BorderRadius.circular(2),
//                         child: Container(
//                           width: double.infinity,
//                           constraints: BoxConstraints(
//                               minHeight: 100,
//                               maxHeight:
//                                   MediaQuery.of(context).size.height * 0.3),
//                           child: Image.network(
//                             productsAttributes.image,
//                             //   fit: BoxFit.fitWidth,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//               Container(
//                 padding: EdgeInsets.only(left: 5),
//                 margin: EdgeInsets.only(left: 5, bottom: 2, right: 3),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     SizedBox(
//                       height: 4,
//                     ),
//                     Text(
//                       productsAttributes.title,
//                       overflow: TextOverflow.ellipsis,
//                       maxLines: 1,
//                       style: TextStyle(
//                           fontSize: 15,
//                           color: Colors.black,
//                           fontWeight: FontWeight.w600),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 8.0),
//                       child: Text(
//                         '\$ ${productsAttributes.price}',
//                         overflow: TextOverflow.ellipsis,
//                         maxLines: 2,
//                         style: TextStyle(
//                             fontSize: 18,
//                             color: Colors.black,
//                             fontWeight: FontWeight.w900),
//                       ),
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Container(
//                           child: ElevatedButton(
//                             onPressed: (() {
//                               cart.addItem(
//                                   productsAttributes.id,
//                                   productsAttributes.title,
//                                   productsAttributes.price,
//                                   productsAttributes.image);
//                             }),
//                             child: Row(
//                               children: [
//                                 Icon(Icons.add),
//                                 Text("Add to cart"),
//                               ],
//                             ),
//                           ),
//                         ),
//                         Material(
//                           color: Colors.transparent,
//                           child: InkWell(
//                               onTap: () {},
//                               borderRadius: BorderRadius.circular(18.0),
//                               child: Icon(
//                                 Icons.more_horiz,
//                                 color: Colors.grey,
//                               )),
//                         )
//                       ],
//                     ),
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
