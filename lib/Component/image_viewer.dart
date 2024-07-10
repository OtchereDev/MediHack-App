// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class ImageViewer extends StatelessWidget {
//   final String url;
//   const ImageViewer({super.key, required this.url});

//   @override
//   Widget build(BuildContext context) {
//     return ClipRRect(
//       borderRadius: BorderRadius.circular(15),
//       child: CachedNetworkImage(
//         imageUrl: url,
//         imageBuilder: (context, imageProvider) => Container(
//           decoration: BoxDecoration(
//             image: DecorationImage(
//               image: imageProvider,
//               fit: BoxFit.cover,
//             ),
//           ),
//         ),
//         placeholder: (context, url) => Center(child: CupertinoActivityIndicator()),
//         errorWidget: (context, url, error) => Icon(Icons.error),
//       ),
//     );
//   }
// }
