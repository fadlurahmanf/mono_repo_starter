import 'package:flutter/material.dart';
import 'package:core_config/config.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mapp_example/src/presentation/pagination/bloc/pagination_bloc.dart';

class CtuPaginationScreen extends StatefulWidget with WrapperState {
  const CtuPaginationScreen({super.key});

  @override
  State<CtuPaginationScreen> createState() => _CtuPaginationScreenState();

  @override
  Widget wrap(BuildContext context) {
    return BlocProvider(
      create: (context) => context.get<PaginationBloc>()..add(const PaginationEvent.ctuFetchData()),
      child: this,
    );
  }
}

class _CtuPaginationScreenState extends State<CtuPaginationScreen> {
  final controller = ScrollController();
  bool isProcessing = false;

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      var nextPageTrigger = 0.8 * controller.position.maxScrollExtent;

      if (controller.position.pixels > nextPageTrigger && !isProcessing) {
        isProcessing = true;
        context.read<PaginationBloc>().add(const PaginationEvent.ctuFetchData());
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
        listeners: [
          BlocListener<PaginationBloc, PaginationState>(listener: (context, state) {
            if (state.ctuLoadPaginationState == CtuLoadPaginationState.success) {
              isProcessing = false;
            } else if (state.ctuLoadPaginationState == CtuLoadPaginationState.failed) {
              isProcessing = false;
            }
          })
        ],
        child: Scaffold(
          appBar: AppBar(),
          body: BlocBuilder<PaginationBloc, PaginationState>(
            builder: (context, state) {
              if (state.ctuLoadPaginationState == CtuLoadPaginationState.loading && state.isFirstTime == true) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return groupedItems(context);
              }
            },
          ),
        ));
  }

  Widget groupedItems(BuildContext context) {
    return BlocBuilder<PaginationBloc, PaginationState>(builder: (context, state) {
      return ListView.builder(
        controller: controller,
        itemCount: state.grouped.length,
        itemBuilder: (context, index) {
          final key = state.grouped[index].key;
          final items = state.grouped[index].items;
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(key),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: items.length,
                itemBuilder: (context2, index2) {
                  final item = items[index2];
                  return Container(
                    color: item.status == 'CANCELLED' ? Colors.red : Colors.green,
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("ID: ${item.id}"),
                        Text("LABEL: ${item.label}"),
                        Text("STATUS: ${item.status}"),
                        Text("CREATED AT: ${item.createdAt}"),
                      ],
                    ),
                  );
                },
              ),
              if (((index + 1) == state.grouped.length) &&
                  state.isFirstTime == false &&
                  state.ctuLoadPaginationState == CtuLoadPaginationState.loading)
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: const CircularProgressIndicator(),
                )
            ],
          );
        },
      );
    });
  }
}
