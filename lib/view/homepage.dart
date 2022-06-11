import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:machine_test/network/apicall.dart';
import 'package:machine_test/provider/homepageprovider.dart';
import 'package:machine_test/view/settingpage.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
    _getPosts();
  }

  void _getPosts() async {
    var provider = Provider.of<HomePageProvider>(context, listen: false);
    var postResponse =
        await APICall.getPosts(page: provider.currentPage, limit: 10);
    if (postResponse.isSuccessful) {
      if (postResponse.data!.isNotEmpty) {
        provider.setPostsList(postResponse.data!, notify: false);
        provider.setIsHomePageProcessing(false);
      }
    } else {
      provider.setIsHomePageProcessing(false);
      SnackBar(
        content: Text(
          postResponse.message.toString(),
          style: const TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.red,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const SettingPage()));
                },
                child: const Icon(
                  Icons.settings,
                  size: 26.0,
                ),
              )),
        ],
      ),
      body: SafeArea(
          left: true,
          right: true,
          child: Consumer<HomePageProvider>(
            builder: (_, provider, __) => provider.isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : provider.postsList.isNotEmpty
                    ? SizedBox(
                        child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 0.8,
                              crossAxisCount: 2,
                            ),
                            itemCount: provider.postsList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                onTap: () {
                                  _bottomSheet(context, provider, index);
                                },
                                child: Container(
                                  margin: const EdgeInsets.all(4),
                                  height: 210,
                                  width: 80,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(30),
                                      boxShadow: const [
                                        BoxShadow(
                                            color: Colors.black26,
                                            blurRadius: 4,
                                            offset: Offset(0.4, 0.4))
                                      ]),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                        borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(30),
                                            topRight: Radius.circular(30)),
                                        child: CachedNetworkImage(
                                          height: 130,
                                          width: 180,
                                          imageUrl:
                                              provider.postsList[index].image,
                                          imageBuilder:
                                              (context, imageProvider) =>
                                                  Container(
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: imageProvider,
                                                fit: BoxFit.fitHeight,
                                                colorFilter:
                                                    const ColorFilter.mode(
                                                  Colors.white,
                                                  BlendMode.colorBurn,
                                                ),
                                              ),
                                            ),
                                          ),
                                          placeholder: (context, url) =>
                                              const Center(child: CircularProgressIndicator()),
                                          errorWidget: (context, url, error) =>
                                              const Icon(Icons.error),
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0, top: 8),
                                            child: Text(
                                                provider.postsList[index].title,
                                                maxLines: 3,
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                )),
                                          ),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0, top: 8),
                                            child: Text(
                                              provider.postsList[index].price
                                                  .toString(),
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                      )
                    : const Center(
                        child: Text('Nothing to show here!'),
                      ),
          )),
    );
  }

  void _bottomSheet(
      BuildContext context, HomePageProvider provider, int index) {
    showBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.8,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30)),
                color: Colors.blue),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
                  child: Text(
                    "Details",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 18),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.4,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30)),
                          child: CachedNetworkImage(
                            imageUrl: provider.postsList[index].image,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          provider.postsList[index].title,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const Text(
                              "price: ",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              "\$${provider.postsList[index].price.toString()}",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        Text(
                          provider.postsList[index].category,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w400),
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              size: 18,
                              color: Colors.amber,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              provider.postsList[index].rating.rate.toString(),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ],
                    )),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          );
        });
  }
}
