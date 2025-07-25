import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/app_export.dart';
import '../../../core/utils/navigator_service.dart';
import '../models/report_add_model.dart';

class ReportAddProvider extends ChangeNotifier {
  ReportAddModel _reportModel = ReportAddModel();
  final QuillController _quillController = QuillController.basic();
  final TextEditingController _locationController = TextEditingController();
  final ImagePicker _imagePicker = ImagePicker();

  ReportAddModel get reportModel => _reportModel;
  QuillController get quillController => _quillController;
  TextEditingController get locationController => _locationController;

  void initialize() {
    _reportModel = ReportAddModel();
    _locationController.clear();
    _quillController.clear();

    // Add listener to update description when text changes
    _quillController.addListener(updateDescription);
  }

  void selectIncidentType(IncidentType type) {
    _reportModel.selectedIncidentType = type;
    notifyListeners();
  }

  void updateLocation(String location) {
    _reportModel.location = location;
    _locationController.text = location;
    notifyListeners();
  }

  void updateDescription() {
    _reportModel.description = _quillController.document.toPlainText();
    notifyListeners();
  }

  Future<void> pickImage() async {
    try {
      final XFile? image = await _imagePicker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 1080,
        maxHeight: 1080,
        imageQuality: 85,
      );

      if (image != null) {
        _reportModel.photoPaths!.add(image.path);
        notifyListeners();
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }

  Future<void> pickMultipleImages() async {
    try {
      final List<XFile> images = await _imagePicker.pickMultiImage(
        maxWidth: 1080,
        maxHeight: 1080,
        imageQuality: 85,
      );

      if (images.isNotEmpty) {
        for (XFile image in images) {
          _reportModel.photoPaths!.add(image.path);
        }
        notifyListeners();
      }
    } catch (e) {
      print('Error picking multiple images: $e');
    }
  }

  void removePhoto(int index) {
    if (index >= 0 && index < _reportModel.photoPaths!.length) {
      _reportModel.photoPaths!.removeAt(index);
      notifyListeners();
    }
  }

  Future<void> submitReport() async {
    if (!_reportModel.isFormValid) {
      return;
    }

    _reportModel.isSubmitting = true;
    notifyListeners();

    try {
      // Update description from quill controller
      updateDescription();

      // TODO: Implement actual API call here
      await Future.delayed(const Duration(seconds: 2)); // Simulate API call

      print('Report submitted successfully');
      print('Incident Type: ${_reportModel.selectedIncidentType}');
      print('Location: ${_reportModel.location}');
      print('Description: ${_reportModel.description}');
      print('Photos: ${_reportModel.photoPaths?.length ?? 0} photos');

      // Navigate back or show success message
      NavigatorService.goBack();
    } catch (e) {
      print('Error submitting report: $e');
    } finally {
      _reportModel.isSubmitting = false;
      notifyListeners();
    }
  }

  void cancelReport() {
    NavigatorService.goBack();
  }

  @override
  void dispose() {
    _quillController.removeListener(updateDescription);
    _locationController.dispose();
    _quillController.dispose();
    super.dispose();
  }
}
