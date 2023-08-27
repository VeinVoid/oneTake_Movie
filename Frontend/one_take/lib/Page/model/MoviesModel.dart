import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:one_take/widget/Widget.dart';

import '../config/API.dart';

class Movie {
  final int id;
  final String title;
  final String genre;
  final String release;
  final dynamic rate; 
  final String sinopsis;
  final String poster;

  Movie({
    required this.id,
    required this.title,
    required this.genre,
    required this.release,
    required this.rate,
    required this.sinopsis,
    required this.poster
  });

  factory Movie.fromJson(Map<String, dynamic> json){
    return Movie(id: json['id'], title: json['title'], genre: json['genre'], release: json['release'], rate: json['rate'], sinopsis: json['sinopsis'], poster: json['poster']);
  }
}

MovieAPI movieAPI = MovieAPI();

Widget ModelLayout({ String linkImg = '', String textTitle = '', String textGenre = '', String modelType = '', double left = 0, double right = 0, double top = 0, double bottom = 0 }){
  if(modelType == 'horiz'){
    return Container(
      margin: EdgeInsets.only(left: left), 
        child: Column(
          children: [
            Container(
              width: 107,
              height: 160,
              child: Image(
                image: NetworkImage(linkImg),
                fit: BoxFit.cover,
              )
            ),
            Container(
              width: 107,
              margin: EdgeInsets.only(
                top: top,
                bottom: bottom
              ),
              child: TextWidget(
                textLabel: textTitle,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                fontAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
              )
            ),
            Container(
              width: 107,
              child: TextWidget(
                textLabel: textGenre,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis
              ),
            )
          ],
        ),
      );
  }
  else if(modelType == 'ver'){
    return Container(
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 20),
            width: 107,
            height: 160,
            child: Image(
              image: NetworkImage(linkImg),
              fit: BoxFit.cover,
            )
          ),
          Container(
            child: Column(
              children: [
                Container(
                  
                  child: TextWidget(
                    textLabel: textTitle,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    fontAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    maxLine: 2 
                  ),
                ),
                Container(
                  child: TextWidget(
                    textLabel: textGenre,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    maxLine: 2
                  )
                )
              ],
            ),
          )
        ],
      ),
    );
  }
  else{
    return SizedBox();
  }
}


Widget MovieBuilder({ String shortType = '', String modelType = '', double height = 0, bool search = false, context }) {
  return Container(
    margin: EdgeInsets.only(
      top: 15,
    ),
    height: height,
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
          if (shortType == 'release') {
            listMovie.sort((a, b) => b.release.compareTo(a.release));
          } else if (shortType == 'best') {
            listMovie.sort((a, b) => b.rate.compareTo(a.rate));
          }
          if (modelType == 'horiz') { 
            int itemCount = listMovie.length > 7 ? 7 : listMovie.length;
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: itemCount,
              itemBuilder: (context, index) {
                return ModelLayout(
                  linkImg: listMovie[index].poster,
                  textTitle: listMovie[index].title,
                  textGenre: listMovie[index].genre,
                  modelType: modelType,
                  left: index == 0 ? 0.0 : 20.0,
                  top: 10,
                  bottom: 5
                );
              },
            );
          } 
          else if(modelType == 'ver'){
             return ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: listMovie.length,
              itemBuilder: (context, index) {
                return ModelLayout(
                  linkImg: listMovie[index].poster,
                  textTitle: listMovie[index].title,
                  textGenre: listMovie[index].genre,
                  modelType: modelType,
                  top: 10,
                  bottom: 5
                );
              },
            );
          }
          else {
            return Center(
              child: TextWidget(
                textLabel: 'NO LAYOUT MODEL ',
                fontSize: 20,
                fontWeight: FontWeight.w600,
                overflow: TextOverflow.ellipsis
              ),
            );
          }
        }
      },
    ),
  );
}

