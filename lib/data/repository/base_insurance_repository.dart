import 'package:insurance_plan/data/model/insurance_plan_model.dart';

abstract interface class BaseInsuranceRepository {
  Future<List<InsurancePlanModel>> getInsuranceList();
}
