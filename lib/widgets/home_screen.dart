import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:insurance_plan/data/model/insurance_plan_model.dart';
import 'package:insurance_plan/data/repository/base_insurance_repository.dart';
import 'package:insurance_plan/router/app_router.gr.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final insuranceRepo = GetIt.instance<BaseInsuranceRepository>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<InsurancePlanModel>>(
        future: insuranceRepo.getInsuranceList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator.adaptive());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            List<InsurancePlanModel> listInsurancePlan = snapshot.data!;
            return ListView.separated(
              itemCount: listInsurancePlan.length,
              separatorBuilder: (context, index) => const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Divider(height: 1)),
              itemBuilder: (context, index) {
                InsurancePlanModel insurancePlan = listInsurancePlan[index];
                return ListTile(
                  title: Text(
                    insurancePlan.planName,
                    style: const TextStyle(
                        fontSize: 14.0, fontWeight: FontWeight.w800),
                  ),
                  subtitle: Text('\$${insurancePlan.monthlyPremium} / month'),
                  trailing: Text(
                    '\$${insurancePlan.coverageAmount} ',
                    style: const TextStyle(
                        fontSize: 14.0, fontWeight: FontWeight.w600),
                  ),
                  onTap: () {
                    context.router
                        .navigate(DetailRoute(insurancePlan: insurancePlan));
                  },
                );
              },
            );
          } else {
            return const _EmptyBox(); // Custom widget for empty state
          }
        },
      ),
    );
  }
}

class _EmptyBox extends StatelessWidget {
  const _EmptyBox();

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Data not found'));
  }
}
