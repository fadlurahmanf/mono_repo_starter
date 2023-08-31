import 'package:flutter/material.dart';
import 'package:core_config/config.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:mapp_api/mapp_api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mapp_example/src/presentation/pagination/bloc/pagination_bloc.dart';

class PaginationScreen extends StatefulWidget with WrapperState {
  const PaginationScreen({super.key});

  @override
  State<PaginationScreen> createState() => _PaginationScreenState();

  @override
  Widget wrap(BuildContext context) {
    return BlocProvider(
      create: (context) => context.get<PaginationBloc>()..add(const PaginationEvent.fetchData()),
      child: this,
    );
  }
}

class _PaginationScreenState extends State<PaginationScreen> {
  final pagingController = PagingController<int, PaginationItemResponse>(
    firstPageKey: 900,
  );

  @override
  void initState() {
    super.initState();
    pagingController.addPageRequestListener((pageKey) {
      print("MASUK ADD PAGE REQUEST LISTENER: $pageKey");
      context.read<PaginationBloc>().add(const PaginationEvent.fetchData());
    });
  }

  @override
  void dispose() {
    pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<PaginationBloc, PaginationState>(
          listenWhen: (previous, current) => previous.loadPaginationState != current.loadPaginationState,
          listener: (context, state) {
            final pagState = state.loadPaginationState;
            if (pagState is LoadPaginationSuccess) {
              print("MASUK SUCCESS: ${pagState.isLastPage}");
              print("MASUK SUCCESS: ${pagState.nextOffset}");
              if (pagState.isLastPage) {
                pagingController.appendLastPage(pagState.items);
              } else {
                pagingController.appendPage(pagState.items, pagState.nextOffset);
              }
            }
          },
        )
      ],
      child: Scaffold(
        appBar: AppBar(),
        body: PagedListView(
          pagingController: pagingController,
          builderDelegate: PagedChildBuilderDelegate<PaginationItemResponse>(
            itemBuilder: (context, item, index) {
              return Container(
                color: Colors.red,
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("ID: ${item.id}"),
                    Text("NAME: ${item.firstName}"),
                    Text("EMAIL: ${item.email}"),
                    Text("STREET: ${item.street}"),
                  ],
                ),
              );
            },
            noMoreItemsIndicatorBuilder: (context){
              return Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.symmetric(horizontal: 10),
                color: Colors.blue,
                child: Text("NO MORE ITEMS"),
              );
            }
          ),

        ),
      ),
    );
  }
}
