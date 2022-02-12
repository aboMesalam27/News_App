import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/view/screens/home_screen.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
void main(){
   runApp(const News());
}
class News extends StatelessWidget {
  const News({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
        textTheme:GoogleFonts.cairoTextTheme(Theme.of(context).textTheme)
      ),
      title: "News",
      debugShowCheckedModeBanner: false,
      home: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.contain,
              image:AssetImage("assets/images/news.png")
          )
        ),
        child: SplashScreenView(
          imageSrc: 'assets/images/news.png',
          imageSize: 280,


          duration: 7070,
          navigateRoute: HomeScreen(),
        ),
      ),
    );
  }
}
