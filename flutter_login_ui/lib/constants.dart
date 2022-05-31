import 'package:flutter/material.dart';

const background = Color(0xff191414);
const green1 = Color(0xff1db954);
const green2 = Color(0xff1ed760);
const dark = Color(0xff3a3b3c);
const dark2 = Color.fromARGB(255, 127, 129, 131);

class StyledButton extends StatelessWidget {
  StyledButton(
      {required this.child, required this.onPressed, required this.data});
  final Widget child;
  final String Function() onPressed;
  String data;

  @override
  Widget build(BuildContext context) => Container(
        height: 44,
        width: MediaQuery.of(context).size.width * 0.6,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25), color: green1),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.transparent,
            shadowColor: Colors.transparent,
            // shape: OutlinedBorder()
          ),
          onPressed: () =>
              {data = onPressed(), ToastNotification(data, context)},
          child: child,
        ),
      );
}

class StyledTextField extends StatelessWidget {
  const StyledTextField({required this.placeHolder, required this.value});

  final String placeHolder;
  final TextEditingController value;

  @override
  Widget build(BuildContext context) => ConstrainedBox(
        constraints: BoxConstraints(
            maxHeight: 50,
            maxWidth: MediaQuery.of(context).size.width * 0.6,
            minHeight: 30,
            minWidth: 80),
        child: TextField(
          style: const TextStyle(color: dark2),
          controller: value,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
              labelText: placeHolder,
              hintStyle: const TextStyle(color: dark),
              labelStyle: const TextStyle(color: dark),
              filled: true,
              fillColor: const Color.fromARGB(255, 18, 19, 19),
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white, width: 2.0),
                  borderRadius: BorderRadius.circular(25.0))),
        ),
      );
}

class TextGreen extends StatelessWidget {
  const TextGreen({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) => Text(
        text,
        style: const TextStyle(color: green2),
      );
}

class TextWhite extends StatelessWidget {
  const TextWhite({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) => Text(
        text,
        style: const TextStyle(color: dark),
      );
}

class ButtonTextGreen extends StatelessWidget {
  ButtonTextGreen(
      {required this.text, required this.data, required this.onPressed});

  final String text;
  String data;
  final String Function() onPressed;

  @override
  Widget build(BuildContext context) => GestureDetector(
      onTap: () {
        data = onPressed();
        ToastNotification(data, context);
      },
      child: Text(
        text,
        style: const TextStyle(color: green2),
      ));
}

void ToastNotification(data, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(data),
    ),
  );
}
