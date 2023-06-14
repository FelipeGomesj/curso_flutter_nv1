import 'package:flutter/material.dart';
import 'package:flutter_nv1/model/Posts.dart';

class PostDetailsPage extends StatelessWidget {
  const PostDetailsPage({super.key, required this.post});

  final Posts post;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Details Page'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              post.title.toString(),
              style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 32,
            ),
            Text(
              post.body.toString(),
              style: const TextStyle(
                fontSize: 24
              ),
            ),
          ],
        ),
      ),
    );
  }
}
