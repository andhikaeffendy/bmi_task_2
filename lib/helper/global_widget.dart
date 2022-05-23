import 'package:flutter/material.dart';

import '../constant/constant.dart';

nextPage(BuildContext context, MaterialPageRoute page) {
  return Navigator.push(context, page);
}

backPage(BuildContext context) {
  return Navigator.pop(context);
}

Widget buttonBack(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.4,
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black54, width: 1),
        color: Colors.white),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.arrow_back_ios,
          size: 15,
          color: Colors.black54,
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          "back".toUpperCase(),
          style: boldStyle.copyWith(color: Colors.black45, fontSize: 16),
        )
      ],
    ),
  );
}

Widget buttonBMI(BuildContext context, String text) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.4,
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12), color: Colors.blueGrey[400]),
    child: Text(
      text.toUpperCase(),
      textAlign: TextAlign.center,
      style: boldStyle.copyWith(
        color: Colors.white,
        fontSize: 16,
      ),
    ),
  );
}

Widget buttonNext(BuildContext context, String text) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.4,
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12), color: Colors.blueGrey[400]),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text.toUpperCase(),
          style: boldStyle.copyWith(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.normal),
        ),
        const SizedBox(
          width: 8,
        ),
        const Icon(
          Icons.arrow_forward_ios,
          size: 15,
          color: Colors.white,
        ),
      ],
    ),
  );
}
