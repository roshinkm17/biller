import 'package:biller/components/mainButton.dart';
import 'package:biller/screens/invoice_screen.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class LayoutScreen extends StatefulWidget {
  LayoutScreen({Key key}) : super(key: key);
  static String id = "layout_screen_id";
  @override
  _LayoutScreenState createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {

  int current=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Which layout would you prefer?",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20,),
            CarouselSlider(items: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  image: DecorationImage(
                    image: AssetImage('assets/layouts/layout1.png'),
                    fit: BoxFit.cover,
                  )
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    image: DecorationImage(
                      image:  AssetImage('assets/layouts/layout2.png'),
                      fit: BoxFit.cover,
                    )
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    image: DecorationImage(
                      image:  AssetImage('assets/layouts/layout3.png'),
                      fit: BoxFit.cover,
                    )
                ),
              ),
            ],
                options: CarouselOptions(
                  height: MediaQuery.of(context).size.height/2,
                  autoPlayCurve: Curves.easeInOut,
                  enlargeCenterPage: true,
                  reverse: true,
                )),
            SizedBox(height: 20,),
            MainButton(
              buttonText: "Continue",
              onPressed: (){
                Navigator.pushNamed(context, InvoiceScreen.id);
              },
            ),
            ],
        ),
      ),
    );
  }
}
