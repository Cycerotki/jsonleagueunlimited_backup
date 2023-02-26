import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Post extends StatelessWidget {
  final String username;
  final String location;
  final String image;
  final List<String> tags;

  const Post({
    Key? key,
    required this.username,
    required this.location,
    required this.image,
    required this.tags,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    dynamic color;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Username and location
        Padding(
          padding: const EdgeInsets.only(left: 16.0, top: 8),
          child: Row(
            children: [
              Text(
                username,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              const SizedBox(width: 10),
              Text(location),
            ],
          ),
        ),
        const SizedBox(height: 8),
        // Image
        Image.network(
          image,
          fit: BoxFit.cover,
          height: 300.0,
          width: double.infinity,
        ),
        const SizedBox(height: 4.0),
        // Tags
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Wrap(
            spacing: 8.0,
            children: tags.map((tag) {
              switch (tag) {
                case "healthy":
                  {
                    color = const Color.fromARGB(255, 140, 233, 154);
                  }
                  break;

                case "meat":
                  {
                    color = const Color.fromARGB(255, 255, 135, 135);
                  }
                  break;

                case "pescatarian":
                  {
                    color = const Color.fromARGB(255, 165, 216, 255);
                  }
                  break;

                default:
                  {
                    color = Colors.grey;
                  }
                  break;
              }
              return Chip(
                label: Text(tag),
                backgroundColor: color,
              );
            }).toList(),
          ),
        ),
        const SizedBox(height: 16.0),
      ],
    );
  }
}
