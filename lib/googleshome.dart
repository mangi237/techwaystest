import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:news_app/readingpage.dart';

// import 'package:news_app/model/source_model.dart';

void main() {
  runApp(Google());
}

class Google extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      debugShowCheckedModeBanner: false,
      home: NewsList(),
    );
  }
}

class NewsList extends StatefulWidget {
  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  List<Article> news = [];

  Future<void> _fetchNews() async {
    String apiKey = 'b64118d2de47474ead05546767ce1a1f';
    String url =
        'https://newsapi.org/v2/top-headlines?country=us&category=technology&apiKey=b64118d2de47474ead05546767ce1a1f';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      List<dynamic> articles = json['articles'];

      news = articles.map((article) => Article.fromJson(article)).toList();

      setState(() {});
    } else {
      Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(70)),
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Error Fetching Articles',
                style: GoogleFonts.getFont('DM SANS').copyWith(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          ],
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                   Text(
                    'TechWays',
                    style: GoogleFonts.getFont('DM Sans').copyWith(
                        fontSize: 25,
                        color: Colors.black87,
                        fontWeight: FontWeight.w900),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(50)),
                        image: const DecorationImage(
                            image: AssetImage('lib/images/icon_logo.avif'),
                            fit: BoxFit.cover)),
                  ),
                 
                
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              height: 80,
              width:double.infinity,
              decoration:BoxDecoration(
               color:Colors.green, borderRadius: BorderRadius.all(Radius.circular(49))
              ), child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children:[
                  Container(
                    height:60,width:60, decoration:BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
        
        color: Colors.black,
        image: DecorationImage(image: AssetImage(
       'lib/images/icon_logo.avif'   
        ),fit:BoxFit.cover)
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right:8.0),
                    child: Text('Breaking News on Technology', style:GoogleFonts.getFont('DM Sans').copyWith(
                      fontSize: 20, fontWeight: FontWeight.bold,color: Colors.white
                    )),
                  )
                ]
              )
            ),
          ),

          Expanded(
            child: Container(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: news.length,
                itemBuilder: (context, index) {
                  return NewsFeedSection(
                      // source: _news[index].source,
                      disc: news[index].description,
                      title: news[index].title,
                      urlToImage: news[index].urlToImage,newsArticle: news[index],
                      newsPress: () => {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ReadingPage(newsArticles: news[index] ),))
                      });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Article {
  String title;
  String description;
  // Source source;
  String url;
  String author, urlToImage, content;

  Article({
    required this.title,
    required this.description,
    required this.url,
    // required this.source,
    required this.author,
    required this.content,
    required this.urlToImage,


  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      title: json['title'] as String? ?? '',
      description: json['description'] as String? ?? '',
      url: json['url'] as String? ?? '',
      author: json['author'] as String? ?? '',
      content: json['content'] as String? ?? '',
      urlToImage: json['urlToImage'] as String? ?? '',
      // source: Source(
      //     id: json['id'] as String? ?? '', name: json['name'] as String? ?? ''),
    );
  }
}

class NewsFeedSection extends StatelessWidget {
  final title, disc;
  // Source source;
  final urlToImage;

  final  Article  newsArticle;

  final newsPress;


  NewsFeedSection(
      {super.key,
      // required this.source,
      required this.disc,
      required this.title,
      required this.urlToImage,
      required this.newsArticle,
      required this.newsPress,
      }); 

  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: GestureDetector(
        onTap: newsPress,
        child: Container(
         
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                    Container(
                      height: 75,
                      width: 75,
                      decoration: const BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          image: DecorationImage(
                              image: AssetImage('lib/images/icon_logo.avif'),
                              fit: BoxFit.cover)),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left:8.0),
                              child: Text('TechWays', style: GoogleFonts.getFont('DM Sans').copyWith(
                                fontSize: 19,color:Colors.black,fontWeight: FontWeight.bold,
                              ),
                              
                              ),
                            ),
                                               Text('-- United States', style: GoogleFonts.getFont('DM Sans').copyWith(
                      fontSize: 19,color:Colors.black,fontWeight: FontWeight.bold,
                    ),
                    
                    
                    ),
        
                          ],
                        ),
                          // ),
        
                         Padding(
                           padding: const EdgeInsets.only( left:8.0),
                           child: Text('TechWays', style: GoogleFonts.getFont('DM Sans').copyWith(
                                  fontSize: 19,color:Colors.black54,fontWeight: FontWeight.w300,
                                ),
                                
                                ),
                         ), 
                      ],
                    ),
        
                    //   Text('is at --', style: GoogleFonts.getFont('DM Sans').copyWith(
                    //   fontSize: 15,color:Colors.black,fontWeight: FontWeight.w300,
                    // ),
        
                    
                    
                  
                  ])),
                ),
                
                Container(
                  
                  decoration:BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  color: Colors.amber,
                    image:DecorationImage(image: NetworkImage(urlToImage),fit: BoxFit.cover ), 
        
        
                  ),
                  height:250, width:double.infinity,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    title,
                    style: GoogleFonts.getFont('DM Sans').copyWith(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 2,
                  ),
                ),
        
                // Text(title),
                // Text(disc),
               
              ],
            ),
          ),
        ),
      ),
    );
  }
}
