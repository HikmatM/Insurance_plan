import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:insurance_plan/data/model/insurance_plan_model.dart';

@RoutePage()
class DetailScreen extends StatelessWidget {
  final InsurancePlanModel? insurancePlan;

  const DetailScreen({super.key, this.insurancePlan});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: insurancePlan != null
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  _DetailRow(
                    description: insurancePlan!.planName,
                    title: 'Plan name:',
                  ),
                  const SizedBox(height: 10),
                  _DetailRow(
                    description: '\$${insurancePlan!.coverageAmount}',
                    title: 'Coverage amount:',
                  ),
                  const SizedBox(height: 10),
                  _DetailRow(
                    description: '\$${insurancePlan!.monthlyPremium}',
                    title: 'Monthly premium:',
                  ),
                  const SizedBox(height: 10),
                  _DetailRow(
                    description: '\$${insurancePlan!.deductible}',
                    title: 'Deductible:',
                  ),
                  _DetailRow(
                    description: insurancePlan!.description,
                    title: 'Description:',
                  )
                ],
              )
            : const _EmptyBox(),
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  final String title;
  final String description;
  const _DetailRow({
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(child: Text(title, style: const TextStyle(fontSize: 14))),
        const SizedBox(height: 5),
        Expanded(
            child: Text(description, style: const TextStyle(fontSize: 14))),
        const Spacer(),
      ],
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
