import 'package:flutter/cupertino.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:specialite/data.dart';
import 'package:specialite/localization/lang_constants.dart';
import 'package:specialite/models/dish_object.dart';
import 'package:specialite/models/restaurant_object.dart';
import 'package:flutter/material.dart';
import 'package:specialite/modelss/Dish.dart';
import 'package:specialite/modelss/Rest.dart';
import 'package:specialite/pages/reserve_page.dart';
import 'package:specialite/screens/checkout.dart';
import 'package:specialite/widgets/back_button.dart';
import 'package:specialite/widgets/collapsable_restaurant_page_header.dart';
import 'package:specialite/widgets/menu_builder.dart';
import 'package:specialite/widgets/my_back_button.dart';
import '../constants.dart' as constants;

class RestaurantPage extends StatefulWidget {
  RestaurantPage(this.restoObject);

  final Rest restoObject;

  @override
  _RestaurantPageState createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage> {
  List<Dish> restDishes = [];
  int ind = 0;
  bool isToggled = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data.dishes.forEach((element) {
      if (element.rest == widget.restoObject.title) restDishes.add(element);
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    int total=0;
    if (data.newOrder.price==null){
      data.newOrder.price=new List<int>();
    }
    for(int index=0;index<data.newOrder.price.length;index++)
      total+=(data.newOrder.price[index]*data.newOrder.quantity[index]);
    return Scaffold(
      floatingActionButton: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30), color: Colors.red),
        child: IconButton(
          icon: Icon(Icons.arrow_forward),
          onPressed: () {
            data.newOrder.dateTime = DateTime.now();
            data.newOrder.restName = widget.restoObject.title;
            Navigator.pushNamed(context, Checkout.routeName);
          },
        ),
      ),
      body: SafeArea(
        child: CustomScrollView(
          shrinkWrap: true,
          slivers: [
            SliverAppBar(
              leading: BackButtonM(),
              backgroundColor: Colors.white,
              expandedHeight: 200.0,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                //title: Text("${_subCategory.currentSubCategoryName()}"),
                background: Container(
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width,
                  child: Image(
                    image: NetworkImage(
                      widget.restoObject.image,
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            // SliverPersistentHeader(
            //   pinned: true,
            //   floating: false,
            //   delegate: CollapsableRestaurantPageHeader(
            //       restoObject: widget.restoObject),
            // ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 15, 10, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.restoObject.title,
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.grey[200],
                          child: widget.restoObject.isFav
                              ? IconButton(
                                  splashRadius: 25,
                                  padding: EdgeInsets.all(0),
                                  icon: Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                    size: 30,
                                  ),
                                  onPressed: () {
                                    super.setState(
                                      () {
                                        widget.restoObject.isFav = false;
                                      },
                                    );
                                  },
                                )
                              : IconButton(
                                  splashRadius: 25,
                                  padding: EdgeInsets.all(0),
                                  icon: Icon(
                                    Icons.favorite_border,
                                    color: Colors.black,
                                    size: 30,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      widget.restoObject.isFav = true;
                                    });
                                  }),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: constants.PADDING_LTRB,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(widget.restoObject.subtitle),
                        Text(widget.restoObject.price)
                      ],
                    ),
                  ),
                  ListTile(
                    leading: Container(
                      child: widget.restoObject.rating >= 9
                          ? Text(' 😍')
                          : Text(' 😀'),
                    ),
                    title: Container(
                      child: widget.restoObject.rating >= 9
                          ? Text(getTranslated(context, "r_excellent") +
                              '   ${widget.restoObject.rating}')
                          : Text(getTranslated(context, "r_amazing") +
                              '   ${widget.restoObject.rating}'),
                    ),
                    // trailing: FlatButton(
                    //   shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(10)),
                    //   color: Color.fromARGB(50, 224, 177, 65),
                    //   textColor: Color.fromARGB(255, 224, 177, 65),
                    //   onPressed: () => {
                    //     Navigator.push(context,
                    //         MaterialPageRoute(builder: (context) => Reserve()))
                    //   },
                    //   child: Text(
                    //     'Reserve',
                    //     style: TextStyle(
                    //       fontWeight: FontWeight.bold,
                    //     ),
                    //   ),
                    // ),
                  ),
                  ListTile(
                    leading: Icon(Icons.access_time),
                    title: Text(getTranslated(context, "r_open")),
                    // trailing: FlatButton(
                    //   shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(10)),
                    //   color: Color.fromARGB(50, 224, 177, 65),
                    //   textColor: Color.fromARGB(255, 224, 177, 65),
                    //   onPressed: () => {
                    //     // Navigator.of(context).pushNamed(RestaurantPage0);
                    //   },
                    //   child: Text(
                    //     getTranslated(context, "r_moreInfo"),
                    //     style: TextStyle(
                    //       fontWeight: FontWeight.bold,
                    //     ),
                    //   ),
                    // ),
                  ),
                  /*ListTile(
                    leading: Icon(Icons.motorcycle),
                    title: Text(
                        'Delivery in ${widget.restoObject.baseEstimate} - ${widget.restoObject.baseEstimate + 10} min'),
                    subtitle: FutureBuilder(
                        future: constants.userLocation,
                        builder: (BuildContext context,
                            AsyncSnapshot<UserLocation> snapshot) {
                          if (snapshot.hasData) {
                            return Text(snapshot.data.address);
                          } else {
                            return Text('Loading...');
                          }
                        }),
                    trailing: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      color: Color.fromARGB(50, 224, 177, 65),
                      textColor: Color.fromARGB(255, 224, 177, 65),
                      onPressed: () => {},
                      child: Text(
                        'Change',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),*/
                  ListTile(
                    leading: Icon(Icons.group),
                    title: Text(getTranslated(context, "r_startOrdering")),
                    // trailing: FlatButton(
                    //   shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(10)),
                    //   color: Color.fromARGB(50, 224, 177, 65),
                    //   textColor: Color.fromARGB(255, 224, 177, 65),
                    //   onPressed: () => {},
                    //   child: Text(
                    //     getTranslated(context, "r_orderNow"),
                    //     style: TextStyle(
                    //       fontWeight: FontWeight.bold,
                    //     ),
                    //   ),
                    // ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 10, 0, 0),
                    child: Text(
                      getTranslated(context, "r_dishes"),
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                    child: Divider(
                      thickness: 1,
                    ),
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: restDishes.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                            restDishes[index].name,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          trailing: Image(
                              image: NetworkImage(restDishes[index].image)),
                          onTap: () {
                            ind = index;
                            showDialog(
                                context: context,
                                builder: (BuildContext dialogContext) {
                                  if (restDishes[ind].quantity==0){
                                    restDishes[ind].quantity=1;
                                  }
                                  return StatefulBuilder(
                                      builder: (context, setState) {
                                    return AlertDialog(
                                      title: Text(
                                        getTranslated(context, "r_selectTime"),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                      content: Form(
                                        child: Column(
                                          children: <Widget>[
                                            Container(
                                              width: screenWidth / 1.3,
                                              height: screenHeight / 3,
                                              child: ListView.builder(
                                                  itemCount: restDishes[ind]
                                                      .prices
                                                      .length,
                                                  shrinkWrap: true,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return ListTile(
                                                      leading: Text(
                                                        restDishes[ind]
                                                            .times[index],
                                                        style: TextStyle(
                                                          fontSize:
                                                              screenWidth / 18,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color:
                                                              Color(0xffddbd69),
                                                        ),
                                                      ),
                                                      title: Text(
                                                        "¥" +
                                                            restDishes[ind]
                                                                .prices[index]
                                                                .toString(),
                                                        style: TextStyle(
                                                          fontSize:
                                                              screenWidth / 18,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color:
                                                              Color(0xffddbd69),
                                                        ),
                                                      ),
                                                      trailing: Radio<int>(
                                                          value: restDishes[ind]
                                                              .prices[index],
                                                          groupValue:
                                                              restDishes[ind]
                                                                  .selectedIndex,
                                                          onChanged:
                                                              (int selected) {
                                                            setState(() {
                                                              restDishes[ind]
                                                                      .selectedIndex =
                                                                  selected;
                                                            });
                                                          }),
                                                    );
                                                  }),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  getTranslated(
                                                      context, "r_dineIn"),
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                FlutterSwitch(
                                                  height: 20.0,
                                                  width: 40.0,
                                                  padding: 4.0,
                                                  toggleSize: 15.0,
                                                  borderRadius: 10.0,
                                                  activeColor:
                                                      Color(0xffddbd69),
                                                  value: isToggled,
                                                  onToggle: (value) {
                                                    setState(() {
                                                      isToggled = value;
                                                    });
                                                  },
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Container(
                                              padding: EdgeInsets.zero,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15.0),
                                                color: Color(0xffaaaaaa),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  IconButton(
                                                    icon: Icon(
                                                        Icons.remove_rounded),
                                                    onPressed: () {
                                                      setState(() {
                                                        if (restDishes[ind].quantity > 0) {
                                                          restDishes[ind].quantity--;
                                                        }
                                                      });
                                                    },
                                                  ),
                                                  Text(restDishes[ind].quantity.toString()),
                                                  IconButton(
                                                    icon: Icon(Icons.add),
                                                    onPressed: () =>
                                                        setState(() {
                                                      restDishes[ind].quantity++;
                                                    }),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            RaisedButton(
                                                child: Text(getTranslated(
                                                    context, "r_submit")),
                                                onPressed: () {
                                                  if (data.newOrder.name ==
                                                      null) {
                                                    data.newOrder.name =
                                                        List<String>();
                                                    data.newOrder.price =
                                                        List<int>();
                                                    data.newOrder.quantity =
                                                        List<int>();
                                                  }
                                                  if (data.newOrder.name
                                                      .contains(restDishes[ind]
                                                          .name)) {
                                                    data.newOrder.price[data
                                                            .newOrder.name
                                                            .indexOf(
                                                                restDishes[ind]
                                                                    .name)] =
                                                        restDishes[ind]
                                                            .selectedIndex;
                                                    data.newOrder.quantity[data
                                                        .newOrder.name
                                                        .indexOf(restDishes[ind]
                                                            .name)] = restDishes[ind].quantity;
                                                  } else {
                                                    data.newOrder.name.add(
                                                        restDishes[ind].name);
                                                    data.newOrder.price.add(
                                                        restDishes[ind]
                                                            .selectedIndex);
                                                    data.newOrder.quantity
                                                        .add(restDishes[ind].quantity);
                                                  }

                                                  Navigator.pop(context);
                                                })
                                          ],
                                        ),
                                      ),
                                    );
                                  });
                                });
                          },
                        );
                      }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
