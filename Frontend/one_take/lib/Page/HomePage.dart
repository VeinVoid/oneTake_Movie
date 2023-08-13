import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:one_take/Page/config/API.dart';
import 'package:one_take/Page/model/MoviesModel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  MovieAPI movieAPI = MovieAPI();

  Widget TextHome(String text, String colorCodeTxt, double fontSize, FontWeight fontWeight, TextAlign textAlign){
    return Text(
      text,
      style: TextStyle(
        color: Color(int.parse('0xff$colorCodeTxt')),
        fontSize: fontSize,
        fontFamily: 'Roboto',
        fontWeight: fontWeight,
        ),
        textAlign: textAlign,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
    );
  }

  Widget FormFieldHome(String codeColorText, double fontSize, String hintText){
    return TextFormField(        
      style: TextStyle(color: Color(int.parse('0xff$codeColorText')), fontSize: fontSize), 
      decoration: InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(color: Color(0xff2C2C2C)), 
      contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      filled: true, 
      fillColor: const Color(0xffD9D9D9), 
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }

  Widget ImgLoader(String path, double widthImg, double heightImg){
    return SvgPicture.asset(
      path,
      width: widthImg,
      height: heightImg,
      );
  }

  Widget MovieBuilder(){
    return Container(
      margin: EdgeInsets.only(top: 15),
      height: 570,
      width: MediaQuery.of(context).size.width,
      child: FutureBuilder<List<Movie>>(
        future: movieAPI.getData(),
        builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
        return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No data available.'));
        } else {
          List<Movie> listMovie = snapshot.data!;
          return ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: listMovie.length,
          itemBuilder: (context, index) {
            return Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 20),
                        width: 107,
                        height: 163,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(listMovie[index].poster),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextHome(listMovie[index].title, '303030', 16, FontWeight.w600, TextAlign.start),
                            SizedBox(height: 5),
                            TextHome(listMovie[index].genre, '303030', 15, FontWeight.w500, TextAlign.start),
                            SizedBox(height: 20),
                            TextHome(listMovie[index].release, '303030', 14, FontWeight.w500, TextAlign.start),
                            SizedBox(height: 20),
                            Container(
                              child: Row(
                                children: [
                                  ImgLoader('assets/img/Ic_Rate_Movie.svg', 20, 20),
                                  SizedBox(width: 5,),
                                  TextHome(listMovie[index].rate.toString() + '/10', '303030', 14, FontWeight.w500, TextAlign.start)
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }
            );
          }
        }
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 20,),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
        child: Column(
          children: [
            Container(
              child: Align(
                alignment: Alignment.topLeft,
                child: ImgLoader('assets/img/Ic_Home_App.svg', 124, 45.43),
              )
            ),
            Container(
              margin: EdgeInsets.only(top: 20.46),
              child: FormFieldHome('303030', 15, 'Search'),
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: TextHome('Latest', '303030', 20, FontWeight.w600, TextAlign.center),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: TextHome('See All', '303030', 15, FontWeight.w400, TextAlign.center),
                  )
                ]
              ),
            ),
            MovieBuilder()
          ],
        ),
      )
    );
  }
}
