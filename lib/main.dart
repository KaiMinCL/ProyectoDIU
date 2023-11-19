import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => PacienteData(),
      child: const MainApp(),
    ),
  );
}

class PacienteData extends ChangeNotifier {
  List<List<dynamic>> tabla = [
    [3200, 48, DateTime(2023, 10, 15)],
    [3700, 50, DateTime(2023, 10, 22)],
    [4500, 57, DateTime(2023, 10, 29)],
    [6000, 61, DateTime(2023, 11, 5)],
    [7100, 64, DateTime(2023, 11, 12)]
  ];
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key});

  @override
  Widget build(BuildContext context) {
    var pacienteData = Provider.of<PacienteData>(context);
    return MaterialApp(
      home: Builder(builder: (context) {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Seguimiento Pediatril',
                  style: TextStyle(fontSize: 55, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const PacientesView(),
                        ),
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green),
                      minimumSize:
                          MaterialStateProperty.all(const Size(210, 50)),
                    ),
                    child: const Text(
                      'Ingreso Medico',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      // Change to a different view for 'Ingreso Padre'
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              TablaPaciente(pacienteData.tabla, origen: "azul"),
                        ),
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                      minimumSize:
                          MaterialStateProperty.all(const Size(210, 50)),
                    ),
                    child: const Text(
                      'Ingreso Padre',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}

class PacientesView extends StatelessWidget {
  const PacientesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pacientes'),
        backgroundColor: Colors.green,
      ),
      body: ListView(
        children: [
          // Tarjeta para Paciente 1
          Padding(
            padding: const EdgeInsets.only(top: 5.0, left: 8.0, right: 8.0),
            child: Card(
              child: ListTile(
                leading: const CircleAvatar(
                  radius:
                      30, // Ajusta el tamaño del CircleAvatar según tus necesidades
                  backgroundImage: NetworkImage(
                    'https://img.remediosdigitales.com/bac33a/istock-991386538/1024_2000.jpg',
                  ),
                ),
                title: const Text(
                  'Tomás Hernández',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
                subtitle: const Text(
                  'Edad: 5 semanas',
                  style: TextStyle(fontSize: 15),
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const EditarPaciente(),
                    ),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5.0, left: 8.0, right: 8.0),
            child: Card(
              child: ListTile(
                leading: const CircleAvatar(
                  radius:
                      30, // Ajusta el tamaño del CircleAvatar según tus necesidades
                  backgroundImage: NetworkImage(
                    'https://radiomitre-la100-prod.cdn.arcpublishing.com/resizer/7Mkdsiy6sEzTkasU-Ah5paTu27I=/992x0/smart/filters:quality(85):format(webp)/cloudfront-us-east-1.images.arcpublishing.com/radiomitre/HFA3WCBKM5GKVMHBZGVSP7UML4.jpg',
                  ),
                ),
                title: const Text(
                  'Sofía Irrazabal',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
                subtitle: const Text(
                  'Edad: 7 semanas',
                  style: TextStyle(fontSize: 15),
                ),
                onTap: () {
                  // snack bar diciendo que no hay datos
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('No hay datos para este paciente'),
                      duration: Duration(seconds: 3),
                    ),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5.0, left: 8.0, right: 8.0),
            child: Card(
              child: ListTile(
                leading: const CircleAvatar(
                  radius:
                      30, // Ajusta el tamaño del CircleAvatar según tus necesidades
                  backgroundImage: NetworkImage(
                    'https://previews.123rf.com/images/redbaron/redbaron0612/redbaron061200057/676921-reci%C3%A9n-nacido-3-semanas-de-edad-en-el-ni%C3%B1o-la-toalla.jpg',
                  ),
                ),
                title: const Text(
                  'Juanita Perez',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
                subtitle: const Text(
                  'Edad: 3 semanas',
                  style: TextStyle(fontSize: 15),
                ),
                onTap: () {
                  // snack bar diciendo que no hay datos
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('No hay datos para este paciente'),
                      duration: Duration(seconds: 3),
                    ),
                  );
                },
              ),
            ),
          ),
          // ... (tarjetas similares para otros pacientes)
        ],
      ),
    );
  }
}

class EditarPaciente extends StatefulWidget {
  const EditarPaciente({Key? key}) : super(key: key);

  @override
  _EditarPacienteState createState() => _EditarPacienteState();
}

class _EditarPacienteState extends State<EditarPaciente> {
  DateTime selectedDate = DateTime.now();
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var pacienteData = Provider.of<PacienteData>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Paciente'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: weightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Peso (g)'),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: heightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Estatura (cm)'),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Text(
                  'Fecha: ${DateFormat('dd/MM/yyyy').format(selectedDate)}',
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () => _selectDate(context),
                  child: const Text('Seleccionar Fecha'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green),
                minimumSize: MaterialStateProperty.all(const Size(210, 50)),
              ),
              onPressed: () {
                var datos = [
                  weightController.text,
                  heightController.text,
                  selectedDate.toLocal()
                ];

                if (_isValidData(datos)) {
                  pacienteData.tabla.add(datos);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Dato ingresado correctamente'),
                      duration: Duration(seconds: 3),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Por favor ingrese todos los datos'),
                      duration: Duration(seconds: 3),
                    ),
                  );
                }
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add,
                    size: 30,
                    color: Colors.white,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Ingresar Nuevo Dato',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue),
                minimumSize: MaterialStateProperty.all(const Size(210, 50)),
              ),
              onPressed: () {
                //revisar si existe un dato antes de mover. si no hay datos avisar con un snack bar
                if (pacienteData.tabla.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('No hay datos para este paciente'),
                      duration: Duration(seconds: 3),
                    ),
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          TablaPaciente(pacienteData.tabla, origen: "verde"),
                    ),
                  );
                }
              },
              child: const Text('Ver Datos', style: TextStyle(fontSize: 20)),
            ),
          ],
        ),
      ),
    );
  }

  bool _isValidData(List<dynamic> data) {
    return data
        .every((element) => element != null && element.toString().isNotEmpty);
  }
}

