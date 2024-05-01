import 'package:hive/hive.dart';

import '../models/blog_model.dart';

abstract interface class LocalRemoteDataSource {
  void uploadLocalBlogs({required List<BlogModel> blogs});
}

class LocalRemoteDataSourceImpl implements LocalRemoteDataSource {
  final Box box;

  LocalRemoteDataSourceImpl(this.box);

  List<BlogModel> loadBlogs() {
    List<BlogModel> blogs = [];
    box.read(() {
      for (int i = 0; i < box.length; i++) {
        blogs.add(
          BlogModel.fromJson(
            box.get(
              i.toString(),
            ),
          ),
        );
      }
    });

    return blogs;
  }

  @override
  void uploadLocalBlogs({required List<BlogModel> blogs}) {
    box.clear();

    box.write(() {
      for (int i = 0; i < blogs.length; i++) {
        box.put(i.toString(), blogs[i].toJson());
      }
    });
  }
}
