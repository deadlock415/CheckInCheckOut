// import 'package:flutter/material.dart';

// class HorizontalList extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 100.0,
//       child: ListView(
//         scrollDirection: Axis.horizontal,
//         children: <Widget>[
//           Category(
//             image_location: 'images/cat/bedroom.png',
//             image_caption: 'bedroom',
//           ),

//           Category(
//             image_location: 'images/cat/kitchen.png',
//             image_caption: 'kitchen',
//           ),

          
//           Category(
//             image_location: 'images/cat/other.png',
//             image_caption: 'other',
//           ),

//           Category(
//             image_location: 'images/cat/study.png',
//             image_caption: 'study',
//           ),
//         ],
//       ),
//     );
//   }
// }

// class Category extends StatelessWidget {
//   final String image_location;
//   final String image_caption;

//   Category({this.image_location, this.image_caption});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(2.0),
//       child: InkWell(
//         onTap: () {},
//         child: Container(
//           width: 80.0,
//           child: ListTile(
//             title: Image.asset(
//               image_location,
//               width: 40.0,
//               height: 40.0,
//             ),
//             subtitle: Container(
//               alignment: Alignment.topCenter,
//               child: Text(image_caption, style: new TextStyle(fontSize: 12.0),),
//             )
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      child: ListView(
        scrollDirection:Axis.horizontal,
        children:<Widget>[
          Category(
            image_location:'images/cat/bedroom.png',
            image_caption:'Bedroom',
          ) ,

          Category(
            image_location:'images/cat/study.png',
            image_caption:'Study',
          ) ,

          Category(
            image_location:'images/cat/kitchen.png',
            image_caption:'Kitchen',
          ) ,

          Category(
            image_location:'images/cat/other.png',
            image_caption:'other',
          ) ,

        ]
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String image_location;
  final String image_caption;

  Category({
    this.image_location,
    this.image_caption
  });
  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(2.0),
    child: InkWell(onTap: (){},
    child: Container(
          width:100.0,
          child: ListTile(
        title: Image.asset(
          image_location,
          width: 100.0,
          height: 80.0,),
        subtitle:Container(
          alignment:Alignment.topCenter,
          child: Text(image_caption, style: new TextStyle(fontSize:12.0,),),
        ),
      ),
    ),
    ),
      
    );
  }
}