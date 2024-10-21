class InsurancePlanModel {
  final String planName;
  final double coverageAmount;
  final double monthlyPremium;
  final double deductible;
  final String description;
  InsurancePlanModel({
    required this.planName,
    required this.coverageAmount,
    required this.monthlyPremium,
    required this.deductible,
    required this.description,
  });
}
