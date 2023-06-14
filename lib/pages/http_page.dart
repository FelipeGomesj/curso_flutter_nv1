import 'package:flutter/material.dart';
import 'package:flutter_nv1/pages/post_details_page.dart';
import 'package:flutter_nv1/repository/posts_repo.dart';
import '../helpers/my_colors.dart';
import '../model/Posts.dart';

class HttpPage extends StatefulWidget {
  const HttpPage({Key? key}) : super(key: key);

  @override
  State<HttpPage> createState() => _HttpPageState();
}
late ValueNotifier<Future<List<Posts>>?> futurePosts;
final ValueNotifier<PostsRepo> postsRepo = ValueNotifier<PostsRepo>(PostsRepo());
bool _loaded = false;
bool _loading = false;
class _HttpPageState extends State<HttpPage> {
  @override
  void initState() {
    if(_loaded == false){
      futurePosts = ValueNotifier(null);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Http Page")),
        leading: Navigator.of(context).canPop()
            ? IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(Icons.arrow_back))
            : Container(),
        backgroundColor: MyColors.myPrimaryColor,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if(_loaded == false) callButton('Requisitar'),
              ValueListenableBuilder(
                valueListenable: futurePosts,
                builder: (_, value, __) {
                  return FutureBuilder<List<Posts>>(
                    future: value,
                    builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return  Center(
                            child:  SizedBox(
                              height: MediaQuery.of(context).size.height * 0.05,
                              width: MediaQuery.of(context).size.width * 0.1,
                              child: const CircularProgressIndicator(
                                color: MyColors.myPrimaryColor,
                              ),
                            ),
                          );
                        } else if (snapshot.hasError) {
                          return Column(
                            children: [
                              Text('Falha ao buscar dados\n STATUS CODE:  ${snapshot.error}'),
                              callButton('Tentar novamente')
                            ],
                          );
                        } else if (snapshot.hasData) {
                          return ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: snapshot.data!.length,

                            itemBuilder: (context, index) {
                              final post = snapshot.data![index];
                              return ListTile(
                                leading: Text(post.id.toString()),
                                title: Text(post.title!),
                                subtitle: Text(post.body!),
                                trailing: const Icon(Icons.arrow_forward),
                                onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => PostDetailsPage(post: post))),
                              );
                            }, separatorBuilder: (BuildContext context, int index) => const Divider(
                            color: Colors.black,
                            height: 2,
                          ),
                          );
                        } else {
                          return Container();
                        }
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget callButton(String text){
    return ElevatedButton(
      onPressed: () {
        _loading = true;
        postsRepo.value.fetchPosts().then((response) {
          setState(() {
            futurePosts.value = Future.value(response);
            _loading = false;
            _loaded = true;
          });
        });
      },
      child: _loading == true
          ? const CircularProgressIndicator()
          :  Text(text),
    );
  }
}
