import 'dart:io';
import 'package:aura/core/theme/app_colors.dart';
import 'package:aura/core/theme/dimensions.dart';
import 'package:aura/features/journal/domain/entities/journal.dart';
import 'package:aura/features/journal/presentation/provider/journals_files_ui_provider.dart';
import 'package:aura/features/journal/presentation/provider/journals_ui_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class EntradaDiarioScreen extends StatefulWidget {
  const EntradaDiarioScreen({super.key});

  @override
  State<EntradaDiarioScreen> createState() => _EntradaDiarioScreenState();
}

class _EntradaDiarioScreenState extends State<EntradaDiarioScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  File? _image;

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  void _saveDiary() async {
    final diarioProvider = Provider.of<DiarioProvider>(context, listen: false);
    final archivoDiarioProvider =
        Provider.of<ArchivoDiarioProvider>(context, listen: false);

    final String title = _titleController.text.trim();
    final String text = _contentController.text.trim();
    int idDiario = 0;

    final diario = Diario(
      idUsuario: 1,
      titulo: title,
      texto: text,
      fecha: '',
    );

    try {
      idDiario = await diarioProvider.addDiario(diario);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.toString())),
        );
      }
    }

    if (_image != null) {
      await archivoDiarioProvider.addArchivoDiario(idDiario, _image!);
    }

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Diario guardado con éxito.")),
      );

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.primaryColor),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.image, color: AppColors.primaryColor),
            onPressed: _pickImage,
          ),
          IconButton(
            icon: Icon(Icons.mic, color: AppColors.primaryColor),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.brightness_2, color: AppColors.primaryColor),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(AppSizes.mediumSpace(context)),
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(AppSizes.mediumSpace(context)),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.primaryColor),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: _titleController,
                      decoration: InputDecoration(
                        hintText: "Título",
                        border: InputBorder.none,
                      ),
                      style: TextStyle(
                        fontSize: AppSizes.largeText(context),
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        DateFormat('dd/MM/yyyy').format(DateTime.now()),
                        style: TextStyle(
                          fontSize: AppSizes.smallText(context),
                          color: AppColors.softRed,
                        ),
                      ),
                    ),
                    SizedBox(height: AppSizes.smallSpace(context)),
                    Expanded(
                      child: TextField(
                        controller: _contentController,
                        maxLines: null,
                        expands: true,
                        decoration: InputDecoration(
                          hintText: "Escribe aquí...",
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                            fontSize: AppSizes.mediumText(context),
                            fontStyle: FontStyle.italic,
                            color: AppColors.textTertiary,
                          ),
                        ),
                      ),
                    ),
                    if (_image != null) Image.file(_image!),
                  ],
                ),
              ),
            ),
            SizedBox(height: AppSizes.smallSpace(context)),
            Consumer<DiarioProvider>(
              builder: (context, diarioProvider, child) {
                return ElevatedButton(
                  onPressed: diarioProvider.isLoading ? null : _saveDiary,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: diarioProvider.isLoading
                      ? CircularProgressIndicator(
                          color: AppColors.white,
                        )
                      : Text(
                          "Guardar Diario",
                          style: TextStyle(
                              color: AppColors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
