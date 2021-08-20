import 'package:flutter/material.dart';

class Notify {
  static notifyTheDialog({required String dialog, required context}) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              backgroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              contentPadding: EdgeInsets.all(0.0),
              content: Container(
                height: 60,
                child: Center(
                  child: Text(
                    '$dialog',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ));
  }
}
