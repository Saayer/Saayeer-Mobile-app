import 'package:flutter/material.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/features/clients/presentation/bloc/clients_bloc.dart';
import 'package:saayer/features/clients/presentation/widgets/client_item_widget_helper.dart';
import 'package:saayer/features/clients/presentation/widgets/empty_clients.dart';

class ClientsListWidget extends StatefulWidget {
  final List<ClientGetDto>? clientsList;
  final ScrollController scrollController;
  final ClientsBloc clientsBloc;

  const ClientsListWidget({
    super.key,
    required this.clientsList,
    required this.scrollController,
    required this.clientsBloc,
  });

  @override
  State<ClientsListWidget> createState() => _ClientsListWidgetState();
}

class _ClientsListWidgetState extends State<ClientsListWidget> {

  @override
  void initState() {
    widget.scrollController.addListener(() => widget.clientsBloc.add(const OnScrollPagination()));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    if (widget.clientsBloc.state.clientsList!.isEmpty) {
      return const Expanded(
          child: EmptyClients(
            hasButton: false,
          ));
    }
    return Expanded(
      child: SingleChildScrollView(
        controller: widget.clientsBloc.clientsScrollController,
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: widget.clientsBloc.state.clientsList?.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final ClientGetDto clientsList = widget.clientsBloc.state.clientsList![index];
              final bool isLast = (index == widget.clientsBloc.state.clientsList!.length - 1);
              Widget clientWidget;
              clientWidget = ClientItemWidgetHelper().getClientItemWidget(
                clientGetDto: clientsList,
              );
              return Column(
                children: [
                  clientWidget,
                  if (isLast)
                    const SizedBox(
                      height: 50,
                    )
                ],
              );
            }),
      ),
    );
  }
}
