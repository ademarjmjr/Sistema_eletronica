import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'Cadastro_Cliente.dart';

Future<void> main() async {
  // 1. Garante a inicialização dos Widgets
  WidgetsFlutterBinding.ensureInitialized();

  // 2. Inicializa o Supabase (Suas chaves já estão aqui)
  await Supabase.initialize(
    url: 'https://whbilkbtimhdvivluysv.supabase.co',
    anonKey: 'sb_publishable_eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6IndoYmlsa2J0aW1oZHZpdmx1eXN2Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDM2OTIxOTcsImV4cCI6MjA1OTI2ODE5N30.rZAYGHP6diovu-yS0mpw_A-gQ105V', 
  );

  runApp(const MyApp());
}

// Atalho para usar o banco em qualquer tela
final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sistema Eletrônica',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const CadastroCliente(),
      /*home: const Scaffold(
        body: Center(child: Text('Conectado ao Supabase!')),
      ),*/
    );
  }
}