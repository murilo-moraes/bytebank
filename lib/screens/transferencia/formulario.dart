import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';

const _tituloAppBar = 'Criando Transferência';

class FormularioTransferencia extends StatelessWidget {
  FormularioTransferencia({Key? key}) : super(key: key);

  final TextEditingController _controladorNumeroConta = TextEditingController();
  final TextEditingController _controladorValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Editor(
                _controladorNumeroConta,
                labelText: 'Número da conta',
                hintText: '00000-0',
                icon: Icons.person,
              ),
              Editor(
                _controladorValor,
                labelText: 'Valor',
                hintText: '0.00',
                icon: Icons.monetization_on,
              ),
              Container(
                margin: const EdgeInsets.only(top: 16.0),
                child: ElevatedButton(
                  onPressed: () => _criarTransferencia(context),
                  child: const Text('Salvar'),
                ),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: const Text(_tituloAppBar),
      ),
    );
  }

  void _criarTransferencia(BuildContext context) {
    debugPrint("Número da Conta: ${_controladorNumeroConta.text}");
    debugPrint("Valor: ${_controladorValor.text}");

    final numeroConta = _controladorNumeroConta.text;
    final valor = double.tryParse(_controladorValor.text) ?? 0;

    if (numeroConta.isNotEmpty && valor > 0) {
      final transferenciaCriada = Transferencia(numeroConta, valor);
      debugPrint(transferenciaCriada.toString());
      Navigator.pop(context, transferenciaCriada);
    }
  }
}
