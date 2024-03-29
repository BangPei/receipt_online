import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:receipt_online_shop/library/common.dart';
import 'package:receipt_online_shop/screen/home/screen/package_card.dart';
import 'package:receipt_online_shop/screen/product_report/bloc/product_form_bloc.dart';
import 'package:receipt_online_shop/screen/product/data/product.dart';
import 'package:receipt_online_shop/screen/product_report/data/report_detail.dart';
import 'package:receipt_online_shop/widget/custom_appbar.dart';
import 'package:receipt_online_shop/widget/loading_screen.dart';
import 'package:receipt_online_shop/widget/text_form_decoration.dart';

class ProductFormScreen extends StatefulWidget {
  final ReportDetail reportDetail;
  const ProductFormScreen({super.key, required this.reportDetail});

  @override
  State<ProductFormScreen> createState() => _ProductFormScreenState();
}

class _ProductFormScreenState extends State<ProductFormScreen> {
  TextEditingController qtyControler = TextEditingController();
  TextEditingController qtyCartonControler = TextEditingController();
  @override
  void initState() {
    context
        .read<ProductFormBloc>()
        .add(OnInitReportDetail(widget.reportDetail));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: CustomAppbar(
          title: "Produk Form",
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ),
      ),
      body: BlocListener<ProductFormBloc, ProductFormState>(
        listener: (context, state) {
          qtyControler.text = (state.detail?.qty ?? 0).toString();
          qtyCartonControler.text = (state.detail?.qtyCarton ?? 0).toString();
        },
        child: BlocBuilder<ProductFormBloc, ProductFormState>(
          builder: (context, state) {
            if ((state.isLoading ?? true)) {
              return const LoadingScreen();
            } else {
              Product product = state.detail?.product ?? Product();
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(9, 9, 9, 15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          leading: const Icon(
                            Icons.shopping_cart_checkout_rounded,
                            color: Colors.blue,
                            size: 40,
                          ),
                          title: Text(
                            (product.name ?? "--").toUpperCase(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                  'Barcode : ${product.barcode ?? "Barcode : --"}'),
                              Text(
                                  "Harga Satuan : Rp. ${Common.oCcy.format(product.price ?? 0)}"),
                            ],
                          ),
                        ),
                        const Divider(height: 2),
                        const SizedBox(height: 20),
                        DropdownButtonFormField<String>(
                          value: state.detail?.age,
                          items: const [
                            DropdownMenuItem(value: "1+", child: Text("1+")),
                            DropdownMenuItem(value: "3+", child: Text("3+")),
                            DropdownMenuItem(value: null, child: Text("Bebas")),
                          ],
                          onChanged: (data) {
                            context
                                .read<ProductFormBloc>()
                                .add(OnChangedAge(data));
                          },
                          decoration: TextFormDecoration.box("Usia"),
                        ),
                        const SizedBox(height: 20),
                        DropdownButtonFormField<String>(
                          value: state.detail?.taste,
                          items: const [
                            DropdownMenuItem(
                              value: "madu",
                              child: Text("Madu"),
                            ),
                            DropdownMenuItem(
                              value: "vanila",
                              child: Text("Vanila"),
                            ),
                            DropdownMenuItem(value: null, child: Text("Bebas")),
                          ],
                          onChanged: (data) {
                            context
                                .read<ProductFormBloc>()
                                .add(OnChangedTaste(data));
                          },
                          decoration: TextFormDecoration.box("Rasa"),
                        ),
                        const SizedBox(height: 20),
                        DropdownButtonFormField<String>(
                          value: state.detail?.size,
                          items: const [
                            DropdownMenuItem(
                              value: "300gr",
                              child: Text("300gr"),
                            ),
                            DropdownMenuItem(
                              value: "700gr",
                              child: Text("700gr"),
                            ),
                            DropdownMenuItem(
                              value: "1 KG",
                              child: Text("1 KG"),
                            ),
                            DropdownMenuItem(value: null, child: Text("Bebas")),
                          ],
                          onChanged: (data) {
                            context
                                .read<ProductFormBloc>()
                                .add(OnChangedSize(data));
                          },
                          decoration: TextFormDecoration.box("Kemasan"),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: qtyControler,
                                onChanged: (value) {
                                  int val = value == "" ? 0 : int.parse(value);
                                  context
                                      .read<ProductFormBloc>()
                                      .add(OnChangedQty(val));
                                  setState(() {});
                                },
                                decoration: TextFormDecoration.box("Qty"),
                              ),
                            ),
                            const SizedBox(width: 5),
                            Expanded(
                              child: TextFormField(
                                controller: qtyCartonControler,
                                onChanged: (value) {
                                  int val = value == "" ? 0 : int.parse(value);
                                  context
                                      .read<ProductFormBloc>()
                                      .add(OnChangedQtyCarton(val));
                                  setState(() {});
                                },
                                decoration:
                                    TextFormDecoration.box("Qty per Karton"),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 20),
                        const Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Total Karton"),
                            Text((state.detail?.totalCarton ?? 0).toString()),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Total"),
                            Text(
                                "Rp. ${Common.oCcy.format(state.detail?.subTotal ?? 0)}"),
                          ],
                        ),
                        const SizedBox(height: 20),
                        ButtonTask(
                          title: "Simpan",
                          width: 100,
                          onTap: () => Navigator.pop<ReportDetail>(
                              context, state.detail),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
