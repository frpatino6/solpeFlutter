import 'package:flutter/material.dart';
import 'package:rcn_solpe/models/pedidos_response.dart';
import 'package:rcn_solpe/widgets/solpes/create_pedidos_widget.dart';
import 'package:rcn_solpe/widgets/solpes/create_solpes.dart';

class SolpesList extends StatefulWidget {
  static const String routeName = "SolpesList";

  @override
  _SolpesListState createState() => _SolpesListState();
}

class _SolpesListState extends State<SolpesList> {
  List<PedidosResponse> _listPedidosResponse;

  @override
  Widget build(BuildContext context) {
    _listPedidosResponse = ModalRoute.of(context).settings.arguments;
    return DefaultTabController(
      length: 2,
      child: Scaffold(appBar: _createAppBar(), body: _createBody(context)),
    );
  }

  Widget _createBody(BuildContext _context) {
    return TabBarView(
      children: [
        CreateSolpes(
          pedidosResponse: _listPedidosResponse,
          context: _context,
          heightSizedBox: 15.0,
          fontSizeInfo: 16.0,
          fontSizeLabel: 14.0,
        ),
        CreatePedidos(
          pedidosResponse: _listPedidosResponse,
          context: _context,
          heightSizedBox: 15.0,
          fontSizeInfo: 16.0,
          fontSizeLabel: 14.0,
        ),
      ],
    );
  }

  Widget _createAppBar() {
    return AppBar(
      title: Text("Pendientes"),
      bottom: TabBar(
        tabs: [
          Tab(
            icon: Icon(Icons.ac_unit),
            text: "Solicitudes de pedidos",
          ),
          Tab(icon: Icon(Icons.sort), text: "Pedidos"),
        ],
      ),
    );
  }
}