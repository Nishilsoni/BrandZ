// // // import 'dart:convert';
// // // import 'dart:typed_data';
// // // import 'package:flutter/material.dart';
// // // import 'package:http/http.dart' as http;
// // // import 'package:cached_network_image/cached_network_image.dart';
// // //  // Ensure this is installed
// // // import 'package:flutter_image_compress/flutter_image_compress.dart'; // Ensure this is installed
// // // import 'package:image/image.dart' as img; // Ensure this is installed

// // // class TemplateSelectionScreen extends StatefulWidget {
// // //   @override
// // //   _TemplateSelectionScreenState createState() => _TemplateSelectionScreenState();
// // // }

// // // class _TemplateSelectionScreenState extends State<TemplateSelectionScreen> {
// // //   List<String> imageUrls = [];
// // //   bool isLoading = false;
// // //   bool hasError = false;

// // //   @override
// // //   void initState() {
// // //     super.initState();
// // //     fetchImages();
// // //   }

// // //   Future<void> fetchImages() async {
// // //     setState(() {
// // //       isLoading = true;
// // //     });

// // //     try {
// // //       final response = await http.get(Uri.parse('https://unsplash.com/s/photos/festival'), headers: {
// // //         'Authorization': 'hlkBGGz3UobnYwHM8F5N1sJDJmUNpFsGNsYjCBMI6P4',
// // //       });

// // //       if (response.statusCode == 200) {
// // //         final data = json.decode(response.body);
// // //         final List<String> urls = (data['results'] as List)
// // //             .map<String>((photo) => photo['urls']['regular'])
// // //             .toList();

// // //         final compressedUrls = await compressImages(urls);

// // //         setState(() {
// // //           imageUrls = compressedUrls;
// // //           isLoading = false;
// // //         });
// // //       } else {
// // //         setState(() {
// // //           hasError = true;
// // //           isLoading = false;
// // //         });
// // //       }
// // //     } catch (e) {
// // //       setState(() {
// // //         hasError = true;
// // //         isLoading = false;
// // //       });
// // //     }
// // //   }

// // //   Future<List<String>> compressImages(List<String> urls) async {
// // //     final compressedUrls = await Future.wait(urls.map((url) async {
// // //       try {
// // //         final imageBytes = await http.readBytes(Uri.parse(url));
// // //         final compressedBytes = await FlutterImageCompress.compressWithList(
// // //           imageBytes,
// // //           minWidth: 800,
// // //           minHeight: 600,
// // //           quality: 80, // Adjust quality as needed
// // //         );

// // //         final image = img.decodeImage(Uint8List.fromList(compressedBytes));
// // //         if (image != null) {
// // //           final compressedImage = img.encodeJpg(image, quality: 80);
// // //           // Convert to base64 string if needed
// // //           final base64Image = base64Encode(compressedImage);
// // //           return 'data:image/jpeg;base64,$base64Image';
// // //         } else {
// // //           return url; // Fallback to original URL if compression fails
// // //         }
// // //       } catch (e) {
// // //         print('Error compressing image: $e');
// // //         return url; // Fallback to original URL in case of an error
// // //       }
// // //     }));

