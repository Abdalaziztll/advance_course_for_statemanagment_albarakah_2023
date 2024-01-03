import 'package:bloc_pattern/bloc/cat_bloc.dart';
import 'package:bloc_pattern/config/observer/bloc_observer.dart';
import 'package:bloc_pattern/model/cat_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CatsUi(),
    );
  }
}

class CatsUi extends StatelessWidget {
  const CatsUi({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CatBloc()..add(GetCats()),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: BlocListener<CatBloc, CatState>(
              listener: (context, state) {
                if (state is SuccessToLoadCatDetails) {
                  print('object');
                  ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
                    duration: Duration(seconds: 10),
                    content: Text('Please Choose One of The Cats'),
                    backgroundColor: Colors.green,
                    behavior: SnackBarBehavior.floating,
                  ));
                } else if (state is SuccessToNavigate) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsPage(cat: state.cat),
                      ));
                }
              },
              child: Text('Cats'),
            ),
          ),
          body: BlocBuilder<CatBloc, CatState>(
            builder: (context, state) {
              if (state is SuccessToLoadCatDetails) {
                return GridView.builder(
                  itemCount: state.cats.cats.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 30,
                      mainAxisSpacing: 20),
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      context.read<CatBloc>().add(
                          NavigateToCatDetails(cat: state.cats.cats[index]));
                    },
                    child: Container(
                      child: Image.network(state.cats.cats[index].image),
                    ),
                  ),
                );
              } else if (state is ErrorLoad) {
                return Center(
                  child: Text(state.errorModel.Message),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        );
      }),
    );
  }
}

class DetailsPage extends StatelessWidget {
  DetailsPage({super.key, required this.cat});
  final CatModel cat;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.network(cat.image),
          ListTile(
            title: Text(cat.name),
            subtitle: Text(cat.origin),
            leading: CircleAvatar(child: Text(cat.id.toString())),
            trailing: Text(cat.colors.toString()),
          )
        ],
      ),
    );
  }
}