class TablaPaciente extends StatelessWidget {
  final String origen;
  const TablaPaciente(List<List> tabla, {Key? key, required this.origen})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var pacienteData = Provider.of<PacienteData>(context);
    List<List<dynamic>> sortedData = List.from(pacienteData.tabla);
    //define fecha como hace 2 semanas
    sortedData.sort((a, b) => (a[2] as DateTime).compareTo(b[2] as DateTime));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: origen == "verde" ? Colors.green : Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text(
              'Datos de Paciente:',
              style: TextStyle(
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
            const Text(
              'Tomás Hernández',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            PaginatedDataTable(
              columns: const [
                DataColumn(label: Text('Fecha')),
                DataColumn(label: Text('Peso (g)')),
                DataColumn(label: Text('Estatura (cm)')),
              ],
              source: _DataSource(sortedData),
              rowsPerPage: 7, // Puedes ajustar la cantidad de filas por página
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                //revisar si hay datos antes de mover. si no hay datos avisar con un snack bar
                if (pacienteData.tabla.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('No hay datos para este paciente'),
                      duration: Duration(seconds: 3),
                    ),
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GraficoPaciente(sortedData),
                    ),
                  );
                }
              },
              child: const Text('Ver Gráfico'),
            ),
          ],
        ),
      ),
    );
  }
}

class GraficoPaciente extends StatefulWidget {
  final List<List<dynamic>> data;

  const GraficoPaciente(this.data, {super.key});

  @override
  // ignore: library_private_types_in_public_api
  _GraficoPacienteState createState() => _GraficoPacienteState();
}

