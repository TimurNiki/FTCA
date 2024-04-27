import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BlogPage extends StatefulWidget {
  const BlogPage({super.key});

  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Blog App"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              CupertinoIcons.add_circled,
            ),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: state.blogs.length,
        itemBuilder: (context, index) {
          return;
        },
      ),
    );
  }
}
