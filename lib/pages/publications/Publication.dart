import 'package:aeutna/widgets/ligne_horizontale.dart';
import 'package:flutter/material.dart';

class Publication extends StatefulWidget {
  const Publication({Key? key}) : super(key: key);

  @override
  State<Publication> createState() => _PublicationState();
}

class _PublicationState extends State<Publication> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("A.E.U.T.N.A", style: TextStyle(color: Colors.blueGrey)),
        actions: [
              InkWell(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (ctx) => Publication())),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10), // Image border
                    child: SizedBox.fromSize(
                      size: Size.fromRadius(25), // Image radius
                      child: Image.asset('assets/logo.jpeg', fit: BoxFit.cover,),
                    ),
                  ),
                ),
              ),
            ],
        ),
      body:  SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Card(
                shape: Border(),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Spacer(),
                        CircleAvatar(
                            backgroundImage: Image.asset("assets/logo.jpeg").image
                        ),
                        Spacer(),
                        Column(
                          children: [
                            Row(
                              children: [
                                Text("Thierry", style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold, fontSize: 15),),
                              ],
                            ),
                            Row(
                              children: [
                                Text("28 Août 2023", style: TextStyle(color: Colors.grey, fontSize: 12),),
                              ],
                            )
                          ],
                        ),
                        Spacer(flex: 15,),
                        IconButton(onPressed: (){}, icon: Icon(Icons.more_vert)),
                      ],
                    ),
                    Ligne(color: Colors.blueGrey),
                    Container(
                      height: 200,
                    ),
                    Ligne(color: Colors.blueGrey),
                    Row(
                      children: [
                        IconButton(onPressed: (){}, icon: Icon(Icons.lens_outlined)),
                        Spacer(),
                        IconButton(onPressed: (){}, icon: Icon(Icons.message_outlined)),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Container(
              child: Card(
                shape: Border(),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Spacer(),
                        CircleAvatar(
                            backgroundImage: Image.asset("assets/logo.jpeg").image
                        ),
                        Spacer(),
                        Column(
                          children: [
                            Row(
                              children: [
                                Text("Thierry", style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold, fontSize: 15),),
                              ],
                            ),
                            Row(
                              children: [
                                Text("28 Août 2023", style: TextStyle(color: Colors.grey, fontSize: 12),),
                              ],
                            )
                          ],
                        ),
                        Spacer(flex: 15,),
                        IconButton(onPressed: (){}, icon: Icon(Icons.more_vert)),
                      ],
                    ),
                    Ligne(color: Colors.blueGrey),
                    Container(
                      height: 200,
                    ),
                    Ligne(color: Colors.blueGrey),
                    Row(
                      children: [
                        IconButton(onPressed: (){}, icon: Icon(Icons.lens_outlined)),
                        Spacer(),
                        IconButton(onPressed: (){}, icon: Icon(Icons.message_outlined)),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Container(
              child: Card(
                shape: Border(),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Spacer(),
                        CircleAvatar(
                            backgroundImage: Image.asset("assets/logo.jpeg").image
                        ),
                        Spacer(),
                        Column(
                          children: [
                            Row(
                              children: [
                                Text("Thierry", style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold, fontSize: 15),),
                              ],
                            ),
                            Row(
                              children: [
                                Text("28 Août 2023", style: TextStyle(color: Colors.grey, fontSize: 12),),
                              ],
                            )
                          ],
                        ),
                        Spacer(flex: 15,),
                        IconButton(onPressed: (){}, icon: Icon(Icons.more_vert)),
                      ],
                    ),
                    Ligne(color: Colors.blueGrey),
                    Container(
                      height: 200,
                    ),
                    Ligne(color: Colors.blueGrey),
                    Row(
                      children: [
                        IconButton(onPressed: (){}, icon: Icon(Icons.lens_outlined)),
                        Spacer(),
                        IconButton(onPressed: (){}, icon: Icon(Icons.message_outlined)),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Container(
              child: Card(
                shape: Border(),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Spacer(),
                        CircleAvatar(
                            backgroundImage: Image.asset("assets/logo.jpeg").image
                        ),
                        Spacer(),
                        Column(
                          children: [
                            Row(
                              children: [
                                Text("Thierry", style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold, fontSize: 15),),
                              ],
                            ),
                            Row(
                              children: [
                                Text("28 Août 2023", style: TextStyle(color: Colors.grey, fontSize: 12),),
                              ],
                            )
                          ],
                        ),
                        Spacer(flex: 15,),
                        IconButton(onPressed: (){}, icon: Icon(Icons.more_vert)),
                      ],
                    ),
                    Ligne(color: Colors.blueGrey),
                    Container(
                      height: 200,
                    ),
                    Ligne(color: Colors.blueGrey),
                    Row(
                      children: [
                        IconButton(onPressed: (){}, icon: Icon(Icons.lens_outlined)),
                        Spacer(),
                        IconButton(onPressed: (){}, icon: Icon(Icons.message_outlined)),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Container(
              child: Card(
                shape: Border(),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Spacer(),
                        CircleAvatar(
                            backgroundImage: Image.asset("assets/logo.jpeg").image
                        ),
                        Spacer(),
                        Column(
                          children: [
                            Row(
                              children: [
                                Text("Thierry", style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold, fontSize: 15),),
                              ],
                            ),
                            Row(
                              children: [
                                Text("28 Août 2023", style: TextStyle(color: Colors.grey, fontSize: 12),),
                              ],
                            )
                          ],
                        ),
                        Spacer(flex: 15,),
                        IconButton(onPressed: (){}, icon: Icon(Icons.more_vert)),
                      ],
                    ),
                    Ligne(color: Colors.blueGrey),
                    Container(
                      height: 200,
                    ),
                    Ligne(color: Colors.blueGrey),
                    Row(
                      children: [
                        IconButton(onPressed: (){}, icon: Icon(Icons.lens_outlined)),
                        Spacer(),
                        IconButton(onPressed: (){}, icon: Icon(Icons.message_outlined)),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
