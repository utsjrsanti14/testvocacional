// main.dart - Código completo para 30 preguntas

import 'package:flutter/material.dart';

void main() {
  runApp(const VocationalTestApp());
}

class VocationalTestApp extends StatelessWidget {
  const VocationalTestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test Vocacional de 30 Preguntas',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const VocationalTestScreen(),
    );
  }
}

// Estructura de datos para las preguntas
class Question {
  final String questionText;
  final List<String> options;

  Question({
    required this.questionText,
    required this.options,
  });
}

class VocationalTestScreen extends StatefulWidget {
  const VocationalTestScreen({super.key});

  @override
  State<VocationalTestScreen> createState() => _VocationalTestScreenState();
}

class _VocationalTestScreenState extends State<VocationalTestScreen> {
  int _questionIndex = 0;
  // Mapa para almacenar los puntajes por categoría: A, B, C, D
  Map<String, int> _scores = {'A': 0, 'B': 0, 'C': 0, 'D': 0};

  // --- LISTA COMPLETA DE 30 PREGUNTAS (Ingenierías y Negocios) ---
  final List<Question> _questions = [
    // 1
    Question(
      questionText: '1. Cuando resuelves un problema, ¿qué disfrutas más?',
      options: [
        'A) Idear la forma de presentarlo y vender la solución.',
        'B) Analizar el fallo físico o mecánico de un componente.',
        'C) Optimizar el proceso y la secuencia de pasos para resolverlo.',
        'D) Investigar qué materiales o sustancias son la causa del problema.',
      ],
    ),
    // 2
    Question(
      questionText: '2. ¿Cuál de estos entornos te resulta más atractivo?',
      options: [
        'A) Una oficina de marketing o una agencia de publicidad.',
        'B) Un sitio de construcción o un taller de robótica avanzada.',
        'C) Un centro de datos o una planta de producción organizada.',
        'D) Un laboratorio de química o una granja solar/eólica.',
      ],
    ),
    // 3
    Question(
      questionText: '3. ¿Cómo tomas decisiones importantes?',
      options: [
        'A) Basado en el potencial de crecimiento y las tendencias del mercado.',
        'B) Basado en cálculos de resistencia, diseño y precisión técnica.',
        'C) Basado en la eficiencia, los datos históricos y la reducción de costos.',
        'D) Basado en la evidencia científica, fórmulas y control de calidad.',
      ],
    ),
    // 4
    Question(
      questionText: '4. ¿Qué actividad prefieres en tu tiempo libre?',
      options: [
        'A) Leer sobre startups, finanzas y branding.',
        'B) Desarmar y ensamblar aparatos para entender su mecanismo.',
        'C) Aprender un nuevo lenguaje de programación o cómo funciona una red.',
        'D) Estudiar la composición de un alimento o de un producto de limpieza.',
      ],
    ),
    // 5
    Question(
      questionText: '5. ¿Qué te molesta de un sistema que no funciona?',
      options: [
        'A) Que no logre conectar con su público objetivo.',
        'B) Que haya un componente roto o mal instalado.',
        'C) Que el flujo de trabajo esté desorganizado e ineficiente.',
        'D) Que la composición de los insumos esté desbalanceada.',
      ],
    ),
    // 6
    Question(
      questionText: '6. ¿Qué rol te atrae más en un equipo?',
      options: [
        'A) El estratega que comunica la visión y negocia.',
        'B) El que diseña la estructura o el mecanismo principal.',
        'C) El que gestiona los tiempos y optimiza los recursos.',
        'D) El que asegura la pureza y calidad de los materiales.',
      ],
    ),
    // 7
    Question(
      questionText: '7. ¿Qué te inspira de la tecnología?',
      options: [
        'A) Cómo cambia el comportamiento del consumidor y crea nuevas necesidades.',
        'B) La capacidad de automatizar tareas físicas complejas y repetitivas.',
        'C) La capacidad de manejar enormes volúmenes de datos y la conectividad.',
        'D) La capacidad de generar energía limpia y de crear nuevos materiales.',
      ],
    ),
    // 8
    Question(
      questionText: '8. ¿Cuál de estas asignaturas disfrutaste más?',
      options: [
        'A) Economía y Liderazgo.',
        'B) Física y Cálculo Multivariable.',
        'C) Algoritmos y Bases de Datos.',
        'D) Química Orgánica y Bioquímica.',
      ],
    ),
    // 9
    Question(
      questionText: '9. ¿Qué meta profesional te atrae más?',
      options: [
        'A) Crear y lanzar una marca o producto innovador a nivel global.',
        'B) Diseñar la infraestructura de una ciudad o automatizar una fábrica completa.',
        'C) Liderar la transformación digital o la eficiencia operativa de una gran corporación.',
        'D) Desarrollar un nuevo fármaco o una fuente de energía 100% sostenible.',
      ],
    ),
    // 10
    Question(
      questionText: '10. Si tuvieras que construir una casa, ¿en qué te centrarías?',
      options: [
        'A) En cómo se promocionará y cómo atraerá a sus futuros dueños.',
        'B) En los cimientos, la estructura y la seguridad antisísmica.',
        'C) En la logística de la obra y la gestión eficiente de los contratistas.',
        'D) En los materiales ecológicos y el sistema de calefacción/refrigeración natural.',
      ],
    ),
    // 11
    Question(
      questionText: '11. Tu fuerte es...',
      options: [
        'A) La creatividad, la persuasión y la visión comercial.',
        'B) El razonamiento espacial, la mecánica y la solución de fallas técnicas.',
        'C) La organización, el análisis de datos y la lógica de sistemas.',
        'D) El método científico, la experimentación y el rigor en el laboratorio.',
      ],
    ),
    // 12
    Question(
      questionText: '12. En una simulación de negocios, ¿qué área escogerías?',
      options: [
        'A) Ventas, Publicidad y Branding.',
        'B) Diseño de maquinaria y control de calidad físico.',
        'C) Cadena de suministro y Planificación de Recursos (ERP).',
        'D) Investigación y Desarrollo (R&D) de nuevos productos.',
      ],
    ),
    // 13
    Question(
      questionText: '13. Te frustra que la gente...',
      options: [
        'A) No entienda el valor o la promesa de un producto.',
        'B) No respete las especificaciones técnicas o los planos.',
        'C) No siga el protocolo o genere cuellos de botella en el proceso.',
        'D) No use la metodología científica o ignore los resultados de pruebas.',
      ],
    ),
    // 14
    Question(
      questionText: '14. ¿Qué te gustaría aprender a hacer?',
      options: [
        'A) Analizar métricas de campañas digitales (SEO/SEM).',
        'B) Programar un brazo robótico o un PLC industrial.',
        'C) Administrar una red de servidores y protegerla de ciberataques.',
        'D) Realizar la síntesis de un nuevo compuesto químico.',
      ],
    ),
    // 15
    Question(
      questionText: '15. ¿Cuál es la cualidad que más valoras en un proyecto?',
      options: [
        'A) Que sea **disruptivo** y cambie la forma en que la gente interactúa.',
        'B) Que sea **sólido** y resuelva un problema de infraestructura duradero.',
        'C) Que sea **eficiente** y maximice la productividad con el mínimo recurso.',
        'D) Que sea **limpio** y tenga un impacto positivo en el medio ambiente.',
      ],
    ),
    // 16
    Question(
      questionText: '16. Si trabajas con máquinas, ¿prefieres?',
      options: [
        'A) Entender cómo mejorar su presentación comercial.',
        'B) Entender su motor, engranajes y sistema de control.',
        'C) Entender el flujo de trabajo que la máquina soporta.',
        'D) Entender los fluidos o sustancias que utiliza para funcionar.',
      ],
    ),
    // 17
    Question(
      questionText: '17. ¿Qué tipo de libros o documentales ves?',
      options: [
        'A) Éxitos empresariales, psicología del consumo.',
        'B) Ingeniería de puentes, robótica avanzada, historia de la aviación.',
        'C) Ciberseguridad, Big Data, teoría de sistemas.',
        'D) Avances en medicina, energía nuclear o química de materiales.',
      ],
    ),
    // 18
    Question(
      questionText: '18. ¿Cómo te relacionas con los números?',
      options: [
        'A) Los utilizo para definir precios y analizar el retorno de inversión (ROI).',
        'B) Los utilizo para calcular fuerzas, pesos y dimensiones.',
        'C) Los utilizo para medir la eficiencia y la productividad.',
        'D) Los utilizo para formular soluciones y mantener el balance químico.',
      ],
    ),
    // 19
    Question(
      questionText: '19. ¿Te sientes cómodo liderando?',
      options: [
        'A) Sí, disfruto inspirando y dirigiendo equipos creativos o de ventas.',
        'B) Sí, disfruto supervisando la ejecución de un diseño técnico complejo.',
        'C) Sí, disfruto coordinando y asegurando que todos sigan el mismo sistema.',
        'D) Sí, disfruto liderando la fase de experimentación y prueba de laboratorio.',
      ],
    ),
    // 20
    Question(
      questionText: '20. Un desafío logístico te parece...',
      options: [
        'A) Una oportunidad para crear una nueva forma de distribución.',
        'B) Un problema de diseño de rutas y vehículos que debe ser optimizado.',
        'C) Un problema de gestión de inventarios y cadena de suministro.',
        'D) Un problema de manejo seguro de materiales o sustancias peligrosas.',
      ],
    ),
    // 21
    Question(
      questionText: '21. ¿Qué herramienta te gustaría dominar?',
      options: [
        'A) Software de diseño gráfico y edición de video (suite Adobe).',
        'B) Programas de diseño asistido (CAD o SolidWorks).',
        'C) Lenguajes de programación (Python, Dart/Flutter o Java).',
        'D) Instrumentos de medición de laboratorio (espectrofotómetros, tituladores).',
      ],
    ),
    // 22
    Question(
      questionText: '22. ¿Qué sector de la industria te atrae más?',
      options: [
        'A) El de la moda, el entretenimiento o el comercio electrónico.',
        'B) La industria automotriz, la construcción pesada o la minería.',
        'C) La banca, las telecomunicaciones o la consultoría de procesos.',
        'D) La farmacéutica, la alimentaria o la generación de energía.',
      ],
    ),
    // 23
    Question(
      questionText: '23. Si te dan un presupuesto, ¿qué priorizas?',
      options: [
        'A) Inversión en publicidad y generación de contenido de valor.',
        'B) Inversión en equipos y maquinaria de precisión.',
        'C) Inversión en software de gestión y capacitación de personal.',
        'D) Inversión en investigación, pruebas de calidad y certificaciones.',
      ],
    ),
    // 24
    Question(
      questionText: '24. ¿Cuál es tu reacción ante un fracaso?',
      options: [
        'A) Analizo qué falló en el mensaje o en la estrategia de posicionamiento.',
        'B) Analizo la resistencia de los materiales o el fallo en el diseño físico.',
        'C) Analizo los datos para encontrar el *punto débil* del sistema o proceso.',
        'D) Analizo la fórmula o la reacción para eliminar contaminantes o impurezas.',
      ],
    ),
    // 25
    Question(
      questionText: '25. ¿Qué tipo de matemáticas prefieres?',
      options: [
        'A) Estadística aplicada a la demografía y las encuestas.',
        'B) Geometría, trigonometría y álgebra lineal.',
        'C) Lógica booleana y matemáticas discretas.',
        'D) Cálculo diferencial/integral aplicado a procesos termodinámicos.',
      ],
    ),
    // 26
    Question(
      questionText: '26. ¿Te atrae la idea de viajar constantemente por trabajo?',
      options: [
        'A) Sí, para abrir nuevos mercados y conocer clientes.',
        'B) Sí, para supervisar obras o dar mantenimiento a maquinaria pesada.',
        'C) No necesariamente, prefiero gestionar y optimizar desde una central.',
        'D) No necesariamente, prefiero enfocarme en el trabajo de laboratorio o planta.',
      ],
    ),
    // 27
    Question(
      questionText: '27. ¿Qué problema mundial te gustaría ayudar a resolver?',
      options: [
        'A) La falta de educación financiera y acceso a herramientas de negocio.',
        'B) La necesidad de crear infraestructura resistente en zonas de riesgo sísmico.',
        'C) La gestión ineficiente de los recursos y el desperdicio en las cadenas de producción.',
        'D) El cambio climático y la dependencia de los combustibles fósiles.',
      ],
    ),
    // 28
    Question(
      questionText: '28. ¿Qué buscas al aprender algo nuevo?',
      options: [
        'A) Su aplicabilidad inmediata para generar ingresos.',
        'B) Su utilidad para construir o arreglar algo tangible.',
        'C) Su potencial para mejorar mi capacidad de organización y gestión.',
        'D) Su fundamento científico y su impacto a largo plazo.',
      ],
    ),
    // 29
    Question(
      questionText: '29. ¿Cómo manejas la información?',
      options: [
        'A) La sintetizo en mensajes clave para influir en otros.',
        'B) La convierto en planos, modelos 3D y especificaciones técnicas.',
        'C) La organizo en bases de datos y la visualizo en *dashboards*.',
        'D) La analizo para determinar causas y efectos a nivel molecular.',
      ],
    ),
    // 30
    Question(
      questionText: '30. ¿Cuál es el factor más importante para el éxito?',
      options: [
        'A) El conocimiento profundo del mercado y el cliente.',
        'B) La calidad del diseño y la ingeniería de los sistemas.',
        'C) La eficiencia de la operación y el control de los procesos.',
        'D) La innovación científica y el respeto por los principios naturales.',
      ],
    ),
  ];

