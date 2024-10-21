// insurance_repo_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:insurance_plan/data/model/insurance_plan_model.dart';
import 'package:insurance_plan/data/repository/insurance_repository.dart';

void main() {
  group('InsuranceRepository', () {
    late InsuranceRepository insuranceRepo;

    setUp(() {
      insuranceRepo = InsuranceRepository();
    });

    test('getInsuranceList should return a list of insurance plans', () async {
      final plans = await insuranceRepo.getInsuranceList();

      expect(plans, isA<List<InsurancePlanModel>>());
      expect(plans.length, equals(5));
    });

    test('getInsuranceList should return correct plan details', () async {
      final plans = await insuranceRepo.getInsuranceList();

      expect(plans[0].planName, equals('Basic Home Insurance'));
      expect(plans[1].coverageAmount, equals(250000.0));
      expect(plans[2].monthlyPremium, equals(200.0));
    });
  });
}
