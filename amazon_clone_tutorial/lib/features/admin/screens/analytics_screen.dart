import 'package:amazon_clone_tutorial/common/widgets/loader.dart';
import 'package:amazon_clone_tutorial/features/admin/models/sales.dart';
import 'package:amazon_clone_tutorial/features/admin/services/admin_services.dart';
// import 'package:amazon_clone_tutorial/features/admin/widgets/category_products_chart.dart';
// import 'package:charts_flutter_new/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class AnalyticsScreen extends StatefulWidget {
  const AnalyticsScreen({Key? key}) : super(key: key);

  @override
  State<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {
  final AdminServices adminServices = AdminServices();
  int? totalSales;
  List<Sales>? earnings;

  @override
  void initState() {
    super.initState();
    getEarnings();
  }

  getEarnings() async {
    var earningData = await adminServices.getEarnings(context);
    totalSales = earningData['totalEarnings'];
    earnings = earningData['sales'];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return earnings == null || totalSales == null
        ? const Loader()
        : Column(
            children: [
              Text(
                '\$$totalSales',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // const SizedBox(
              //   height: 250,
              //   // child: CategoryProductsChart(seriesList: [
              //   //   charts.Series(
              //   //     id: 'Sales',
              //   //     data: earnings!,
              //   //     domainFn: (Sales sales, _) => sales.label,
              //   //     measureFn: (Sales sales, _) => sales.earning,
              //   //   ),
              //   // ]),
              // ),
              SizedBox(
                height: 500,
                child: Scaffold(
                  appBar: AppBar(
                    title: const Text('Syncfusion Flutter chart'),
                  ),
                  body: Column(
                    children: [
                      SfCartesianChart(
                          primaryXAxis: const CategoryAxis(),
                          // Chart title
                          title: const ChartTitle(
                              text: 'Half yearly sales analysis'),
                          // Enable legend
                          legend: const Legend(isVisible: true),
                          // Enable tooltip
                          tooltipBehavior: TooltipBehavior(enable: true),
                          series: <CartesianSeries<Sales, String>>[
                            LineSeries<Sales, String>(
                                dataSource: earnings,
                                xValueMapper: (Sales sales, _) => sales.label,
                                yValueMapper: (Sales sales, _) => sales.earning,
                                name: 'Sales',
                                dataLabelSettings:
                                    const DataLabelSettings(isVisible: true)),
                          ]),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SfSparkLineChart.custom(
                            trackball: const SparkChartTrackball(
                              activationMode: SparkChartActivationMode.tap,
                            ),
                            marker: const SparkChartMarker(
                              displayMode: SparkChartMarkerDisplayMode.all,
                            ),
                            labelDisplayMode: SparkChartLabelDisplayMode.all,
                            xValueMapper: (int totalSales) =>
                                earnings![totalSales].label,
                            yValueMapper: (int totalSales) =>
                                earnings![totalSales].earning,
                            dataCount: 5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
  }
}