  // Lógica para asignar el puntaje y procesar la respuesta
  void _answerQuestion(String selectedOption) {
    // La primera letra de la opción (A, B, C, D) es la categoría
    final category = selectedOption.substring(0, 1);
    
    // Asignación de puntaje según la regla: A=4, B=3, C=2, D=1
    int score = 0;
    if (category == 'A') score = 4;
    else if (category == 'B') score = 3;
    else if (category == 'C') score = 2;
    else if (category == 'D') score = 1;

    // Suma el puntaje a la categoría
    _scores[category] = (_scores[category] ?? 0) + score; 

    // Pasa a la siguiente pregunta
    setState(() {
      _questionIndex++;
    });
  }

  // Widget que se muestra al finalizar el test (Resultados)
  Widget _buildResultScreen() {
    // Encuentra la categoría con el puntaje más alto
    final topEntry = _scores.entries.reduce((a, b) => a.value > b.value ? a : b);
    final topCategory = topEntry.key;
    final topScore = topEntry.value;

    String recommendation = '';
    
    if (topCategory == 'A') {
      recommendation = 'Tu enfoque principal es la **Innovación, Estrategia y Mercado**. Tu carrera sugerida es la **Licenciatura en Innovación de Negocios y Mercadotecnia**.';
    } else if (topCategory == 'B') {
      recommendation = 'Tu enfoque principal es la **Mecánica, Estructura y Automatización**. Tus carreras sugeridas son **Ingeniería Civil, Ingeniería en Mantenimiento Industrial, e Ingeniería en Mecatrónica**.';
    } else if (topCategory == 'C') {
      recommendation = 'Tu enfoque principal es la **Gestión de Procesos, Eficiencia y Sistemas Lógicos**. Tus carreras sugeridas son **Ingeniería en Sistemas Productivos (Industrial) e Ingeniería en Tecnologías de la Información y Comunicación (TIC)**.';
    } else if (topCategory == 'D') {
      recommendation = 'Tu enfoque principal es la **Ciencia, Investigación y Sostenibilidad**. Tus carreras sugeridas son **Ingeniería Química, Ingeniería Química Farmacéutica, e Ingeniería en Energías Renovables**.';
    }

    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                '¡Test Vocacional Finalizado! 🎉',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.blueGrey),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              const Text(
                'Resumen de Puntuaciones:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 10),
              ..._scores.entries.map((entry) {
                return Text('Categoría ${entry.key}: ${entry.value} puntos', style: const TextStyle(fontSize: 16));
              }).toList(),
              const Divider(height: 30),
              const Text(
                'Recomendación Principal:',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.indigo),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 15),
              Text(
                recommendation,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _questionIndex = 0;
                    _scores = {'A': 0, 'B': 0, 'C': 0, 'D': 0};
                  });
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                child: const Text('Reiniciar Test', style: TextStyle(fontSize: 18)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget para mostrar una pregunta
  Widget _buildQuestion(Question question) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            question.questionText,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
        const Divider(),
        Expanded(
          child: ListView.builder(
            itemCount: question.options.length,
            itemBuilder: (context, index) {
              final option = question.options[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: ElevatedButton(
                  onPressed: () => _answerQuestion(option),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey.shade100,
                    foregroundColor: Colors.blueGrey.shade800,
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(option, textAlign: TextAlign.start, style: const TextStyle(fontSize: 16)),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pregunta ${_questionIndex + 1} de ${_questions.length}'),
        backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.white,
      ),
      body: _questionIndex < _questions.length
          ? _buildQuestion(_questions[_questionIndex])
          : _buildResultScreen(),
    );
  }
}