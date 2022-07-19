import 'package:flutter/material.dart';
import 'package:coffee_master/datamanager.dart';
import 'package:coffee_master/datamodel.dart';

class ListMenuTile extends StatefulWidget {
  ListMenuTile({Key? key}) : super(key: key);

  @override
  State<ListMenuTile> createState() => _ListMenuTileState();
}

class _ListMenuTileState extends State<ListMenuTile> {
  // late final String category;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.brown,
              // color: Color.fromARGB(240, 221, 141, 57),
            ),
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Text(
                "Coffee",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
