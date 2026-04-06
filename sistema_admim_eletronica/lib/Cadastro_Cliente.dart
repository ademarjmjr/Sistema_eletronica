import 'package:flutter/material.dart';
import 'main.dart'; 

class CadastroCliente extends StatefulWidget {
  const CadastroCliente({super.key});

  @override
  State<CadastroCliente> createState() => _CadastroClienteState();
}

class _CadastroClienteState extends State<CadastroCliente> {
  final _nomeController = TextEditingController();
  final _zapController = TextEditingController();
  final _docController = TextEditingController(); // Controlador para CPF/CNPJ

  Future<void> _salvarCliente() async {
  try {
    print('Tentando salvar...');
    final response = await supabase.from('clientes').insert({
      'nome': _nomeController.text,
      'whatsapp': _zapController.text,
      'documento': _docController.text,
    }).select(); // O .select() ajuda a confirmar se o dado voltou

    print('Resposta do banco: $response');
    
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Sucesso!'), backgroundColor: Colors.green),
      );
    }
  } catch (e) {
    // ESTA LINHA É A MAIS IMPORTANTE:
    print('ERRO TÉCNICO DETALHADO: $e'); 
    
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro: $e'), backgroundColor: Colors.red),
      );
    }
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Novo Cliente')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView( // Evita erro de teclado cobrindo a tela
          child: Column(
            children: [
              TextField(
                controller: _nomeController, 
                decoration: const InputDecoration(labelText: 'Nome do Cliente', border: OutlineInputBorder()),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: _zapController, 
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(labelText: 'WhatsApp', border: OutlineInputBorder()),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: _docController, 
                decoration: const InputDecoration(labelText: 'CPF ou CNPJ', border: OutlineInputBorder()),
              ),
              const SizedBox(height: 25),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _salvarCliente,
                  child: const Text('Salvar Cliente'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}