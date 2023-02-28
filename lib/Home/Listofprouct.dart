import 'package:flutter/material.dart';
import 'package:flutterapp/Home/model.dart';
import 'package:flutterapp/route/route.dart';
// company category feed page

import 'package:provider/provider.dart';

class Listproducts extends StatefulWidget {
  final int index;
  const Listproducts({super.key, required this.index});

  @override
  State<Listproducts> createState() => _ListproductsState();
}

class _ListproductsState extends State<Listproducts> {
  List<Color> colors = [
    Color.fromRGBO(136, 159, 173, 1),
    Color.fromRGBO(136, 159, 173, 1),
    Color.fromRGBO(136, 159, 173, 1),
    Color.fromRGBO(136, 159, 173, 1),
  ];
  List<Map<String, Object>> categories = [
    {
      'title': 'Halogen Lamp',
      'categoryImagesPath': 'assets/images/image2.png',
    },
    {
      'title': 'Lamp',
      'categoryImagesPath': 'assets/images/image2.png',
    },
    {
      'title': 'Sylvania',
      'categoryImagesPath': 'assets/images/image2.png',
    },
    {
      'title': 'orange lamp',
      'categoryImagesPath': 'assets/images/image2.png',
    },
  ];
  static bool isPressed = true;
  Offset distance = isPressed ? Offset(10, 10) : Offset(28, 28);
  double blur = isPressed ? 5.0 : 30.0;
  void buttonState() {
    setState(() {
      isPressed = !isPressed;
      // Navigator.of(context).pushNamed(AppRoutes.market);
    });
  }

  @override
  Widget build(BuildContext context) {
    // Compony productsAttributes = Provider.of<Compony>(context);

    return Container(
      // color: Color.fromRGBO(220, 220, 220, 0.9),
      height: 150,
      decoration: BoxDecoration(
          color: colors[widget.index],
          borderRadius: BorderRadius.circular(18),
          boxShadow: isPressed
              ? [
                  BoxShadow(
                    color: Colors.grey.shade600,
                    offset: Offset(4, 4),
                    blurRadius: 15,
                    spreadRadius: 1,
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(-4, -4),
                    blurRadius: 25,
                    spreadRadius: 1,
                  ),
                ]
              : null),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(AppRoutes.Listpage,
                  arguments: '${categories[widget.index]['title']}');
            },
            child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: Center(
                child: Container(
                  // margin: EdgeInsets.all(15),
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(categories[widget.index]
                              ['categoryImagesPath']
                          .toString()),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(2),
            child: Text(
              categories[widget.index]['title'].toString(),
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 10,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//  feeed all list
// class Feedproducts extends StatefulWidget {
//   Feedproducts({super.key});

//   @override
//   State<Feedproducts> createState() => _FeedproductsState();
// }

// class _FeedproductsState extends State<Feedproducts> {
//   @override
//   Widget build(BuildContext context) {
//     Product productsAttributes = Provider.of<Product>(context);

//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: GestureDetector(
//         onTap: () {
//           Navigator.of(context).pushNamed(AppRoutes.Listpage);
//         },
//         child: Container(
//           width: 10,
//           height: MediaQuery.of(context).size.height,
//           decoration: BoxDecoration(
//             color: Colors.white,
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
//                           margin: EdgeInsets.all(25),
//                           width: double.infinity,
//                           constraints:
//                               BoxConstraints(minHeight: 50, maxHeight: 50),
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
//                 // margin: EdgeInsets.only(left: 5, bottom: 2, right: 3),
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
//                     // Padding(
//                     //   padding: const EdgeInsets.all(8.0),
//                     //   child: Row(
//                     //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     //     children: [
//                     //       Container(
//                     //           child: Text(
//                     //         "${productsAttributes.price} birr",
//                     //       )),
//                     //     ],
//                     //   ),)
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