// // //     return compressedUrls;
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     if (isLoading) {
// // //       return Scaffold(
// // //         appBar: AppBar(title: Text('Festival Images')),
// // //         body: Center(child: CircularProgressIndicator()),
// // //       );
// // //     }

// // //     if (hasError) {
// // //       return Scaffold(
// // //         appBar: AppBar(title: Text('Festival Images')),
// // //         body: Center(child: Text('Error loading images')),
// // //       );
// // //     }

// // //     return Scaffold(
// // //       appBar: AppBar(title: Text('Festival Images')),
// // //       body: imageUrls.isEmpty
// // //           ? Center(child: Text('No images found'))
// // //           : GridView.builder(
// // //               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
// // //                 crossAxisCount: 2,
// // //                 crossAxisSpacing: 4.0,
// // //                 mainAxisSpacing: 4.0,
// // //               ),
// // //               itemCount: imageUrls.length,
// // //               itemBuilder: (context, index) {
// // //                 return CachedNetworkImage(
// // //                   imageUrl: imageUrls[index],
// // //                   placeholder: (context, url) => Center(child: CircularProgressIndicator()),
// // //                   errorWidget: (context, url, error) => Center(child: Icon(Icons.error)),
// // //                 );
// // //               },
// // //             ),
// // //     );

// // //   }
// // // }

// // import 'dart:convert';
// // import 'package:flutter/material.dart';
// // import 'package:flutter/services.dart';
// // import 'package:flutter_application_1/select_template.dart';

// // import 'template_editor_screen.dart';
// // import 'FestivalSvgImage.dart'; // Ensure this path is correct

// // class TemplateSelectionScreen extends StatefulWidget {
// //   @override
// //   _TemplateSelectionScreenState createState() => _TemplateSelectionScreenState();
// // }

// // class _TemplateSelectionScreenState extends State<TemplateSelectionScreen> {
// //   List<FestivalImage> festivalImages = [];
// //   bool isLoading = false;
// //   bool hasError = false;

// //   @override
// //   void initState() {
// //     super.initState();
// //     loadFestivalImages();
// //   }

// //   Future<void> loadFestivalImages() async {
// //     setState(() {
// //       isLoading = true;
// //     });

// //     try {
// //       final String response = await rootBundle.loadString('assets/festival_images.json');
// //       final List<dynamic> data = json.decode(response);
// //       final List<FestivalImage> fetchedImages =
// //           data.map((json) => FestivalImage.fromJson(json)).toList();

// //       setState(() {
// //         festivalImages = fetchedImages;
// //         isLoading = false;
// //       });
// //     } catch (e) {
// //       setState(() {
// //         hasError = true;
// //         isLoading = false;
// //       });
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Festival & Wishing Images'),
// //       ),
// //       body: isLoading
// //           ? Center(child: CircularProgressIndicator())
// //           : hasError
// //               ? Center(child: Text('Error loading images'))
// //               : ListView.builder(
// //                   itemCount: festivalImages.length,
// //                   itemBuilder: (context, index) {
// //                     final festivalImage = festivalImages[index];
// //                     return ListTile(
// //                       leading: Image.network(festivalImage.imageUrl),
// //                       title: Text(festivalImage.name),
// //                       subtitle: Text(festivalImage.description),
// //                       onTap: () {
// //                         Navigator.push(
// //                           context,
// //                           MaterialPageRoute(
// //                             builder: (context) =>
// //                                 TemplateEditorScreen(imageUrl: festivalImage.imageUrl),
// //                           ),
// //                         );
// //                       },
// //                     );
// //                   },
// //                 ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/select_template.dart';
// import 'template_editor_screen.dart';
// import 'FestivalSvgImage.dart';
// import 'package:flutter_svg/flutter_svg.dart'; // Ensure this path is correct

// class TemplateSelectionScreen extends StatefulWidget {
//   @override
//   _TemplateSelectionScreenState createState() => _TemplateSelectionScreenState();
// }

// class _TemplateSelectionScreenState extends State<TemplateSelectionScreen> {
//   List<FestivalImage> festivalImages = [];
//   bool isLoading = false;
//   bool hasError = false;

//   @override
//   void initState() {
//     super.initState();
//     loadFestivalImages();
//   }

//   void loadFestivalImages() {
//     setState(() {
//       isLoading = true;
//     });

//     try {
//       final List<Map<String, String>> festivalData = [
//         {
//           "name": "Diwali Celebration",
//           "description": "Brighten your Diwali with the joy of lights and festive cheer.",
//           "imageUrl": "https://www.svgrepo.com/show/490895/diwali.svg"
//         },
//         {
//           "name": "Christmas Tree",
//           "description": "A beautifully decorated Christmas tree to bring holiday spirit.",
//           "imageUrl": "https://www.svgrepo.com/show/489563/christmas-tree.svg"
//         },
//         {
//           "name": "New Year Fireworks",
//           "description": "Celebrate the New Year with stunning fireworks displays.",
//           "imageUrl": "https://www.svgrepo.com/show/395575/fireworks.svg"
//         },
//         {
//           "name": "Eid Mubarak",
//           "description": "Warm wishes for a blessed Eid filled with peace and joy.",
//           "imageUrl": "https://www.svgrepo.com/show/376193/eid-mubarak.svg"
//         },
//         {
//           "name": "Thanksgiving Feast",
//           "description": "A bountiful Thanksgiving dinner with family and friends.",
//           "imageUrl": "https://www.svgrepo.com/show/491537/thanksgiving.svg"
//         }
//       ];

//       setState(() {
//         festivalImages = festivalData.map((json) => FestivalImage.fromJson(json)).toList();
//         isLoading = false;
//       });
//     } catch (e) {
//       setState(() {
//         hasError = true;
//         isLoading = false;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Festival & Wishing Images'),
//       ),
//       body: isLoading
//           ? Center(child: CircularProgressIndicator())
//           : hasError
//               ? Center(child: Text('Error loading images'))
//               : ListView.builder(
//                   itemCount: festivalImages.length,
//                   itemBuilder: (context, index) {
//                     final festivalImage = festivalImages[index];
//                     return ListTile(
//                       leading: Image.network(festivalImage.imageUrl),
//                       title: Text(festivalImage.name),
//                       subtitle: Text(festivalImage.description),
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) =>
//                                 TemplateEditorScreen(imageUrl: festivalImage.imageUrl),
//                           ),
//                         );
//                       },
//                     );
//                   },
//                 ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'template_editor_screen.dart';

