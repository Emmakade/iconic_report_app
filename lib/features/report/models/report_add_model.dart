/// This class is used in the [ReportCreationDashboard] screen.
library;

enum IncidentType {
  dumpedRubbish,
  graffitiVandalism,
  pedestrianHazard,
  trafficIssue,
  other,
}

class ReportAddModel {
  IncidentType? selectedIncidentType;
  String? location;
  String? description;
  List<String>? photoPaths;
  bool isSubmitting;

  ReportAddModel({
    this.selectedIncidentType,
    this.location,
    this.description,
    this.photoPaths,
    this.isSubmitting = false,
  }) {
    location = location ?? '';
    description = description ?? '';
    photoPaths = photoPaths ?? [];
  }

  String getIncidentTypeDisplayName(IncidentType type) {
    switch (type) {
      case IncidentType.dumpedRubbish:
        return 'Dumped Rubbish';
      case IncidentType.graffitiVandalism:
        return 'Graffiti or Vandalism';
      case IncidentType.pedestrianHazard:
        return 'Pedestrian Hazard';
      case IncidentType.trafficIssue:
        return 'Traffic Issue';
      case IncidentType.other:
        return 'Other';
    }
  }

  bool get isFormValid {
    return selectedIncidentType != null &&
        location!.trim().isNotEmpty &&
        description!.trim().isNotEmpty;
  }
}
