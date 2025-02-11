
import 'dart:math';

import 'package:e_commerse/OpenPage/Api.dart';
import 'package:e_commerse/OpenPage/productView.dart';
import 'package:flutter/material.dart';

class page1 extends StatefulWidget {
  const page1({super.key});

  @override
  State<page1> createState() => _page1State();
}

class _page1State extends State<page1> {


  // geting an data from backend for diaplaying list of products
  late Future<List<Product>> futureProducts;

  @override
  void initState() {
    super.initState();
    futureProducts = ApiService.fetchProducts();
  }



  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height ;
    double w = MediaQuery.of(context).size.width ;

    return Scaffold(

      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 174, 160, 201),
      ),
      
      body: FutureBuilder<List<Product>>(
      future: futureProducts, // Use FutureBuilder to wait for the data
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator()); // Show loading indicator
        } 
        else if (snapshot.hasError) {
          return Center(child: Text("Error: ${snapshot.error}")); // Show error
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text("No products available"));
        } else {
          final products = snapshot.data!; // Data is now available
          print( products.length ) ;
          return Center(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all( min( h , w ) / 20 ),
            height: h,
            child: Center(
              child: ListView.builder(
                
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return ListOfItems( h:  h , w:  w , ind: index , product : products ) ;
                },
              ),
            ),
          ),
        ),
      ) ;
          
          
          
          // ListView.builder(
          //   itemCount: products.length, // ✅ Now products.length is valid
          //   itemBuilder: (context, index) {
          //     final product = products[index];
          //     return ListTile(
          //       title: Text(product.name),
          //       subtitle: Text("Price: \$${product.price}"),
          //     );
          //   },
          // );
        }
      },
      
      
      
      
      
    ) );
  }

}

List < dynamic > images = [
    [
      "assets/images/h1.jpg",
      "assets/images/h2.jpg",
      "assets/images/h3.jpg",
      "assets/images/h4.jpg",
      "assets/images/h5.jpg",
      "assets/images/h6.jpg",
    ]  ,

    [
      "assets/images/h1.jpg",
    ]  ,

[                   
      "assets/images/h4.jpg",
      "assets/images/h5.jpg",
      "assets/images/h6.jpg",
    ] ,

    [
      "assets/images/h6.jpg",
    ] ,
  ];

  




class ListOfItems extends StatefulWidget {
  final double h, w ; int ind ;
  final List<Product> product ;
  ListOfItems({required this.h, required this.w , required this.ind , required this.product });

  @override
  _ListOfItemsState createState() => _ListOfItemsState();
}

