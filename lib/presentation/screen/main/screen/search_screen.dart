import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:one_goal/presentation/screen/main/provider/search_provider.dart';

class SearchScreen extends StatefulWidget {
    const SearchScreen({super.key});

    @override
    State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
    @override
    Widget build(BuildContext context) {
        return ChangeNotifierProvider(
            create: (context) => SearchProvider(),
            child: Consumer<SearchProvider>(
                builder: (context, searchProvider, child) {
                    return Scaffold(
                        appBar: AppBar(
                            title: const Text('Explore'),
                            backgroundColor: Colors.white,
                            elevation: 1,
                            centerTitle: true,
                        ),
                        body: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: MasonryGridView.count(
                                crossAxisCount: 3,
                                mainAxisSpacing: 4,
                                crossAxisSpacing: 4,
                                itemCount: searchProvider.imageList.length,
                                itemBuilder: (context, index) {
                                    return Material(
                                        borderRadius: BorderRadius.circular(6),
                                        clipBehavior: Clip.antiAlias,
                                        child: FadeInImage.memoryNetwork(
                                            placeholder: kTransparentImage,
                                            image: searchProvider.imageList[index],
                                            fit: BoxFit.cover,
                                        ),
                                    );
                                    },
                            ),
                        ),
                    );
                }
            )
        );
    }
}