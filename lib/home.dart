import 'package:flutter/material.dart';
 
class Mainpage extends StatefulWidget {
  const Mainpage({super.key});

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  List<Mymodel> itemsList = [
    Mymodel(
        isFavorite: true,
        imageName:
            "https://www.ikea.com/jo/en/images/products/fejka-artificial-potted-plant-in-outdoor-monstera__0614197_pe686822_s5.jpg",
        price: 11,
        discount: "2% OFF",
        name: "ABD"),
    Mymodel(
        isFavorite: false,
        imageName:
            "https://media.architecturaldigest.com/photos/5efb7da66d18ec1650bd30a7/master/w_1000,h_1250,c_limit/Corn-Plant-LArge-2.jpg",
        price: 55,
        discount: "12% OFF",
        name: "samer"),
    Mymodel(
        isFavorite: false,
        imageName:
            "https://images.unsplash.com/photo-1501004318641-b39e6451bec6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGxhbnR8ZW58MHx8MHx8&w=1000&q=80",
        price: 65,
        discount: "55% OFF",
        name: "layla"),
    Mymodel(
        isFavorite: false,
        imageName:
            "https://www.ikea.com/jo/en/images/products/fejka-artificial-potted-plant-with-pot-in-outdoor-succulent__0614211_pe686835_s5.jpg?f=s",
        price: 14,
        discount: "23% OFF",
        name: "sondos")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffECF5F3),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 24, right: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    radius: 27.5,
                    backgroundImage: NetworkImage(
                        "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png"),
                    backgroundColor: Colors.transparent,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: const [
                          Text(
                            "Hello, ",
                            style: TextStyle(
                              color: Color(0xff13442E),
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            "Abed alrahman",
                            style: TextStyle(color: Color(0xff13442E), fontSize: 18, fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                      const Text(
                        "Let’s buy plants!",
                        style: TextStyle(
                          color: Color(0xff426958),
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  Expanded(child: Container()),
                  InkWell(
                    child: Container(
                      width: 55,
                      height: 55,
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(27), color: const Color(0xff00CC76)),
                      child: const Icon(
                        Icons.message,
                        color: Colors.white,
                      ),
                    ),
                    onTap: () {
                      print("Message");
                    },
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: const [
                  Text(
                    "Choose your ",
                    style: TextStyle(color: Color(0xff13442E), fontSize: 20),
                  ),
                  Text(
                    "favorite plants",
                    style: TextStyle(color: Color(0xff13442E), fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  const Expanded(
                    child: Material(
                      elevation: 5.0,
                      shadowColor: Colors.black,
                      child: TextField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.search,
                            color: Color(0xffA1B4AB),
                          ),
                          hintText: "Search for plants...",
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey, width: 0.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    width: 58,
                    height: 44,
                    decoration: BoxDecoration(
                      color: const Color(0xffFFFFFF),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Image.asset("assets/filter.png"),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Categories",
                style: TextStyle(color: Color(0xff13442E), fontSize: 20),
              ),
              const SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    categoryitem("Mohammed", Icons.abc, false),
                    categoryitem("ahmed", Icons.dangerous, true),
                    categoryitem("bisan", Icons.access_alarm, false),
                    categoryitem("heba", Icons.account_circle, false),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: const [
                  Text(
                    "Recommended",
                    style: TextStyle(color: Color(0xff13442E), fontSize: 20),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Best Seller",
                    style: TextStyle(color: Color(0xffA1B4AB), fontSize: 20),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 2.5,
                child: SingleChildScrollView(
                  child: Expanded(
                    child: Column(children: [
                      Row(
                        children: [
                          myCard(context, itemsList[0]),
                          myCard(context, itemsList[1]),
                        ],
                      ),
                      Row(
                        children: [
                          myCard(context, itemsList[2]),
                          myCard(context, itemsList[3]),
                        ],
                      ),
                    ]),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget myCard(BuildContext context, Mymodel model) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 243,
        width: (MediaQuery.of(context).size.width / 2) - 48,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.green,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text("\$${model.price}"),
                      Expanded(child: Container()),
                      InkWell(
                        child: Icon(model.isFavorite ? Icons.favorite : Icons.favorite_outline),
                        onTap: () {
                             if (model.isFavorite == true) {
                             model.isFavorite = false;
                              setState(() {
                                 print("false");
                              });
              }            
                               else if (model.isFavorite == false) {
                             model.isFavorite = true;
                              setState(() {
                                 print("true");
                              });
                              
              
              }
                         
                        },
                      )
                    ],
                  ),
                  Text(model.discount),
                  const SizedBox(
                    height: 5,
                  ),
                  Center(
                    child: Image.network(
                      model.imageName,
                      height: 100,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(child: Container()),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 59,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20)),
                      color: Color(0xff13442E),
                    ),
                    child: Center(child: Text(model.name)),
                  ),
                ),
                InkWell(
                  child: Container(
                    width: 59,
                    height: 59,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(20)),
                      color: Color(0xff426958),
                    ),
                    child: model.count == 0
                        ? const Icon(
                            Icons.add,
                            color: Colors.white,
                          )
                        : Center(child: Text(model.count.toString())),
                  ),
                  onTap: () {
                    model.count = model.count + 1;
                    setState(() {});
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget categoryitem(String name, IconData data, bool haveBorder) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 128,
        height: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          border: haveBorder ? Border.all(color: haveBorder ? Colors.blueAccent : Colors.transparent) : null,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(data, color: const Color(0xff13442E)),
            Text(
              name,
              style: const TextStyle(color: Color(0xff13442E), fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}

class Mymodel {
  bool isFavorite;
  String imageName;
  double price;
  String discount;
  String name;
  int count;
  Mymodel({
    required this.isFavorite,
    required this.imageName,
    required this.price,
    required this.discount,
    required this.name,
    this.count = 0,
  });
}
