import 'package:flutter/material.dart';
import 'package:swift_cafe/screens/DetailPage.dart';
import 'package:swift_cafe/screens/HomePage.dart';

Widget beverageCard(BuildContext context, String title, String imagePath,
    String rating, String reviews) {
  return Container(
    width: MediaQuery
        .of(context)
        .size
        .width * 0.35,
    decoration: BoxDecoration(
      color: Colors.white.withOpacity(0.3),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(imagePath, height: 80, width: 80),
        SizedBox(height: 10),
        Text(title, style: TextStyle(color: Colors.white)),
        SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.star, color: Colors.yellow, size: 16),
            SizedBox(width: 5),
            Text('$rating ($reviews)',
                style: TextStyle(color: Colors.white70, fontSize: 12)),
          ],
        ),
        SizedBox(height: 10),
        Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Colors.green,
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.add, color: Colors.white, size: 20),
        ),
      ],
    ),
  );
}



Widget beverageCardVertical(BuildContext context, String title,
    String imagePath, String rating, String reviews, String description) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 8),
    decoration: BoxDecoration(
      color: Colors.white.withOpacity(0.1),
      borderRadius: BorderRadius.circular(15),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.yellow, size: 16),
                    SizedBox(width: 4),
                    Text(
                      rating,
                      style: TextStyle(
                          color: Colors.yellow, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 4),
                    Text(
                      '($reviews)',
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(width: 8),
                    Image.asset('assets/veg.png')
                  ],
                ),
                SizedBox(height: 8),
                Text(
                  description,
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                  height: 120,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (ctx) => DetailPage(title: title, imagePath: imagePath, rating: rating, description: description, numberOfRatingsGiven: reviews )));
                },
                child: Text('ADD'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(),
                  padding: EdgeInsets.symmetric(
                      horizontal: 16, vertical: 8),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}


