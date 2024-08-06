import 'package:flutter_application_1/template.dart';

import '../models/template.dart';
import 'storage_service.dart';

class TemplateService {
  final StorageService _storageService = StorageService();

  Future<void> saveTemplate(Template template) async {
    await _storageService.saveTemplate({
      'title': template.title,
      'content': template.content,
    });
  }

  Stream<List<Template>> getTemplates() {
    return _storageService.getTemplates().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Template(
          title: doc['title'],
          content: doc['content'],
        );
      }).toList();
    });
  }
}
