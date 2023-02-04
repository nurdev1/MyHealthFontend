import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:responsive_grid/responsive_grid.dart';



import '../AllFile/provider/HopitalProvider.dart';
import '../VarBlobale.dart';
import '../config/responsive.dart';
import '../medecin/MedecinProfil.dart';

import 'WidgetsAdmin/add_product_drawer.dart';
import 'WidgetsAdmin/elev_button.dart';
import 'WidgetsAdmin/product_container.dart';
import 'component/MenuAdmin.dart';

class Hopital extends StatefulWidget {
  const Hopital({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<Hopital> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<String> sortBy = ['Price Ascending', 'Price Descending', 'none'];
  SortTypes? sortType;
  String? sortValue;
  String? searchValue;
  int pagesNum = 0;
  int nextPage = 1;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      await Provider.of<HopitalProvider>(context, listen: false)
          .getHopital(0, null, null, GetTypes.PAGING);
      pagesNum =
          Provider.of<HopitalProvider>(context, listen: false).pagesNumber;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 0,
        backgroundColor:HexColor('#54DEFC') ,
        actions: [
          Padding(padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      Icons.notifications_outlined,
                      color: Colors.white,
                      size: 35,
                    ),
                    GestureDetector(
                      child: const CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage("assets/images/profil.jpg",),
                      ),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => MedecinProfil()
                        )
                        );
                      },
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
      endDrawer: const AddProductDrawer(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if(Responsive.isDesktop(context))
              Expanded(
                  flex:2,
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(67),
                      ),
                      child: Menu())
              ),
            Expanded(
              flex: 13,
              child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Products 💰',
                        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      ElevButton(
                        text: 'Add Product',
                        icon: Icons.add,
                        onPressed: () {
                          Provider.of<HopitalProvider>(context, listen: false)
                              .EditToHopital = null;
                          _scaffoldKey.currentState!.openEndDrawer();
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: 180,
                        child: TextField(
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 15),
                            hintText: 'search pa nom...',
                            border: InputBorder.none,
                            prefixIcon: Icon(Icons.search),
                          ),
                          onChanged: (input) {
                            searchValue = input;
                          },
                        ),
                      ),
                      const SizedBox(width: 10),
                      SizedBox(
                        width: 150,
                        child: DropdownButton(
                          hint: const Text("Sort By"),
                          value: sortValue,
                          items: sortBy.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (value) {
                            sortValue = value as String?;
                            if (value == sortBy[0]) {
                              sortType = SortTypes.ASC;
                            } else if (value == sortBy[1]) {
                              sortType = SortTypes.DESC;
                            } else {
                              sortType = null;
                            }
                            setState(() {});
                          },
                        ),
                      ),
                      const SizedBox(width: 10),
                      ElevButton(
                        text: "Filter",
                        icon: Icons.filter_list,
                        color: Colors.black,
                        onPressed: () async {
                          await Provider.of<HopitalProvider>(context, listen: false)
                              .getHopital(0, searchValue, sortType, GetTypes.FILTER);
                          pagesNum =
                              Provider.of<HopitalProvider>(context, listen: false)
                                  .pagesNumber;
                          nextPage = 1;
                          setState(() {});
                        },
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Expanded(
                  child: ResponsiveGridList(
                    desiredItemWidth: 200,
                    minSpacing: 20,
                    children: Provider.of<HopitalProvider>(context)
                        .hopitals
                        .map<Widget>((product) {
                      return GestureDetector(
                        onTap: () {
                          Provider.of<HopitalProvider>(context, listen: false)
                              .EditToHopital = product;
                          _scaffoldKey.currentState!.openEndDrawer();
                        },
                        child: ProductContainer(hopital: product),
                      );
                    }).toList()
                      ..add(
                        pagesNum > 1
                            ? Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(
                              height: 210,
                              child: ElevButton(
                                text: 'Charger plus',
                                icon: Icons.add,
                                color: Colors.grey,
                                onPressed: () {
                                  Provider.of<HopitalProvider>(context,
                                      listen: false)
                                      .getHopital(nextPage, searchValue,
                                      sortType, GetTypes.PAGING);
                                  pagesNum--;
                                  nextPage++;
                                },
                              ),
                            ),
                          ],
                        )
                            : const SizedBox(),
                      ),
                  ),
                ),
              ],
            ),)
          ],
        ),
      )
    );
  }
}
