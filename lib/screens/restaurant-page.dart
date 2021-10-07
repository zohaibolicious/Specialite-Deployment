import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RestaurantPage extends StatefulWidget {
  static String routeName="/RestaurantPage";
  const RestaurantPage({Key key}) : super(key: key);

  @override
  _RestaurantPageState createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage> {

  String _setDate;
  //String _hour, _minute, _time;

  String dateTime;

  DateTime selectedDate = DateTime.now();

  TimeOfDay selectedTime = TimeOfDay(hour: 00, minute: 00);

  TextEditingController _dateController = TextEditingController();
  //TextEditingController _timeController = TextEditingController();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101));
    if (picked != null)
      setState(() {
        selectedDate = picked;
        _dateController.text = DateFormat.yMd().format(selectedDate);
      });
  }

  // Future<Null> _selectTime(BuildContext context) async {
  //   final TimeOfDay picked = await showTimePicker(
  //     context: context,
  //     initialTime: selectedTime,
  //   );
  //   if (picked != null)
  //     setState(() {
  //       selectedTime = picked;
  //       _hour = selectedTime.hour.toString();
  //       _minute = selectedTime.minute.toString();
  //       _time = _hour + ' : ' + _minute;
  //       _timeController.text = _time;
  //       _timeController.text = formatDate(
  //           DateTime(2019, 08, 1, selectedTime.hour, selectedTime.minute),
  //           [hh, ':', nn, " ", am]).toString();
  //     });
  // }

  @override
  void initState() {
    _dateController.text = DateFormat.yMd().format(DateTime.now());

    // _timeController.text = formatDate(
    //     DateTime(2019, 08, 1, DateTime.now().hour, DateTime.now().minute),
    //     [hh, ':', nn, " ", am]).toString();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    List <String> menuItems=[
      "Menu Item 1",
      "Menu Item 2",
      "Menu Item 3",
      "Menu Item 4",
      "Menu Item 5",
      "Menu Item 6",
      "Menu Item 7",
      "Menu Item 8",
    ];
    List <List<String>> priceTime=[
      ["07:00  :","¥1000"],
      ["08:00  :","¥2000"],
      ["09:00  :","¥1500"],
      ["10:00  :","¥3000"],
      ["11:00  :","¥1700"],
      ["12:00  :","¥1400"],
      ["13:00  :","¥1200"],
      ["14:00  :","¥1000"],
      ["15:00  :","¥2000"],
    ];
    List<String> selectedPriceTime;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 240,
            backgroundColor: Colors.transparent,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                "https://www.islamabadsnob.com/pancakes-best-breakfast-places-in-karachi.jpg",
                width: screenWidth,
              ),
            ),
            leading: Container(
              padding: EdgeInsets.all(0),
              height: screenWidth/6,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(screenWidth/12),
                color: Color(0xffbbbbbb),
              ),
              child: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.black,),
                  //onPressed: onPressed
              ),
            ),
            actions: <Widget>[
              Container(
                height: screenWidth/6,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(screenWidth/12),
                  color: Color(0xffbbbbbb),
                ),
                child: IconButton(
                  icon: Icon(Icons.search, color: Colors.black),
                  //onPressed: onPressed
                ),
              ),
              Container(
                height: screenWidth/6,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(screenWidth/12),
                  color: Color(0xffbbbbbb),
                ),
                child: IconButton(
                  icon: Icon(Icons.settings, color: Colors.black,),
                  //onPressed: onPressed
                ),
              ),
            ],
          ),
          SliverList(
              delegate: SliverChildListDelegate([
                Container(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Breakfast Hotel",
                        style: TextStyle(
                            fontSize: screenWidth/10,
                            fontWeight: FontWeight.bold,
                            color: Colors.black
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Masterpiece",
                            style: TextStyle(
                                fontSize: screenWidth/18,
                                fontWeight: FontWeight.normal,
                                color: Colors.black
                            ),
                          ),
                          Text(
                            "¥¥¥",
                            style: TextStyle(
                                fontSize: screenWidth/18,
                                fontWeight: FontWeight.normal,
                                color: Colors.black
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ),
                ListTile(
                  //dense: true,
                  leading: Icon(
                      Icons.favorite,
                      color: Color(0xffddbd69)
                  ),
                  title: Text(
                    "Excellent 9.5",
                    style: TextStyle(
                        fontSize: screenWidth/18,
                        fontWeight: FontWeight.normal,
                        color: Colors.black
                    ),
                  ),
                ),
                ListTile(
                  //dense: true,
                  leading: Icon(
                      Icons.access_time,
                      color: Colors.grey
                  ),
                  title: Text(
                    "Open ",
                    style: TextStyle(
                        fontSize: screenWidth/18,
                        fontWeight: FontWeight.normal,
                        color: Colors.black
                    ),
                  ),
                  trailing: InkWell(
                    child: Container(
                      width: screenWidth/3,
                      height: screenHeight/20,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color(0xfff3ebd4)
                      ),
                      child: Center(
                        child: Text(
                          "More Info",
                          style: TextStyle(
                            fontSize: screenWidth/18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xffddbd69),
                          ),
                        ),
                      ),
                    ),
                  )
                ),
                ListTile(
                  //dense: true,
                  leading: Icon(
                      Icons.group,
                      color: Colors.grey
                  ),
                  title: Text(
                    "Start Ordering",
                    style: TextStyle(
                        fontSize: screenWidth/18,
                        fontWeight: FontWeight.normal,
                        color: Colors.black
                    ),
                  ),
                  trailing: InkWell(
                    child: Container(
                      width: screenWidth/3,
                      height: screenHeight/20,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color(0xfff3ebd4)
                      ),
                      child: Center(
                        child: Text(
                          "Order Now",
                          style: TextStyle(
                            fontSize: screenWidth/18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xffddbd69),
                          ),
                        ),
                      ),
                    ),
                  )
                ),
                ListView.builder(
                  itemCount: menuItems.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index){
                    return ListTile(
                      leading: Icon(Icons.circle, color: Color(0xffddbd69),),
                      title: Text(
                        menuItems[index],
                        style: TextStyle(
                            fontSize: screenWidth/18,
                            fontWeight: FontWeight.normal,
                            color: Colors.black
                        ),
                      ),
                      onTap: () => showDialog(
                          context: context,
                          builder: (BuildContext context){
                            DateTime selectedDateTime= DateTime.now();
                            return StatefulBuilder(
                              builder: (context, setState){
                                return AlertDialog(
                                  title: Text(
                                    "Order Details",
                                    style: TextStyle(
                                      fontSize: screenWidth/18,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xffddbd69),
                                    ),
                                  ),
                                  content: Form(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Choose Date',
                                          style: TextStyle(
                                              fontStyle: FontStyle.italic,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 0.5),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            _selectDate(context);
                                          },
                                          child: Container(
                                            width: screenWidth / 2,
                                            height: screenHeight / 20,
                                            margin: EdgeInsets.only(top: 30),
                                            alignment: Alignment.topLeft,
                                            child: TextFormField(
                                              style: TextStyle(fontSize: 20),
                                              textAlign: TextAlign.start,
                                              enabled: false,
                                              keyboardType: TextInputType.text,
                                              controller: _dateController,
                                              onSaved: (String val) {
                                                _setDate = val;
                                              },
                                              decoration: InputDecoration(
                                                  disabledBorder:
                                                  UnderlineInputBorder(borderSide: BorderSide.none),
                                                  // labelText: 'Time',
                                                  contentPadding: EdgeInsets.only(top: 0.0)),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: screenWidth/1.3,
                                          height: screenHeight/2,
                                          child: ListView.builder(
                                              itemCount: priceTime.length,
                                              shrinkWrap: true,
                                              itemBuilder: (context, index){
                                                return ListTile(
                                                  leading: Text(
                                                    priceTime[index][0],
                                                    style: TextStyle(
                                                      fontSize: screenWidth/18,
                                                      fontWeight: FontWeight.bold,
                                                      color: Color(0xffddbd69),
                                                    ),
                                                  ),
                                                  title: Text(
                                                    priceTime[index][1],
                                                    style: TextStyle(
                                                      fontSize: screenWidth/18,
                                                      fontWeight: FontWeight.bold,
                                                      color: Color(0xffddbd69),
                                                    ),
                                                  ),
                                                  trailing: Radio<List<String>>(
                                                      value: priceTime[index],
                                                      groupValue: selectedPriceTime,
                                                      onChanged: (List<String> selected){
                                                        setState(() {
                                                          selectedPriceTime = selected;
                                                        });
                                                      }),
                                                );
                                              }
                                          ),
                                        ),
                                        RaisedButton(
                                          child: Text(
                                              "Submit"
                                          ),
                                          onPressed: () => Navigator.pop(context),
                                        )
                                      ],
                                      mainAxisSize: MainAxisSize.min,
                                    ),
                                  ),
                                );
                              }
                            );
                          }),
                    );
                  }
                )
              ])
          )
        ],
      )
    );
  }
}