class _ListOfItemsState extends State<ListOfItems> {
  late PageController _pageController;
  late ValueNotifier<int> imageIdentification;

  
  

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);  // Start at 0 or saved index
    imageIdentification = ValueNotifier<int>(_pageController.initialPage);

    _pageController.addListener(() {
      int currentPage = _pageController.page?.round() ?? 0;
      if (imageIdentification.value != currentPage) {
        imageIdentification.value = currentPage;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double hi = max( widget.h , widget.w ) / 8 < widget.h && max( widget.h , widget.w ) / 8 < widget.w ?    max( widget.h , widget.w ) / 8 : min( widget.h , widget.w ) / 8 ;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            print("object") ;
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Productview()),
            );
          },
          child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            border: Border.all( 
              width: 1 ,
              color: Colors.black
            ),
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 143, 124, 179),
                Color.fromARGB(255, 162, 255, 243),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          height: max( widget.h , widget.w )  / 5,
          width: widget.w / 1.2,
          child: Row(
            children: [
              SizedBox(width: widget.w / 30),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Stack(
                        children: [
                          Container(
                              height: ( max( widget.h , widget.w )  / 5 ) / 7 ,
                              width:  ( max( widget.h , widget.w )  / 5 ) / 7  ,
                              color: const Color.fromARGB(0, 255, 193, 7),
                              child: FittedBox(
                                child: Icon( Icons.arrow_left , color: const Color.fromARGB(255, 0, 0, 0),),
                                
                              ),
                            ) ,
                          
                          GestureDetector(
                            onTap: () {
                              if (_pageController.page!.toInt() > 0 ) {
                              _pageController.previousPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            } else {
                              _pageController.jumpToPage(images[ 0 ].length - 1 ); // Go to first image if at the last one
                            }
                            },  
                            child: Container(
                              height: ( max( widget.h , widget.w )  / 5 ) / 7   ,
                              width:  ( max( widget.h , widget.w )  / 5 ) / 7  ,
                              color: const Color.fromARGB(0, 255, 192, 4),
                              ),
                            ),
                            
                        ],
                      ),
                      Container(
                        height: max( widget.h , widget.w ) / 8 < widget.h && max( widget.h , widget.w ) / 8 < widget.w ?    max( widget.h , widget.w ) / 8 : min( widget.h , widget.w ) / 8 ,
                        width: max( widget.h , widget.w ) / 8,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(0, 0, 0, 0),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        padding: EdgeInsets.only(left: 3),
                        child: PageView.builder(
                          controller: _pageController,
                          itemCount: images[ 0 ].length,
                          itemBuilder: (context, index) {
                            return Hero(
                              // decoration: BoxDecoration(
                              //   borderRadius: BorderRadius.all(Radius.circular(10)),
                                // image: DecorationImage(
                                //   fit: BoxFit.contain,
                                tag: '${widget.ind}|$index',
                                  child: Image.asset( "assets/images/h6.jpg" ) ,//images[widget.ind][ index ]),
                              //   ),
                              // ),
                            );
                          },
                        ),
                      ),
                      Stack(
                        children: [
                          Container(
                              height: ( max( widget.h , widget.w )  / 5 ) / 7 ,
                              width:  ( max( widget.h , widget.w )  / 5 ) / 7  ,
                              color: const Color.fromARGB(0, 255, 193, 7),
                              child: FittedBox(
                                child: Icon( Icons.arrow_right , color: const Color.fromARGB(255, 0, 0, 0),),
                              ),
                            ) ,
                          GestureDetector(
                            onTap: () {
                              if (_pageController.page!.toInt() < images[ 0 ].length - 1) {
                                _pageController.nextPage(
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                );
                              } else {
                                _pageController.jumpToPage(0); // Loop back to first image
                              }
                            },  
                            child: Container(
                              height: ( max( widget.h , widget.w )  / 5 ) / 7   ,
                              width:  ( max( widget.h , widget.w )  / 5 ) / 5  ,
                              color: const Color.fromARGB(0, 255, 192, 4),
                              ),
                            )
                        ],
                      ),
                    ],
                  ),
                  ValueListenableBuilder<int>(
                    valueListenable: imageIdentification,
                    builder: (context, value, child) {
                      return Row(
                        children: List.generate(
                          images[ 0 ].length,
                          (i) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Icon(
                              Icons.circle,
                              color: (value == i) ? const Color.fromARGB(255, 0, 0, 0) : const Color.fromARGB(255, 134, 134, 134),
                              size: 5,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(width: widget.w / 30),
              Container(
    
              ) ,
              Container(
                height: max( widget.h , widget.w )  / 5,
                width: (widget.w / 1.2) - (  ( max( widget.h , widget.w ) / 8 ) + ( 2 * ( ( max( widget.h , widget.w )  / 5 ) / 5 ) )  ) - (widget.w / 15) ,
                color: const Color.fromARGB(0, 255, 193, 7),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(
                      children: [
                        Text( widget.product[ widget.ind ].name ),
                      ],
                    ),
                    Wrap(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text( '${widget.product[ widget.ind ].rating}'  ) ,
                            Icon( Icons.star_border , size: 15,)
                          ],
                        )
                      ],
                    ),
                    Wrap(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon( Icons.currency_rupee, size: 15,) ,
                            Text( '${widget.product[ widget.ind ].price}' ) ,
                          ],
                        )
                      ],
                    ),
                    
                  ],
                )
                
              
              ),
            ],
          ),
        ),
        ) ,
        
        SizedBox(height: min(widget.h, widget.w) / 20),
      ],
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    imageIdentification.dispose();
    super.dispose();
  }
}
