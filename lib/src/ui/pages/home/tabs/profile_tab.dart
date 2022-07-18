// import 'package:cached_network_image/cached_network_image.dart';
import 'package:delivery_app/src/data/models/user.dart';
import 'package:delivery_app/src/helpers/get.dart';
import 'package:delivery_app/src/utils/font_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Get.i.find<User>();
    return Container(
      color: CupertinoColors.systemGroupedBackground,
      child: ListView(
        children: [
          const SizedBox(height: 20),
          Align(
            child: ClipOval(
              child: Image.network(
                "https://www.nj.com/resizer/h8MrN0-Nw5dB5FOmMVGMmfVKFJo=/450x0/smart/cloudfront-us-east-1.images.arcpublishing.com/advancelocal/SJGKVE5UNVESVCW7BBOHKQCZVE.jpg",
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
          ),
          CupertinoFormSection.insetGrouped(
            header: const Text("User information"),
            margin: const EdgeInsets.all(15).copyWith(top: 0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            children: [
              CupertinoFormRow(
                prefix: const Text(
                  "ID: ",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: Text(user.id),
              ),
              CupertinoFormRow(
                prefix: const Text(
                  "Name: ",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: Text("${user.name} ${user.lastname}"),
              ),
              CupertinoTextFormFieldRow(
                prefix: const Text(
                  "Email: ",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                initialValue: user.email,
                textAlign: TextAlign.right,
                style: FontStyles.normal.copyWith(
                  color: Colors.black,
                ),
              ),
              CupertinoFormRow(
                prefix: const Text(
                  "Birthday: ",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: Text(
                  user.birthday.toString(),
                ),
              )
            ],
          ),
          CupertinoFormSection.insetGrouped(
            header: const Text("Payment methods"),
            children: [
              CupertinoFormRow(
                prefix: const Text(
                  "Credit cards",
                  style: TextStyle(color: Colors.black),
                ),
                child: CupertinoButton(
                  onPressed: () {},
                  minSize: 20,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: const Text("Show 〉"),
                ),
              ),
              CupertinoFormRow(
                prefix: const Text(
                  "Paypal",
                  style: TextStyle(color: Colors.black),
                ),
                child: CupertinoButton(
                  onPressed: () {},
                  minSize: 20,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: const Text("test@paypal.com 〉"),
                ),
              ),
            ],
          ),
          CupertinoFormSection.insetGrouped(
            header: const Text("My Account"),
            children: [
              CupertinoFormRow(
                prefix: const Text(
                  "Remove or hide",
                  style: TextStyle(color: Colors.black),
                ),
                child: CupertinoButton(
                  onPressed: () {},
                  minSize: 20,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: const Text("Set confirguration"),
                ),
              ),
              CupertinoFormRow(
                prefix: const Text(
                  "Session",
                  style: TextStyle(color: Colors.black),
                ),
                child: CupertinoButton(
                  onPressed: () {},
                  minSize: 20,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: const Text(
                    "Sign Out",
                    style: TextStyle(color: Colors.redAccent),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
