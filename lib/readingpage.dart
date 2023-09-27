import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'googleshome.dart';

class ReadingPage extends StatelessWidget {
  final Article newsArticles;

  ReadingPage({super.key, required this.newsArticles});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
   body: ListView(
    children: [
      Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(onPressed: () => Navigator.pop(context), icon: Icon(Icons.arrow_back_ios, color: Colors.amber,size: 30,))
               , Text(
                      'TechWays',
                      style: GoogleFonts.getFont('DM Sans').copyWith(
                          fontSize: 25,
                          color: Colors.black87,
                          fontWeight: FontWeight.w900),
                    ),
                    Container(
          
                      height: 50,
                      width:50,
                    )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment:CrossAxisAlignment.start,
              children: [
                Text('Technology', style: GoogleFonts.getFont('DM Sans').copyWith(
                  fontSize: 
                  17,color: Colors.black54, fontWeight: FontWeight.w400,
                )),
                Text(newsArticles.title, style: GoogleFonts.getFont('DM Sans').copyWith(
                  fontSize: 28,color:Colors.black87,fontWeight: FontWeight.w600, 
                ),)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height:300,width:double.infinity,decoration: BoxDecoration(
          color:Colors.amber,
          image: DecorationImage(image: NetworkImage(newsArticles.urlToImage), fit: BoxFit.cover),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(newsArticles.description.toString(), style: GoogleFonts.getFont('DM Sans').copyWith(
          
              fontSize: 16,color: Colors.black87, fontWeight: FontWeight.w400
          
            ),),
          ),
        ],
      ),

   
    ],
   ),
    );
  }
}
