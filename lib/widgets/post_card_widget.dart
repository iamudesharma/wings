import 'package:flutter/material.dart';

class PostCardWidget extends StatelessWidget {
  const PostCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 10.0,
            bottom: 10.0,
            left: 10.0,
            right: 10.0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                children: [
                  const CircleAvatar(
                    backgroundImage:
                        NetworkImage("https://picsum.photos/200/300"),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "John Doe",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        "2 hours ago",
                        style: const TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  const Icon(Icons.more_vert)
                ],
              ),
              Image.network(
                "https://picsum.photos/200/300",
                fit: BoxFit.cover,
              ),
              const Text("Post Title"),
              const Text("Post Description"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.thumb_up_alt),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text("Like"),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.comment),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text("Comment"),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
