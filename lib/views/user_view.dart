import 'package:flutter/material.dart';
import 'package:food_order/authentication/auth_screen.dart';
import 'package:food_order/global/global.dart';

import 'add_food.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  List? pizzaImages;
  List? pizzaPrice;
  List? riceImage;
  List? ricePrice;
  List? drinkImage;
  List? drinkPrice;
  @override
  Widget build(BuildContext context) {
    pizzaImages = [
      "https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F19%2F2014%2F07%2F10%2Fpepperoni-pizza-ck-x.jpg&q=60",
      "https://images.immediate.co.uk/production/volatile/sites/30/2013/05/Cheeseburger-3d7c922.jpg",
      "https://images.unsplash.com/photo-1603064752734-4c48eff53d05?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8YnVyZ2VyfGVufDB8fDB8fA%3D%3D&w=1000&q=80",
      "https://natashaskitchen.com/wp-content/uploads/2021/06/pizza-dough-sq.jpg",
      "https://www.seriouseats.com/thmb/TxUzNj_Ja-smH0t7YGsXiMANcYc=/735x0/20210607-INNOUTBURGERS-JANJIGIAN-seriouseats-23-b2b8a505ff414272aab71590a8985b85.jpg",
      "https://img.freepik.com/free-photo/pizza-pizza-filled-with-tomatoes-salami-olives_140725-1200.jpg",
    ];

    riceImage = [
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSWfYsVEVl6Ysn-cTS_mDIPhZg1hucrGcyekA&usqp=CAU",
      "https://www.pavaniskitchen.com/wp-content/uploads/2021/08/schezwan-veg-fried-rice.jpg",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTkdz7GB5vf9qu0g7u7oUFeyheFY7GT6Dt6oA&usqp=CAU",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQAYHex8husRjYdTwYTg0V15461vzLRM8tIrQ&usqp=CAU",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSnnWIYSMSKPYsGfC_x1SQVtazvEu8hb13FDg&usqp=CAU",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRg4O-XuaFm_rfwAx43eFzSJHjEmg4RT2n4S4C4nPCCoa1jUBKk7I-8WlKugSgkKSWpRfQ&usqp=CAU",
    ];

    drinkImage = [
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTM8HuW08iDigNZO8c-VDl1YU_LIP_83RpndQ&usqp=CAU",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSGTVpCuEpHsZwCM15YRUFC0ljb2fR4-oInXQ&usqp=CAU",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRpM4Jn3VxwiT9RWVl7X8Cl_hlHuZ1w96kZuA&usqp=CAU",
      "https://www.hindustantimes.com/web-stories/summer-special-drinks-one-must-try-7595/assets/1.jpeg",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRHpWK-wVd1YBnpzOxL8L7KJEtfHjC44Eptrw&usqp=CAU",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTut4Df0J1pqe-YHP35fGxLn4Q2OWD-vVWosw&usqp=CAU",
    ];

    pizzaPrice = [
      "Rs.250",
      "Rs.200",
      "Rs.300",
      "Rs.270",
      "Rs.200",
      "Rs.400",
    ];

    ricePrice = [
      "Rs.250",
      "Rs.200",
      "Rs.350",
      "Rs.230",
      "Rs.280",
      "Rs.200",
    ];

    drinkPrice = [
      "Rs.25",
      "Rs.50",
      "Rs.50",
      "Rs.100",
      "Rs.120",
      "Rs.100",
    ];

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.cyan,
                Colors.amber,
              ],
              begin: FractionalOffset(0.0, 0.0),
              end: FractionalOffset(1.0, 0.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp,
            ),
          ),
        ),
        title: Text(
          sharedPreferences!.getString("name")!,
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Foods",
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.black.withOpacity(0.5),
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: height * 0.01,
            ),
            SizedBox(
              height: height * 0.23,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(
                    left: 22,
                  ),
                  child: InkWell(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                          AddFood(image: pizzaImages![index], price: pizzaPrice![index],),));
                    },
                    child: Container(
                      height: height * 0.22,
                      width: width * 0.32,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: NetworkImage(
                            pizzaImages![index],
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
                ),
              ),
            ),

            SizedBox(
              height: height * 0.02,
            ),
            SizedBox(
              height: height * 0.23,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(
                    left: 22,
                  ),
                  child: InkWell(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                          AddFood(image: riceImage![index], price: ricePrice![index],),));
                    },
                    child: Container(
                      height: height * 0.22,
                      width: width * 0.32,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: NetworkImage(
                            riceImage![index],
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
                ),
              ),
            ),

            SizedBox(
              height: height * 0.02,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Drinks",
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.black.withOpacity(0.5),
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),

            SizedBox(
              height: height * 0.01,
            ),

            SizedBox(
              height: height * 0.23,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(
                    left: 22,
                  ),
                  child: InkWell(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                          AddFood(image: drinkImage![index], price: drinkPrice![index],),));
                    },
                    child: Container(
                      height: height * 0.22,
                      width: width * 0.32,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: NetworkImage(
                            drinkImage![index],
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
                ),
              ),
            ),

            SizedBox(
              height: height * 0.02,
            ),

            ElevatedButton(
              child: const Text("Logout"),
              style: ElevatedButton.styleFrom(
                primary: Colors.cyan,
              ),
              onPressed: () {
                firebaseAuth.signOut().then((value) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (c) => const AuthScreen()));
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
