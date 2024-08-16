import 'package:flutter/material.dart';
import 'package:saayer/features/view_page/sub_features/request_shipment/presentation/bloc/request_shipment_bloc.dart';
import 'package:saayer/features/view_page/sub_features/request_shipment/sub_features/receiver/presentation/pages/receiver_page.dart';
import 'package:saayer/features/view_page/sub_features/request_shipment/sub_features/sender/presentation/pages/sender_page.dart';
import 'package:saayer/features/view_page/sub_features/request_shipment/sub_features/shipment_details/presentation/pages/shipment_details_page.dart';

class RequestShipmentPagesHelper {
  final RequestShipmentBloc requestShipmentBloc;

  RequestShipmentPagesHelper({required this.requestShipmentBloc});

  List<Widget> requestShipmentPages() =>
      [
        const SenderPage(),
        const ReceiverPage(),
        const ShipmentDetailsPage(),
        Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Service Provider'),
                MaterialButton(
                  onPressed: () {
                    requestShipmentBloc.add(GoToNextPageEvent());
                  },
                  child: Text('Next'),
                )
              ],
            ),
          ),
        ),
        Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Checkout'),
                MaterialButton(
                  onPressed: () {},
                  child: Text('Next'),
                )
              ],
            ),
          ),
        ),
        // AddEditAddressScreen(
        //   isAddShipmentRequest: false,
        //   addEditAddressType: AddEditAddressType.addAddress,
        //   customerModel: CustomerGetDto(),
        //   onBack: (CustomerAddDto addressInfoEntity) {
        //     //requestShipmentBloc.add(AddAddressInfoEvent(addressInfoEntity));
        //   },
        // ),
        // ShipmentSpecsScreen(
        //   isAddShipmentRequest: false,
        //   onBack: (ShipmentSpecsEntity shipmentSpecsEntity) {
        //     requestShipmentBloc.add(AddShipmentSpecsEvent(shipmentSpecsEntity));
        //   },
        // ),
        // CarriersShipmentScreen(),
        // ShipmentPreviewScreen(),
      ];
}
