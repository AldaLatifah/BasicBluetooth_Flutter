import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final String angka;
  const DetailPage({Key? key, required this.angka}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TEST HASIL "),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Text(widget.angka)),
        ],
      ),
    );
  }
}
