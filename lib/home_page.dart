// import 'dart:convert';

// import 'package:api/model.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;


// class HomePageScreen extends StatefulWidget {
//   const HomePageScreen({super.key});

//   @override
//   State<HomePageScreen> createState() => _HomePageScreenState();
// }

// class _HomePageScreenState extends State<HomePageScreen> {
//   List<SamplePosts> samplePosts = [];
//   Future<List<SamplePosts>> getData() async {
//     final response =
//         await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
//     var data = jsonDecode(response.body.toString());

//     if (response.statusCode == 200) {
//       for (Map<String, dynamic> index in data) {
//         samplePosts.add(SamplePosts.fromJson(index));
//       }
//       return samplePosts;
//     } else {
//       return samplePosts;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//         future: getData(),
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             return ListView.builder(
//                 itemCount: samplePosts.length,
//                 itemBuilder: (context, index) {
//                   return Container(
//                     color: Colors.greenAccent,
//                     height: 130.0,
//                     padding: const EdgeInsets.symmetric(
//                       vertical: 10.0,
//                       horizontal: 10.0,
//                     ),
//                     margin: const EdgeInsets.all(10),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           'User Id:${samplePosts[index].userId}',
//                           style: TextStyle(fontSize: 18.0),
//                         ),
//                         Text(
//                           'Id: ${samplePosts[index].id}',
//                           style: TextStyle(fontSize: 18.0),
//                         ),
//                         Text(
//                           'Title: ${samplePosts[index].title}',
//                           maxLines: 1,
//                           style: TextStyle(fontSize: 18.0),
//                         ),
//                         Text(
//                           'Body: ${samplePosts[index].body}',
//                           maxLines: 1,
//                           style: TextStyle(fontSize: 18.0),
//                         ),
//                       ],
//                     ),
//                   );
//                 });
//           } else {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//         });
//   }
// }
