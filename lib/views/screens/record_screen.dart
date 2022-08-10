import 'package:flutter/material.dart';
import 'package:kalajam/style.dart';

class RecordScreen extends StatelessWidget {
  const RecordScreen({
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
    Scaffold(
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        color: KalaStyle.backgroundColor,
        notchMargin: 40,
        child: Row(
          children: <Widget>[
            SizedBox(
              width: MediaQuery.of(context).size.width/16,
            ),
            IconButton(
              icon: const Icon(
                Icons.chevron_left,
                color: KalaStyle.kalaBlue,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            const Spacer(),
            IconButton(
              icon: const Icon(
                Icons.settings,
                color: KalaStyle.kalaBlue,
              ),
              onPressed: () {

              },
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width/16,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.red,
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: Colors.black,
          ),
          child: Center(child: const Icon(Icons.mic, color: Colors.red,))
        )
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: const Text(
        "Recording screen",
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
}
