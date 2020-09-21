import 'package:backtotheroots/helpers/articles.dart';
import 'package:backtotheroots/helpers/data.dart';
import 'package:backtotheroots/models/article_model.dart';
import 'package:backtotheroots/models/category_model.dart';
import 'package:backtotheroots/views/article.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomeView> {
  List<CategoryModel> categories = new List<CategoryModel>();
  List<ArticleModel> articles = new List<ArticleModel>();
  bool _loading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categories = getCategories();
    getArticles();
  }

  getArticles() async{
    Articles articlesClass = Articles();
    await articlesClass.getArticles();
    articles = articlesClass.articles;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("BackToThe"),
            Text(
              "Roots",
              style: TextStyle(color: Colors.red),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: _loading ? Center(
        child: Container(
          child: CircularProgressIndicator(),
        ),
      ) : SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 6),
          child: Column(
            children: <Widget>[

              ///Categories
              Container(

                height: 100,
                child: ListView.builder(
                  itemCount: categories.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return CategoryEntity(
                      name: categories[index].name,
                      image: categories[index].image,
                    );
                  },
                ),
              ),

              ///Articles
              Container(
                // height: 100,
                child: ListView.builder(
                  itemCount: articles.length,
                  shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemBuilder: (context, index){
                      return ArticleEntity(
                        title: articles[index].title,
                        urlToImage: articles[index].urlToImage,
                        description: articles[index].description,
                        url: articles[index].url,
                      );
                    },
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}

class CategoryEntity extends StatelessWidget {
  final image, name;

  CategoryEntity({this.image, this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 6),
      child: Stack(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(3),
            child: CachedNetworkImage(
              imageUrl: image,
              width: 180,
              height: 120,
              fit: BoxFit.cover,
            ),
            // Image.network(
            //   image,
            //   width: 180,
            //   height: 120,
            //   fit: BoxFit.cover,
            // ),
          ),
          Center(
            child: Container(
              alignment: Alignment.center,
              width: 180, height: 30,
              // alignment: ,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                color: Colors.white24,
              ),
              child: Text(
                name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ArticleEntity extends StatelessWidget {

  final title, urlToImage, description, url;

  ArticleEntity({this.title, this.urlToImage, this.description, this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => ArticleView(
            articleUrl: url,
          )
        ));
      },
      child: Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(
          children: <Widget>[
            Image.network(urlToImage),
            Text(title),
            Text(description),
          ],
        ),
      ),
    );
  }
}

