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
    final nome = _nomeController.text.trim();
    final zap = _zapController.text.trim();
    final doc = _docController.text.trim();

    if (nome.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('O nome é obrigatório!')),
      );
      return;
    }

    try {
      // Inserindo no Supabase com o nome da coluna 'documento'
      await supabase.from('clientes').insert({
        'nome': nome,
        'whatsapp': zap,
        'documento': doc, 
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Cliente cadastrado com sucesso!'), backgroundColor: Colors.green),
        );
        _nomeController.clear();
        _zapController.clear();
        _docController.clear();
      }
    } catch (e) {
      // Se der erro, ele vai mostrar aqui no console do VS Code
      print('Erro detalhado: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro ao salvar: Verifique a conexão ou a tabela.'), backgroundColor: Colors.red),
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