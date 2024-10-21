import "package:injectable/injectable.dart";
import 'package:insurance_plan/data/model/insurance_plan_model.dart';
import 'package:insurance_plan/data/repository/base_insurance_repository.dart';

@Injectable(as: BaseInsuranceRepository)
class InsuranceRepository implements BaseInsuranceRepository {
  @override
  Future<List<InsurancePlanModel>> getInsuranceList() async {
    final listInsuranceModel = [
      InsurancePlanModel(
        planName: 'Basic Home Insurance',
        coverageAmount: 100000,
        monthlyPremium: 50,
        deductible: 500,
        description: 'Covers basic home damages and liabilities.',
      ),
      InsurancePlanModel(
        planName: 'Comprehensive Home Insurance',
        coverageAmount: 250000,
        monthlyPremium: 120,
        deductible: 1000,
        description:
            'Covers all types of home damages including natural disasters.',
      ),
      InsurancePlanModel(
        planName: 'Luxury Home Insurance',
        coverageAmount: 500000,
        monthlyPremium: 200,
        deductible: 1500,
        description: 'Provides extensive coverage for high-value properties.',
      ),
      InsurancePlanModel(
        planName: 'Renters Insurance',
        coverageAmount: 30000,
        monthlyPremium: 30,
        deductible: 300,
        description: 'Covers personal belongings in a rented property.',
      ),
      InsurancePlanModel(
        planName: 'Landlord Insurance',
        coverageAmount: 200000,
        monthlyPremium: 80,
        deductible: 700,
        description: 'Covers properties rented out to tenants.',
      ),
    ];

    return List.from(listInsuranceModel);
  }
}
