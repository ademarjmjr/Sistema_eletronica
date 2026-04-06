import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'cadastro_cliente.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://whbilkbtimhdvivluysv.supabase.co', // Verifique o 's' em supabase
    anonKey: 'sb_publishable_eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6IndoYmlsa2J0aW1oZHZpdmx1eXN2Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDM2OTIxOTcsImV4cCI6MjA1OTI2ODE5N30.rZAYGHP6diovu-yS0mpw_A-gQ105V',
  );

  runApp(const MyApp());
}

final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sistema Eletrônica',
      theme: ThemeData(useMaterial3: true, primarySwatch: Colors.blue),
      home: const CadastroCliente(),
    );
  }
}