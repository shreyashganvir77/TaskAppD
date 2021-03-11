import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:task/network.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// Future<http.Response> postRequest() async {
//   var url = 'my-notary-app.herokuapp.com';
//   var body = {
//     "notary": "60280100a063a42fb456c252",
//     "today12am": "2021-03-01 00:00:00 GMT+0530",
//     "order":"603768d4c54c430015c9bdb7"
//   };
//
//   var response = await http.post(Uri.https(url, '/getNotaryHomepage'),
//       body: body
//   );
//   print("${response.statusCode}");
//   print("${response.body}");
//   return response;
// }

class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.white,
      title: 'Order Details',
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: new IconButton(
              icon: new Icon(Icons.arrow_back_ios, color: Colors.black),
              onPressed: () => Navigator.of(context).pop(),
            ),
            backgroundColor: Colors.white,
            elevation: 0.0,
            title: Text(
              'Order Details',
              style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w500, color: Colors.black),
            ),
          ),
          body: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FlatButton(
                    onPressed: () {},
                    color: Colors.yellow[400],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Text(
                      'Decline',
                      style: GoogleFonts.roboto(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  FlatButton(
                    onPressed: () async {
                      var response = await postRequest();
                      int result = response.statusCode;
                      if(result == 200){
                        print('completed');
                      }else{
                        print('error');
                      }
                    },
                    color: Colors.blue[900],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Text(
                      'Accept',
                      style: GoogleFonts.roboto(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 28.0, right: 28.0),
                child: Container(
                  height: 1.0,
                  width: double.infinity,
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                alignment: Alignment.topLeft,
                height: 40.0,
                width: 300.0,
                child: DefaultTabController(
                  length: 4,
                  child: TabBar(
                    isScrollable: true,
                    labelColor: Colors.blue[800],
                    labelPadding: EdgeInsets.only(left:12.0, right: 12.0),
                    indicatorPadding: EdgeInsets.only(left:12.0, right: 12.0),
                    indicatorColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                    unselectedLabelStyle: GoogleFonts.roboto(
                      fontWeight: FontWeight.w400,
                      fontSize: 23.0,
                    ),
                    indicatorWeight: 2.0,
                    labelStyle: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w900,
                    ),
                    indicator: UnderlineTabIndicator(
                      borderSide: BorderSide(
                        color: Colors.blue[800],
                        width: 2.0,
                      ),
                    ),
                    tabs: [
                      Tab(
                        text: 'Details',

                      ),
                      Tab(
                        text: 'Chat',
                      ),
                      Tab(
                        text: 'Documents',
                      ),
                      Tab(
                        text: 'Signing Location',
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0),
                    child: Text(
                      "Order Status",
                      style: GoogleFonts.roboto(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w700,
                        color: Colors.blue[900],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 18.0),
                    child: FlatButton(
                      onPressed: (){},
                      color: Colors.blue[900],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Text(
                        'Change Status',
                        style: GoogleFonts.roboto(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.white
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Container(
                  height: 70.0,
                  width: MediaQuery.of(context).size.width,
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: [
                      TimeLineItems(name: 'Signer\nContacted', first: true,color: Colors.deepPurple,),
                      TimeLineItems(name: 'Documents\nDownloaded',color: Colors.deepPurple,),
                      TimeLineItems(name: 'Arrived to\nAppointment',),
                      TimeLineItems(name: 'Signing\nCompleted',),
                      TimeLineItems(name: 'Documents\nReceived', last: true,),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                height: 450.0,
                width: MediaQuery.of(context).size.width,
                child: ListView(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 28.0),
                          child: Text(
                            "Order Id :\n#72358",
                            style: GoogleFonts.roboto(
                              fontSize: 22.0,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 38.0),
                          child: Text(
                            "Amount\n₹ 150",
                            style: GoogleFonts.roboto(
                              fontSize: 22.0,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Card(
                      elevation: 3.0,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(Icons.location_on, color: Colors.red, size: 45.0,),
                            Text(
                              'Signing\nLocation',
                              style: GoogleFonts.roboto(
                                fontSize: 26.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Address',
                                  style: GoogleFonts.roboto(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey,
                                  ),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  '1101 Long Road Avenue\nBoulevyard Street, Las Vegas\nNevada',
                                  style: GoogleFonts.roboto(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey,
                                  ),
                                ),
                                SizedBox(
                                  height: 8.0,
                                ),
                                Text(
                                  'Time: Jan 12 4:45 PM',
                                  style: GoogleFonts.roboto(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      elevation: 3.0,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.event_note_outlined, size: 25.0,),
                                SizedBox(
                                  width: 15.0,
                                ),
                                Text(
                                  'Order Information',
                                  style: GoogleFonts.roboto(
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 8.0,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Closing Type',
                                  style: GoogleFonts.roboto(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey,
                                  ),
                                ),
                                Text(
                                  ': Refinance',
                                  style: GoogleFonts.roboto(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey[800],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 6.0,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Escrow for this file',
                                  style: GoogleFonts.roboto(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey,
                                  ),
                                ),
                                Text(
                                  ': lorem ipsum dolar',
                                  style: GoogleFonts.roboto(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey[800],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 6.0,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Order Type',
                                  style: GoogleFonts.roboto(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey,
                                  ),
                                ),
                                Text(
                                  ': Mobile(₹ 150)',
                                  style: GoogleFonts.roboto(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey[800],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 6.0,
                            ),
                            Text(
                              'Property Address',
                              style: GoogleFonts.roboto(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(
                              height: 4.0,
                            ),
                            Text(
                              '1101 Long Road Avenue\nBoulevyard Street, Las Vegas\nNevada',
                              style: GoogleFonts.roboto(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey[800],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      elevation: 3.0,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.person_sharp, size: 45.0,),
                                SizedBox(
                                  width: 15.0,
                                ),
                                Text(
                                  'Signer Details',
                                  style: GoogleFonts.roboto(
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 8.0,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Signer Name',
                                  style: GoogleFonts.roboto(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey,
                                  ),
                                ),
                                Text(
                                  ': Martin',
                                  style: GoogleFonts.roboto(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey[800],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 6.0,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Phone Number',
                                  style: GoogleFonts.roboto(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey,
                                  ),
                                ),
                                Text(
                                  ': +702.530.2495',
                                  style: GoogleFonts.roboto(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey[800],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 6.0,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Signer's Last Name",
                                  style: GoogleFonts.roboto(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey,
                                  ),
                                ),
                                Text(
                                  ': Lawrence',
                                  style: GoogleFonts.roboto(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey[800],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 6.0,
                            ),
                            Text(
                              'Address',
                              style: GoogleFonts.roboto(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(
                              height: 4.0,
                            ),
                            Text(
                              '1101 Long Road Avenue\nBoulevyard Street, Las Vegas\nNevada',
                              style: GoogleFonts.roboto(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey[800],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      elevation: 3.0,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.my_library_books_sharp, size: 35.0,),
                                SizedBox(
                                  width: 15.0,
                                ),
                                Text(
                                  'Closing Agent Information',
                                  style: GoogleFonts.roboto(
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 8.0,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Closing Agent',
                                  style: GoogleFonts.roboto(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey,
                                  ),
                                ),
                                Text(
                                  ': Wells Fargo Home',
                                  style: GoogleFonts.roboto(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey[800],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 6.0,
                            ),
                            Row(
                              children: [
                                Text(
                                  'CA First Name',
                                  style: GoogleFonts.roboto(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey,
                                  ),
                                ),
                                Text(
                                  ': Martin',
                                  style: GoogleFonts.roboto(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey[800],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 6.0,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Ca Phone Number",
                                  style: GoogleFonts.roboto(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey,
                                  ),
                                ),
                                Text(
                                  ': +702.530.2495',
                                  style: GoogleFonts.roboto(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey[800],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 6.0,
                            ),
                            Text(
                              'CA EMail',
                              style: GoogleFonts.roboto(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(
                              height: 4.0,
                            ),
                            Text(
                              'ashley@chase.com',
                              style: GoogleFonts.roboto(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey[800],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TimeLineItems extends StatelessWidget {
  final String name;
  final Color color;
  final bool first;
  final bool last;
  const TimeLineItems({
    Key key, this.name, this.color = Colors.grey, this.first = false, this.last = false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70.0,
      width: 90.0,
      child: TimelineTile(
        alignment: TimelineAlign.center,
        axis: TimelineAxis.horizontal,
        isFirst: first,
        isLast: last,
        indicatorStyle: IndicatorStyle(
          width: 1.0,
          color: color,
        ),
        afterLineStyle: LineStyle(
          color: color,
        ),
        beforeLineStyle: LineStyle(
          color: color,
        ),
        endChild: Text(
          name,
          style: GoogleFonts.roboto(
            fontSize: 10.0,
            color: color,
          ),
        ),
      ),
    );
  }
}
