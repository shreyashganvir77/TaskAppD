import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:task/network.dart';
import 'orderPage.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:task/apiData.dart';

List<Widget> appointmentList = [
  CustomCard(),
  CustomCard(),
];

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  HomePageData result;
  bool _loading = true;
  int _index = 0;
  @override
  void initState() {
    Network().postRequest().then((response) {
      setState(() {
        result = response;
        _loading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _loading == true
        ? LoadingScreen()
        : MaterialApp(
            color: Colors.white,
            home: Scaffold(
              resizeToAvoidBottomInset: true,
              bottomNavigationBar: Padding(
                padding: const EdgeInsets.only(
                    top: 10.0, right: 10.0, bottom: 2.0, left: 10.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(color: Colors.black26)),
                  child: GNav(
                    selectedIndex: _index,
                    rippleColor: Colors.grey[800],
                    hoverColor: Colors.grey[700],
                    haptic: true,
                    tabBorderRadius: 20,
                    curve: Curves.easeOutExpo,
                    duration: Duration(milliseconds: 900),
                    gap: 8,
                    color: Colors.black,
                    activeColor: Colors.blueAccent,
                    iconSize: 30,
                    tabBackgroundColor: Colors.blue[100],
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    tabs: [
                      GButton(
                        icon: Icons.home,
                        text: 'Home',
                        active: true,
                        onPressed: () {},
                      ),
                      GButton(
                        icon: Icons.event_note,
                        text: 'Notes',
                        active: true,
                        onPressed: () {},
                      ),
                      GButton(
                        icon: FontAwesomeIcons.commentDollar,
                        text: 'Currency',
                        onPressed: () {},
                      ),
                      GButton(
                        icon: Icons.perm_identity_rounded,
                        text: 'Profile',
                        onPressed: () {},
                      ),
                    ],
                    onTabChange: (index) {
                      setState(() {
                        _index = index;
                      });
                    },
                  ),
                ),
              ),
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Good Morning,',
                        style: GoogleFonts.roboto(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        'Jennifer',
                        style: GoogleFonts.roboto(
                          fontSize: 24.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Today's Appointment",
                            style: GoogleFonts.roboto(
                              fontSize: 15.0,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            "View All",
                            style: GoogleFonts.roboto(
                              fontSize: 15.0,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      SizedBox(
                        height: 165.0,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: result.appointments.length,
                          itemBuilder: (context, index) {
                            return CustomCard(
                              name: result.appointments[index].appointment
                                  .signerFullName,
                              time: result.appointments[index].appointment.date,
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "Pending Requests",
                        style: GoogleFonts.roboto(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: 3.0,
                      ),
                      Text(
                        "Accept the order as soon it comes. Orders are assigned on first acceptance basis",
                        style: GoogleFonts.roboto(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
                      ),
                      Expanded(
                        child: ListView(
                          shrinkWrap: true,
                          children: [
                            CustomCardAD(),
                            CustomCardAD(),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}

class CustomCardAD extends StatelessWidget {
  const CustomCardAD({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OrderPage(),
          ),
        );
      },
      child: Stack(
        children: [
          Container(
            height: 170.0,
            width: 380.0,
            child: Card(
                elevation: 3.0,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, top: 14.0),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0),
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/images/martin.webp'),
                              radius: 30.0,
                            ),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 230.0,
                                child: Text(
                                  'Refinance of Martin Lawrence of the jtha',
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.roboto(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Text(
                                'A short description of order\nwith some short text',
                                style: GoogleFonts.roboto(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 8.0, left: 8.0, right: 8.0),
                      child: Container(
                        height: 1.0,
                        width: double.infinity,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
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
                          onPressed: () {},
                          color: Colors.blue[900],
                          child: Text(
                            'Accept',
                            style: GoogleFonts.roboto(
                              fontSize: 15.0,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ],
                    )
                  ],
                )),
          ),
          Positioned(
              top: 40.0,
              right: 15.0,
              child: Text(
                "₹ 125",
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w800,
                  fontSize: 27.0,
                  color: Colors.black,
                ),
              )),
        ],
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final String name;
  final String time;

  const CustomCard({
    Key key,
    this.name,
    this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 170.0,
          width: 320.0,
          child: Card(
              elevation: 5.0,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 14.0),
                          child: CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/images/martin.webp'),
                            radius: 30.0,
                          ),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              (name == null) ? 'Martin Lawrence' : name,
                              style: GoogleFonts.roboto(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              (time == null)
                                  ? '10:30 AM'
                                  : time.substring(15, 21) +  (int.parse(time.substring(15, 17)) > 12 ? ' PM' : ' AM'),
                              style: GoogleFonts.roboto(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                    child: Container(
                      height: 1.0,
                      width: double.infinity,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 18.0, right: 18.0, bottom: 18.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Status',
                              style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w600,
                                fontSize: 15.0,
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              'Arrived at Appointment',
                              style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w600,
                                fontSize: 15.0,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          'Update\nStatus',
                          style: GoogleFonts.roboto(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w700,
                            color: Colors.blue[900],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        ),
        Positioned(
          top: 20.0,
          right: 24.0,
          child: Icon(
            Icons.location_on_outlined,
            size: 34.0,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            child: SpinKitRotatingCircle(
              color: Colors.blue,
              size: 50.0,
            ),
          ),
        ),
      ),
    );
  }
}
