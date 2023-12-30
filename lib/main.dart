import 'package:bloc_pattern/state_management/bloc/trade_sinalco_bloc.dart';
import 'package:bloc_pattern/view/weather_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WeatherPage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TradeSinalcoBloc(),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: TextField(
              onChanged: (value) {
                context
                    .read<TradeSinalcoBloc>()
                    .add(CutomizeImage(image_name: value));
              },
            ),
          ),
          body: Row(
            children: [
              Container(
                width: 400,
                height: 400,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: [
                    IconButton(
                        onPressed: () {
                          context.read<TradeSinalcoBloc>().add(SingleSinalco());
                        },
                        icon: const Icon(Icons.one_k)),
                    IconButton(
                        onPressed: () {
                          context.read<TradeSinalcoBloc>().add(MultiSinalco());
                        },
                        icon: const Icon(Icons.multiline_chart)),
                  ],
                ),
              ),
              BlocBuilder<TradeSinalcoBloc, TradeSinalcoState>(
                builder: (context, state) {
                  if (state is LoadingSinalco) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is SuccessToLoadSingle) {
                    return Container(
                      width: 400,
                      height: 400,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: Image.asset('assets/single.jpg').image),
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(20)),
                    );
                  } else if (state is SuccessToLoadMulti) {
                    return Container(
                      width: 400,
                      height: 400,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: Image.asset('assets/multi.jpg').image),
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(20)),
                    );
                  } else if (state is DisplayImageSuccesfully) {
                    return Image.network(state.image_to_display);
                  } else if (state is ErrorImage) {
                    return Placeholder();
                  } else {
                    return Center(
                      child: Text('please choose your order'),
                    );
                  }
                },
              )
            ],
          ),
        );
      }),
    );
  }
}