class FestivalImage {
  final String name;
  final String description;
  final String imageUrl;

  FestivalImage({required this.name, required this.description, required this.imageUrl});
}

class TemplateSelectionScreen extends StatefulWidget {
  @override
  _TemplateSelectionScreenState createState() => _TemplateSelectionScreenState();
}

class _TemplateSelectionScreenState extends State<TemplateSelectionScreen> {
  List<FestivalImage> festivalImages = [];
  bool isLoading = false;
  bool hasError = false;

  @override
  void initState() {
    super.initState();
    loadFestivalImages();
  }

  void loadFestivalImages() {
    setState(() {
      isLoading = true;
    });

    try {
      final List<Map<String, String>> festivalData = [
        {
          "name": "Diwali Celebration",
          "description": "Brighten your Diwali with the joy of lights and festive cheer.",
          "imageUrl": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTEtW78opkNUtc3JhGd8GFP67TKoMRRoTmLBg&s"
        },
        {
          "name": "Christmas Tree",
          "description": "A beautifully decorated Christmas tree to bring holiday spirit.",
          "imageUrl": "https://www.svgrepo.com/show/489563/christmas-tree.svg"
        },
        {
          "name": "New Year Fireworks",
          "description": "Celebrate the New Year with stunning fireworks displays.",
          "imageUrl": "https://www.svgrepo.com/show/395575/fireworks.svg"
        },
        {
          "name": "Eid Mubarak",
          "description": "Warm wishes for a blessed Eid filled with peace and joy.",
          "imageUrl": "https://www.svgrepo.com/show/376193/eid-mubarak.svg"
        },
        {
          "name": "Thanksgiving Feast",
          "description": "A bountiful Thanksgiving dinner with family and friends.",
          "imageUrl": "https://www.svgrepo.com/show/491537/thanksgiving.svg"
        }
      ];

      setState(() {
        festivalImages = festivalData.map((json) => FestivalImage(
          name: json['name']!,
          description: json['description']!,
          imageUrl: json['imageUrl']!
        )).toList();
        isLoading = false;
      });
    } catch (e) {
      print('Error loading images: $e');
      setState(() {
        hasError = true;
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Festival & Wishing Images'),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : hasError
              ? Center(child: Text('Error loading images'))
              : ListView.builder(
                  itemCount: festivalImages.length,
                  itemBuilder: (context, index) {
                    final festivalImage = festivalImages[index];
                    return Card(
                      margin: EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 200,
                            width: double.infinity,
                            child: SvgPicture.network(
                              festivalImage.imageUrl,
                              placeholderBuilder: (BuildContext context) => Center(child: CircularProgressIndicator()),
                             
                            ),
                          ),
                          ListTile(
                            title: Text(
                              festivalImage.name,
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              festivalImage.description,
                              style: TextStyle(fontSize: 12),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => TemplateEditorScreen(imageUrl: festivalImage.imageUrl),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
    );
  }
}
