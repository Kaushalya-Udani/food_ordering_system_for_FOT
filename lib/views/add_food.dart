import 'package:flutter/material.dart';

class AddFood extends StatefulWidget {
  String image;
  String price;
  AddFood({Key? key, required this.image , required this.price}) : super(key: key);

  @override
  State<AddFood> createState() => _AddFoodState();
}

class _AddFoodState extends State<AddFood> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SizedBox(
              height: height * 0.02,
            ),

            Center(
              child: Container(
                height: height * 0.22,
                width: width * 0.32,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage(
                      widget.image,
                    ),
                    fit: BoxFit.cover,
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 10,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  widget.price,
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.black.withOpacity(0.5),
                      fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                  child: const Text(
                    "Order",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 10)
                  ),
                  onPressed: () {},
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
