import 'package:flutter/material.dart';
import 'package:flutterapp/Home/model.dart';
import 'package:flutterapp/page/screeen/listView.dart';
import 'package:flutterapp/widget/listproduct.dart';
import 'package:provider/provider.dart';

class Searchscreen extends StatefulWidget {
  const Searchscreen({super.key});

  @override
  State<Searchscreen> createState() => _SearchscreenState();
}

class _SearchscreenState extends State<Searchscreen> {
  TextEditingController? _searchTextController;
  final FocusNode _node = FocusNode();
  void initState() {
    super.initState();
    _searchTextController = TextEditingController();
    _searchTextController?.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    _node.dispose();
    _searchTextController?.dispose();
  }

  List<ListProduct> _searchList = [];
  List<ListProduct> productC = [];
  @override
  Widget build(BuildContext context) {
    Productman carData = Provider.of<Productman>(context);
    carData.fetchlistProductData();

    productC = carData.listProductList;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        toolbarHeight: 70,
        elevation: 0,
        title: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: Colors.white,
              height: 45,
              margin: EdgeInsets.only(top: 0, right: 20),
              child: TextField(
                controller: _searchTextController,
                minLines: 1,
                focusNode: _node,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                  ),
                  hintText: 'Search',
                  filled: true,
                  fillColor: Theme.of(context).cardColor,
                  suffixIcon: IconButton(
                    onPressed: _searchTextController!.text.isEmpty
                        ? null
                        : () {
                            _searchTextController!.clear();
                            _node.unfocus();
                          },
                    icon: Icon(Icons.close,
                        color: _searchTextController!.text.isNotEmpty
                            ? Colors.red
                            : Colors.grey),
                  ),
                ),
                onChanged: (value) {
                  _searchTextController!.text.toLowerCase();
                  setState(() {
                    _searchList = carData.searchQuery(value);
                  });
                },
              ),
            ),
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child:
                  _searchTextController!.text.isNotEmpty && _searchList.isEmpty
                      ? Column(
                          children: [
                            SizedBox(
                              height: 50,
                            ),
                            Icon(
                              Icons.search,
                              size: 60,
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            Text(
                              'No results found',
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.w700),
                            ),
                          ],
                        )
                      : Container(
                          color: Colors.white,
                          height: MediaQuery.of(context).size.height - 20,
                          child: GridView(
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                              childAspectRatio: 3.7 / 4,
                              maxCrossAxisExtent: 250,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                            ),
                            children: List.generate(
                                _searchTextController!.text.isEmpty
                                    ? productC.length
                                    : _searchList.length, (index) {
                              return ChangeNotifierProvider.value(
                                value: _searchTextController!.text.isEmpty
                                    ? productC[index]
                                    : _searchList[index],
                                child: Feedlist(),
                              );
                            }),
                          ),
                        ),
            )
          ],
        ),
      ),
    );
  }
}