class _GraficoPacienteState extends State<GraficoPaciente> {
  bool comparacionActivada = false;
  final List<List<dynamic>> datosComparacion = [
    [3200, 50, DateTime(2023, 6, 19)],
    [4000, 54, DateTime(2023, 7, 19)],
    [4800, 57, DateTime(2023, 8, 19)],
    [5600, 60, DateTime(2023, 9, 19)],
    [6400, 63, DateTime(2023, 10, 19)],
    [7200, 66, DateTime(2023, 11, 19)],
  ];

  @override
  Widget build(BuildContext context) {
    // Obtener el valor mínimo y máximo de los datos
    double valorMinimoPeso = double.infinity;
    double valorMinimoEstatura = double.infinity;
    double valorMaximoPeso = -double.infinity;
    double valorMaximoEstatura = -double.infinity;

    DateTime fechaDeNacimiento = DateTime(2023, 10, 15);

    List<List<dynamic>> datosActuales = widget.data;

    for (var entry in datosComparacion) {
      double primerValor = double.tryParse(entry[0].toString()) ?? 0.0;
      valorMinimoPeso =
          primerValor < valorMinimoPeso ? primerValor : valorMinimoPeso;
      valorMaximoPeso =
          primerValor > valorMaximoPeso ? primerValor : valorMaximoPeso;

      double segundoValor = double.tryParse(entry[1].toString()) ?? 0.0;
      valorMinimoEstatura = segundoValor < valorMinimoEstatura
          ? segundoValor
          : valorMinimoEstatura;
      valorMaximoEstatura = segundoValor > valorMaximoEstatura
          ? segundoValor
          : valorMaximoEstatura;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Gráfico del Paciente'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Comparar con datos preestablecidos'),
                Switch(
                  value: comparacionActivada,
                  onChanged: (value) {
                    setState(() {
                      comparacionActivada = value;
                    });
                  },
                ),
              ],
            ),
            Expanded(
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(show: true),
                  titlesData: FlTitlesData(
                    leftTitles: SideTitles(
                      showTitles: true,
                      interval: (valorMaximoPeso - valorMinimoPeso),
                    ),
                    rightTitles: SideTitles(showTitles: false),
                    bottomTitles: SideTitles(
                      showTitles: true,
                      interval: (datosActuales.length / 7).ceil().toDouble(),
                      getTitles: (value) {
                        final index = value.round();
                        if (index >= 0 && index < datosActuales.length) {
                          final fechaDato = datosActuales[index][2] as DateTime;
                          int edadEnSemanas = ((fechaDato
                                      .difference(fechaDeNacimiento)
                                      .inDays) /
                                  7)
                              .floor();
                          return '$edadEnSemanas';
                        }
                        return '';
                      },
                    ),
                    topTitles: SideTitles(
                        showTitles: true,
                        interval: datosActuales.length.toDouble() / 2,
                        getTitles: (value) {
                          final index = value.round();
                          if (index == 1) {
                            return '';
                          }
                          if (index > 1) {
                            return 'Peso (g) // Edad (semanas)';
                          }
                          return '';
                        }),
                  ),
                  borderData: FlBorderData(
                    show: true,
                    border: Border.all(
                      color: const Color(0xff37434d),
                      width: 1,
                    ),
                  ),
                  minX: 0,
                  maxX: datosActuales.length.toDouble() - 1,
                  minY: valorMinimoPeso -
                      1000, // Resta 1000 para espacio adicional en minY
                  maxY: valorMaximoPeso +
                      1000, // Añade 1000 para espacio adicional en maxY
                  lineBarsData: [
                    // Serie de datos actuales
                    LineChartBarData(
                      spots: datosActuales
                          .asMap()
                          .entries
                          .map(
                            (entry) => FlSpot(
                              entry.key.toDouble(),
                              double.tryParse(entry.value[0].toString()) ?? 0.0,
                            ),
                          )
                          .toList(),
                      isCurved: true,
                      colors: const [Colors.blue],
                      dotData: FlDotData(show: true),
                      belowBarData: BarAreaData(show: false),
                    ),
                    // Serie de datos de comparación
                    if (comparacionActivada)
                      LineChartBarData(
                        spots: datosComparacion
                            .asMap()
                            .entries
                            .map(
                              (entry) => FlSpot(
                                entry.key.toDouble(),
                                double.tryParse(entry.value[0].toString()) ??
                                    0.0,
                              ),
                            )
                            .toList(),
                        isCurved: true,
                        colors: const [Colors.red], // Puedes cambiar el color
                        dotData: FlDotData(show: true),
                        belowBarData: BarAreaData(show: false),
                      ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16), // Espacio entre los gráficos
            Expanded(
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(show: true),
                  titlesData: FlTitlesData(
                    leftTitles: SideTitles(
                      showTitles: true,
                      interval: (valorMaximoEstatura - valorMinimoEstatura),
                    ),
                    rightTitles: SideTitles(showTitles: false),
                    bottomTitles: SideTitles(
                      showTitles: true,
                      interval: (datosActuales.length / 7).ceil().toDouble(),
                      getTitles: (value) {
                        final index = value.round();
                        if (index >= 0 && index < datosActuales.length) {
                          final fechaDato = datosActuales[index][2] as DateTime;
                          int edadEnSemanas = ((fechaDato
                                      .difference(fechaDeNacimiento)
                                      .inDays) /
                                  7)
                              .floor();
                          return '$edadEnSemanas';
                        }
                        return '';
                      },
                    ),
                    topTitles: SideTitles(
                        showTitles: true,
                        interval: datosActuales.length.toDouble() / 2,
                        getTitles: (value) {
                          final index = value.round();
                          if (index == 1) {
                            return '';
                          }
                          if (index > 1) {
                            return 'Estatura (cm) // Edad (semanas)';
                          }
                          return '';
                        }),
                  ),
                  borderData: FlBorderData(
                    show: true,
                    border: Border.all(
                      color: const Color(0xff37434d),
                      width: 1,
                    ),
                  ),
                  minX: 0,
                  maxX: datosActuales.length.toDouble() - 1,
                  minY: valorMinimoEstatura -
                      10, // Resta 1000 para espacio adicional en minY
                  maxY: valorMaximoEstatura +
                      10, // Añade 1000 para espacio adicional en maxY
                  lineBarsData: [
                    LineChartBarData(
                      spots: datosActuales
                          .asMap()
                          .entries
                          .map(
                            (entry) => FlSpot(
                              entry.key.toDouble(),
                              double.tryParse(entry.value[1].toString()) ?? 0.0,
                            ),
                          )
                          .toList(),
                      isCurved: true,
                      colors: const [Colors.blue],
                      dotData: FlDotData(show: true),
                      belowBarData: BarAreaData(show: false),
                    ),
                    if (comparacionActivada)
                      LineChartBarData(
                        spots: datosComparacion
                            .asMap()
                            .entries
                            .map(
                              (entry) => FlSpot(
                                entry.key.toDouble(),
                                double.tryParse(entry.value[1].toString()) ??
                                    0.0,
                              ),
                            )
                            .toList(),
                        isCurved: true,
                        colors: const [Colors.red], // Puedes cambiar el color
                        dotData: FlDotData(show: true),
                        belowBarData: BarAreaData(show: false),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DataSource extends DataTableSource {
  final List<List<dynamic>> _data;

  _DataSource(this._data);

  @override
  DataRow getRow(int index) {
    final formattedDate =
        DateFormat('dd/MM/yyyy').format(_data[index][2] as DateTime);

    return DataRow(cells: [
      // muestra en la primera columna la fecha en formato dd/mm/yyyy
      DataCell(Text(formattedDate)), // Fecha
      DataCell(Text(_data[index][0].toString())), // Peso
      DataCell(Text(_data[index][1].toString())), // Estatura
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _data.length;

  @override
  int get selectedRowCount => 0;
}
