import 'package:flutter/material.dart';
import 'package:specialite/screens/home_screen.dart';
import 'package:specialite/screens/tabs_screen.dart';
import 'package:specialite/widgets/pill_button.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:specialite/payment/screens/phome.dart';
import 'package:time_range/time_range.dart';

class Reserve extends StatefulWidget {
  @override
  _ReserveState createState() => _ReserveState();
}

class _ReserveState extends State<Reserve> {
  //CalendarController _controller;
  static const orange = Color(0xFFFE9A75);
  static const dark = Color(0xFF333A47);
  static const double leftPadding = 50;

  final _defaultTimeRange = TimeRangeResult(
    TimeOfDay(hour: 14, minute: 50),
    TimeOfDay(hour: 15, minute: 20),
  );
  TimeRangeResult _timeRange;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _timeRange = _defaultTimeRange;
    //_controller = CalendarController();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber[300],
          title: Text('Reservation Details'),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SfDateRangePicker(
                enablePastDates: false,
                selectionTextStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 12, 20, 12),
                child: Text('BOOKING TIME',
                    style: TextStyle(
                      fontSize: 16,
                      color: dark,
                      fontWeight: FontWeight.w600,
                    )),
              ),
              SizedBox(height: 5),
              TimeRange(
                fromTitle: Text(
                  'FROM',
                  style: TextStyle(
                    fontSize: 14,
                    color: dark,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                // toTitle: Text(
                //   'TO',
                //   style: TextStyle(
                //     fontSize: 14,
                //     color: dark,
                //     fontWeight: FontWeight.w600,
                //   ),
                // ),
                titlePadding: 10,
                activeTextStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                //borderColor: dark,
                activeBorderColor: Colors.amber[700],
                backgroundColor: Colors.transparent,
                activeBackgroundColor: Colors.amber[400],
                firstTime: TimeOfDay(hour: 8, minute: 00),
                lastTime: TimeOfDay(hour: 20, minute: 00),
                initialRange: _timeRange,
                timeStep: 30,
                timeBlock: 30,
                onRangeCompleted: (range) => setState(() => _timeRange = range),
              ),
              SizedBox(height: 20),
              if (_timeRange != null)
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, left: leftPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'BOOKING TIME: ${_timeRange.start.format(context)} - ${_timeRange.end.format(context)}',
                        style:
                            TextStyle(fontSize: 20, color: Colors.amber[800]),
                      ),
                    ],
                  ),
                ),
              Container(
                padding: EdgeInsets.all(30),
                child: PillButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(PaymentPage.routeName);
                  },
                  buttonText: "Next",
                  width: double.infinity,
                  color: Colors.amber,
                  textColor: Colors.white,
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
