import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import '../../../config/const/constantes.dart';
import '../../widgets/custom_bottom_navigator.dart';
import 'profile.dart';
import 'register_huellas/home_view.dart';
import 'register_huellas/monitoreo_view.dart';
import 'user/users_screen.dart';

class HomeScreen extends StatefulWidget {
  static const name = 'home-screen';
  final int pageIndex;

  const HomeScreen({super.key, required this.pageIndex});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

//* Este Mixin es necesario para mantener el estado en el PageView
class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  late PageController pageController;
  late final WebSocketChannel channel;

  @override
  void initState() {
    super.initState();
    pageController = PageController(keepPage: true);
    channel = WebSocketChannel.connect(Uri.parse('ws://$ipServer/ws/acceso/'));

    // Escuchamos el stream manualmente
    channel.stream.listen((event) {});
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  final viewRoutes = const <Widget>[
    HomeView(),
    MonitoreoView(),
    UsersView(),
    UserProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    super.build(context);

    if (pageController.hasClients) {
      pageController.animateToPage(
        widget.pageIndex,
        curve: Curves.easeInOut,
        duration: const Duration(milliseconds: 250),
      );
    }

    return Scaffold(
      body: PageView(
        //* Esto evitará que rebote
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        // index: pageIndex,
        children: viewRoutes,
      ),
      bottomNavigationBar: CustomBottomNavigation(
        currentIndex: widget.pageIndex,
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class CustomDateDasboard extends StatelessWidget {
  final Color color;
  final String number;
  final String descrip;
  const CustomDateDasboard({
    super.key,
    required this.color,
    required this.descrip,
    required this.number,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: color,
          border: Border.all(),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16,
            top: 16,
            right: 16,
            bottom: 30,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                number,
                style: GoogleFonts.poppins(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                descrip,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class CustomLineChart extends StatelessWidget {
  const CustomLineChart({super.key});

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        titlesData: FlTitlesData(
          show: true,
          topTitles: const AxisTitles(
            sideTitles: SideTitles(
              showTitles: false,
            ), // 🔕 Oculta los de arriba
          ),
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(
              showTitles: false,
            ), // 🔕 Oculta los de la derecha
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: 1,
              getTitlesWidget: (value, meta) {
                switch (value.toInt()) {
                  case 0:
                    return const Text('Ene');
                  case 1:
                    return const Text('Feb');
                  case 2:
                    return const Text('Mar');
                  case 3:
                    return const Text('Abr');
                  case 4:
                    return const Text('May');
                }
                return const SizedBox.shrink();
              },
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: 1,
              getTitlesWidget: (value, meta) {
                return Text(value.toInt().toString());
              },
            ),
          ),
        ),
        gridData: const FlGridData(show: false), // ❌ sin líneas internas
        borderData: FlBorderData(
          show: true,
          border: const Border(
            left: BorderSide(color: Colors.white),
            bottom: BorderSide(color: Colors.white),
            right: BorderSide(color: Colors.transparent), // ❌ sin borde derecho
            top: BorderSide(color: Colors.transparent), // ❌ sin borde arriba
          ),
        ),
        minX: 0,
        maxX: 4,
        minY: 0,
        maxY: 5,
        lineBarsData: [
          LineChartBarData(
            isCurved: true,
            color: Colors.cyanAccent,
            barWidth: 3,
            dotData: const FlDotData(show: true),
            belowBarData: BarAreaData(
              show: true,
              color: Colors.cyanAccent.withOpacity(0.2),
            ),
            spots: const [
              FlSpot(0, 1),
              FlSpot(1, 1.5),
              FlSpot(2, 3),
              FlSpot(3, 2.8),
              FlSpot(4, 4),
            ],
          ),
        ],
      ),
    );
  }
}
