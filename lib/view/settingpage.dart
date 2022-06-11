import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class SettingPage extends StatefulWidget{

  @override
  _SettingPageState createState() => _SettingPageState();

}

class _SettingPageState extends State<SettingPage>{

  bool orderStatus = false;
  bool shippingStatus = false;
  bool promotionStatus = false;
  bool offerStatus = false;
  bool newsStatus = false;
  bool messageStatus = false;
  bool newArrivalStatus = false;
  bool pushStatus = false;
  bool nightStatus = false;
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context, true),
                    child: Container(
                      margin: const EdgeInsets.only(top: 0),
                      height: 32,
                      width: 32,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.white54,
                              blurRadius: 4.0,
                              offset: Offset(0.0, 1.0),
                            )
                          ]),
                      child: const Icon(
                        Icons.arrow_back,
                        size: 30.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Text(
                    "Notification Settings",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _expanded = !_expanded;
                    orderStatus=_expanded;
                    shippingStatus=_expanded;
                    promotionStatus=_expanded;
                    offerStatus=_expanded;
                    newsStatus=_expanded;
                    messageStatus=_expanded;
                    newArrivalStatus=_expanded;
                  });
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Email Notification",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 16),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: _expanded? Container(
                        decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              const BoxShadow(color: Colors.black12,offset: Offset(4,4),blurRadius: 2,spreadRadius: 0.4),
                              BoxShadow(color:  Colors.white70,offset: Offset(-4,-4),blurRadius: 2,spreadRadius: 0.4),
                            ]
                        ),
                        child: FlutterSwitch(
                          height: 30,
                          width: 70,
                          showOnOff: true,
                          borderRadius: 8,
                          activeTextColor: Colors.red,
                          inactiveTextColor:Colors.black,
                          inactiveColor: Colors.grey.shade300,
                          activeColor: Colors.grey.shade300,
                          value: _expanded,
                          onToggle: (val) {
                            setState(() {
                              _expanded = val;
                              orderStatus=val;
                              shippingStatus=val;
                              promotionStatus=val;
                              offerStatus=val;
                              newsStatus=val;
                              messageStatus=val;
                              newArrivalStatus=val;
                            });
                          },
                        ),
                      ): Container(
                          decoration: BoxDecoration(
                              color:Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow:const [
                                BoxShadow(color: Colors.black26,offset: Offset(4,4),blurRadius: 4,spreadRadius: 0.4),
                                BoxShadow(color: Colors.white60,offset: Offset(-4,-4),blurRadius: 4,spreadRadius: 0.4),
                              ]),
                        child: FlutterSwitch(
                          height: 30,
                          width: 70,
                          showOnOff: true,
                          borderRadius: 8,
                          activeTextColor: Colors.red,
                          inactiveTextColor:Colors.black,
                          inactiveColor: Colors.grey.shade300,
                          activeColor: Colors.grey.shade300,
                          value: _expanded,
                          onToggle: (val) {
                            setState(() {
                              _expanded = val;
                              orderStatus=val;
                              shippingStatus=val;
                              promotionStatus=val;
                              offerStatus=val;
                              newsStatus=val;
                              messageStatus=val;
                              newArrivalStatus=val;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            _expanded?Visibility(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:  [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(
                                width: 20,
                              ),
                              const Text(
                                "Order Updates",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18),
                              ),
                            ],
                          ),
                          Container(
                            alignment: Alignment.bottomCenter,
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  const BoxShadow(color: Colors.black12,offset: Offset(4,4),blurRadius: 2,spreadRadius: 0.4),
                                  BoxShadow(color:  Colors.white70,offset: Offset(-4,-4),blurRadius: 2,spreadRadius: 0.4),
                                ]
                            ),
                            child: FlutterSwitch(
                              height: 30,
                              width: 70,
                              showOnOff: true,
                              borderRadius: 8,
                              activeTextColor:Colors.red,
                              inactiveTextColor:Colors.black,
                              inactiveColor: Colors.grey.shade300,
                              activeColor: Colors.grey.shade300,
                              value: orderStatus,
                              onToggle: (val) {
                                setState(() {
                                  orderStatus = val;
                                });
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:  [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(
                                width: 20,
                              ),
                              const Text(
                                "Shipping Updates",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18),
                              ),
                            ],
                          ),
                          Container(
                            alignment: Alignment.bottomCenter,
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  const BoxShadow(color: Colors.black12,offset: Offset(4,4),blurRadius: 2,spreadRadius: 0.4),
                                  BoxShadow(color:  Colors.white70,offset: Offset(-4,-4),blurRadius: 2,spreadRadius: 0.4),
                                ]
                            ),
                            child: FlutterSwitch(
                              height: 30,
                              width: 70,
                              showOnOff: true,
                              borderRadius: 8,
                              activeTextColor:Colors.red,
                              inactiveTextColor:Colors.black,
                              inactiveColor: Colors.grey.shade300,
                              activeColor: Colors.grey.shade300,
                              value: shippingStatus,
                              onToggle: (val) {
                                setState(() {
                                  shippingStatus = val;
                                });
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:  [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(
                                width: 20,
                              ),
                              const Text(
                                "Promotions",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18),
                              ),
                            ],
                          ),
                          Container(
                            alignment: Alignment.bottomCenter,
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  const BoxShadow(color: Colors.black12,offset: Offset(4,4),blurRadius: 2,spreadRadius: 0.4),
                                  BoxShadow(color:  Colors.white70,offset: Offset(-4,-4),blurRadius: 2,spreadRadius: 0.4),
                                ]
                            ),
                            child: FlutterSwitch(
                              height: 30,
                              width: 70,
                              showOnOff: true,
                              borderRadius: 8,
                              activeTextColor: Colors.red,
                              inactiveTextColor:Colors.black,
                              inactiveColor: Colors.grey.shade300,
                              activeColor: Colors.grey.shade300,
                              value: promotionStatus,
                              onToggle: (val) {
                                setState(() {
                                  promotionStatus = val;
                                });
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:  [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(
                                width: 20,
                              ),
                              const Text(
                                "Offers",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18),
                              ),
                            ],
                          ),
                          Container(
                            alignment: Alignment.bottomCenter,
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  const BoxShadow(color: Colors.black12,offset: Offset(4,4),blurRadius: 2,spreadRadius: 0.4),
                                  BoxShadow(color:  Colors.white70,offset: Offset(-4,-4),blurRadius: 2,spreadRadius: 0.4),
                                ]
                            ),
                            child: FlutterSwitch(
                              height: 30,
                              width: 70,
                              showOnOff: true,
                              borderRadius: 8,
                              activeTextColor: Colors.red,
                              inactiveTextColor:Colors.black,
                              inactiveColor: Colors.grey.shade300,
                              activeColor: Colors.grey.shade300,
                              value: offerStatus,
                              onToggle: (val) {
                                setState(() {
                                  offerStatus = val;
                                });
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:  [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(
                                width: 20,
                              ),
                              const Text(
                                "News",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18),
                              ),
                            ],
                          ),

                          Container(
                            alignment: Alignment.bottomCenter,
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  const BoxShadow(color: Colors.black12,offset: Offset(4,4),blurRadius: 2,spreadRadius: 0.4),
                                  BoxShadow(color:  Colors.white70,offset: Offset(-4,-4),blurRadius: 2,spreadRadius: 0.4),
                                ]
                            ),
                            child: FlutterSwitch(
                              height: 30,
                              width: 70,
                              showOnOff: true,
                              borderRadius: 8,
                              activeTextColor: Colors.red,
                              inactiveTextColor:Colors.black,
                              inactiveColor: Colors.grey.shade300,
                              activeColor: Colors.grey.shade300,
                              value: newsStatus,
                              onToggle: (val) {
                                setState(() {
                                  newsStatus = val;
                                });
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:  [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(
                                width: 20,
                              ),
                              const Text(
                                "Messages",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18),
                              ),
                            ],
                          ),

                          Container(
                            alignment: Alignment.bottomCenter,
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  const BoxShadow(color: Colors.black12,offset: Offset(4,4),blurRadius: 2,spreadRadius: 0.4),
                                  BoxShadow(color:  Colors.white70,offset: Offset(-4,-4),blurRadius: 2,spreadRadius: 0.4),
                                ]
                            ),
                            child: FlutterSwitch(
                              height: 30,
                              width: 70,
                              showOnOff: true,
                              borderRadius: 8,
                              activeTextColor: Colors.red,
                              inactiveTextColor:Colors.black,
                              inactiveColor: Colors.grey.shade300,
                              activeColor: Colors.grey.shade300,
                              value: messageStatus,
                              onToggle: (val) {
                                setState(() {
                                  messageStatus = val;
                                });
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:  [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(
                                width: 20,
                              ),
                              const Text(
                                "New Arrivals",
                                textAlign:TextAlign.left,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18),
                              ),
                            ],
                          ),
                          Container(
                            alignment: Alignment.bottomCenter,
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow:const [
                                  BoxShadow(color: Colors.black12,offset: Offset(2,2),blurRadius: 2,spreadRadius: 0.9),
                                  BoxShadow(color: Colors.white,offset: Offset(-2,-2),blurRadius: 2,spreadRadius: 0.9),
                                ]),
                            child: FlutterSwitch(
                              height: 30,
                              width: 70,
                              showOnOff: true,
                              borderRadius: 8,
                              activeTextColor: Colors.red,
                              inactiveTextColor:Colors.black,
                              inactiveColor: Colors.grey.shade300,
                              activeColor: Colors.grey.shade300,
                              value: newArrivalStatus,
                              onToggle: (val) {
                                setState(() {
                                  newArrivalStatus = val;
                                });
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              visible: _expanded,
            ):Container(),
            const SizedBox(
              height: 30,
            ),
            SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.only(left: 32.0,right: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text("Push Notification",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500)),
                  Container(
                    decoration: BoxDecoration(
                      color:Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow:const [
                      BoxShadow(color: Colors.black26,offset: Offset(4,4),blurRadius: 4,spreadRadius: 0.4),
                      BoxShadow(color: Colors.white60,offset: Offset(-4,-4),blurRadius: 4,spreadRadius: 0.4),
                    ]),
                    child: FlutterSwitch(
                      height: 30,
                      width: 70,
                      showOnOff: true,
                      borderRadius: 8,
                      activeTextColor: Colors.black,
                      inactiveTextColor:Colors.black,
                      inactiveColor: Colors.grey.shade300,
                      activeColor: Colors.grey.shade300,
                      value: pushStatus,
                      onToggle: (val) {
                        setState(() {
                          pushStatus = val;
                        });
                      },
                    ),
                  ),
                  // Container(
                  //   alignment: Alignment.centerRight,
                  //   child: Text(
                  //     "Value: $status3",
                  //   ),
                  // ),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left: 32.0,right: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text("Notification at Night",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500)),
                  Container(
                    decoration: BoxDecoration(
                        color:Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow:const [
                          BoxShadow(color: Colors.black26,offset: Offset(4,4),blurRadius: 4,spreadRadius: 0.4),
                          BoxShadow(color: Colors.white60,offset: Offset(-4,-4),blurRadius: 4,spreadRadius: 0.4),
                        ]),
                    child: FlutterSwitch(
                      height: 30,
                      width: 70,
                      showOnOff: true,
                      borderRadius: 8,
                      activeTextColor: Colors.black,
                      inactiveTextColor:Colors.black,
                      inactiveColor: Colors.grey.shade300,
                      activeColor: Colors.grey.shade300,
                      value: nightStatus,
                      onToggle: (val) {
                        setState(() {
                          nightStatus = val;
                        });
                      },
                    ),
                  ),
                  // Container(
                  //   alignment: Alignment.centerRight,
                  //   child: Text(
                  //     "Value: $status3",
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}