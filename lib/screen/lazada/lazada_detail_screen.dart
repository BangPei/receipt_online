import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:receipt_online_shop/model/transaction_online.dart';
import 'package:receipt_online_shop/screen/lazada/bloc/platform_bloc.dart';
import 'package:receipt_online_shop/widget/card_order.dart';
import 'package:receipt_online_shop/widget/default_color.dart';
import 'package:receipt_online_shop/widget/loading_screen.dart';

class LazadaDetailOrderScreen extends StatefulWidget {
  final TransactionOnline order;
  const LazadaDetailOrderScreen({super.key, required this.order});

  @override
  State<LazadaDetailOrderScreen> createState() =>
      _LazadaDetailOrderScreenState();
}

class _LazadaDetailOrderScreenState extends State<LazadaDetailOrderScreen> {
  @override
  void initState() {
    context.read<PlatformBloc>().add(PlatformSingleOrder(widget.order));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order Detail"),
        leading: IconButton(
          onPressed: () {
            Navigator.popUntil(context, (route) => route.isFirst);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: BlocBuilder<PlatformBloc, PlatformState>(
        builder: (context, state) {
          if (state is PlatformLoading) {
            return const LoadingScreen();
          }
          if (state is PlatformOrder) {
            return ListView(
              children: [
                CardOrder(showStatus: false, order: state.transaction),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 5.0,
                    vertical: 15,
                  ),
                  child: Visibility(
                    visible: state.transaction.showRequest ?? false,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: 150,
                          height: 45,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: DefaultColor.primary,
                            ),
                            onPressed: () {
                              context
                                  .read<PlatformBloc>()
                                  .add(PlatformRTS(state.transaction));
                            },
                            child: const Text(
                              "Siap Kirim",
                              style: TextStyle(
                                color: Color(0xffffffff),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 150,
                          height: 45,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.blueAccent,
                            ),
                            onPressed: () {},
                            child: const Text(
                              "Buat Paket",
                              style: TextStyle(
                                color: Color(0xffffffff),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            );
          }
          return const Text('Something Wrong');
        },
      ),
    );
  }
}
