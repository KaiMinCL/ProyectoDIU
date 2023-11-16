import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key});

  @override
  Widget build(BuildContext context) {
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
                          builder: (context) => const IngresoPadreView(),
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
                  // Handle onTap for Paciente 1
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
                  // Handle onTap for Paciente 1
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

class IngresoPadreView extends StatelessWidget {
  const IngresoPadreView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ingreso Padre'),
      ),
      body: const Center(
        child: Text('This is the Ingreso Padre View'),
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

  // Arreglo que contendrá arreglos, donde cada uno de estos arreglos tendrá información de peso, estatura y fecha
  List<List<dynamic>> tabla = [];

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
                  'Fecha: ${selectedDate.toLocal()}'.split(' ')[0],
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
                // Crea un arreglo con los datos ingresados
                var datos = [
                  weightController.text,
                  heightController.text,
                  selectedDate.toLocal()
                ];
                // Agregame el arreglo de datos al arreglo de arreglos
                tabla.add(datos);
                // Imprimeme la tabla
                print(tabla);
                // Revisar que ningun texto este vacio y si lo esta, mostrar un snackbar
                if (weightController.text.isEmpty ||
                    heightController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Por favor ingrese todos los datos',
                      ),
                      //time
                      duration: Duration(seconds: 3),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Dato ingresado correctamente',
                      ),
                      //time
                      duration: Duration(seconds: 3),
                    ),
                  );
                }
                //snackbar que indique que se ingreso el dato
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add,
                    size: 30,
                    color: Colors
                        .white, // Puedes ajustar el color según tus preferencias
                  ),
                  SizedBox(width: 10), // Espacio entre el icono y el texto
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
              onPressed: () {
                // Navegar a la pantalla de GraficoPaciente
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TablaPaciente(tabla),
                  ),
                );
              },
              child: const Text('Continuar'),
            ),
          ],
        ),
      ),
    );
  }
}

class TablaPaciente extends StatelessWidget {
  final List<List<dynamic>> data;

  const TablaPaciente(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
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
              source: _DataSource(data),
              rowsPerPage: 7, // Puedes ajustar la cantidad de filas por página
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GraficoPaciente(data),
                  ),
                );
              },
              child: const Text('Ver Gráfico'),
            ),
          ],
        ),
      ),
    );
  }
}

class GraficoPaciente extends StatelessWidget {
  final List<List<dynamic>> data;

  const GraficoPaciente(this.data);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gráfico del Paciente'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: LineChart(
          LineChartData(
            gridData: FlGridData(show: false),
            titlesData: FlTitlesData(
              leftTitles: SideTitles(showTitles: true),
              bottomTitles: SideTitles(
                showTitles: true,
                getTitles: (value) {
                  final index = value.toInt();
                  if (index >= 0 && index < data.length) {
                    final date =
                        DateFormat('dd/MM').format(data[index][2] as DateTime);
                    return date;
                  }
                  return '';
                },
              ),
            ),
            borderData: FlBorderData(
              show: true,
              border: Border.all(
                color: const Color(0xff37434d),
                width: 1,
              ),
            ),
            minX: 0,
            maxX: data.length.toDouble() - 1,
            minY: 0,
            maxY: 5000, // Ajusta el valor máximo según tus datos
            lineBarsData: [
              LineChartBarData(
                spots: data
                    .asMap()
                    .entries
                    .map(
                      (entry) => FlSpot(
                        entry.key.toDouble(),
                        entry.value[0] as double,
                      ),
                    )
                    .toList(),
                isCurved: true,
                colors: const [Colors.blue],
                dotData: FlDotData(show: false),
                belowBarData: BarAreaData(show: false),
              ),
            ],
          ),
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
