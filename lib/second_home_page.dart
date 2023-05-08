import 'package:api/sec_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

class SecondHomePage extends StatefulWidget {
  const SecondHomePage({super.key});

  @override
  State<SecondHomePage> createState() => _SecondHomePage();
}

class _SecondHomePage extends State<SecondHomePage> {
  List<UserPosts> userPosts = [];
  Future<List<UserPosts>> getData() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map<String, dynamic> index in data) {
        userPosts.add(UserPosts.fromJson(index));
      }
      return userPosts;
    } else {
      return userPosts;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                itemCount: userPosts.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 250,
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 15.0),
                    margin: const EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        getText(index, 'ID:', userPosts[index].id.toString()),
                        getText(
                            index, 'NAME:', userPosts[index].name.toString()),
                        getText(index, 'USERNAME:',
                            userPosts[index].username.toString()),
                        getText(
                            index, 'EMAIL:', userPosts[index].email.toString()),
                        getText(
                            index, 'PHONE:', userPosts[index].phone.toString()),
                        getText(index, 'WEBSITE:',
                            userPosts[index].website.toString()),
                        getText(index, 'COMPANY:',
                            userPosts[index].company.toString()),
                        getText(index, 'ADDRESS:',
                            '${userPosts[index].address.suite.toString()},${userPosts[index].address.street.toString()},${userPosts[index].address.city.toString()}-${userPosts[index].address.zipcode.toString()}'),
                      ],
                    ),
                  );
                });
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  Text getText(int index, String fieldName, String content) {
    return Text.rich(TextSpan(
      children: [
        TextSpan(
          text: fieldName,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextSpan(
          text: content,
          style: TextStyle(fontSize: 20),
        ),
      ],
    ));
  }
}
