import 'package:flutter/material.dart';

class StepperScreen extends StatefulWidget {
  const StepperScreen({super.key});

  @override
  State<StepperScreen> createState() => _StepperScreenState();
}

class _StepperScreenState extends State<StepperScreen> {
  int _currentStep = 0;

  continueStep() {
    if (_currentStep < 4) {
      setState(() {
        _currentStep = _currentStep + 1;
      });
    }
  }

  cancelStep() {
    if (_currentStep > 0) {
      setState(() {
        _currentStep = _currentStep - 1;
      });
    }
  }

  onStepTapped(int step) {
    setState(() {
      _currentStep = step;
    });
  }

  Widget controlsBuilder(context, ControlsDetails details) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              elevation: 0.5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
            ),
            onPressed: details.onStepCancel,
            child: const Text(
              'Back',
              style: TextStyle(
                fontSize: 16,
                color: Colors.purple,
              ),
            ),
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 0.5,
              backgroundColor: Theme.of(context).colorScheme.primary,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
            ),
            onPressed: details.onStepContinue,
            child: const Text(
              'Continue',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stepper'),
      ),
      body: Stepper(
        physics: const BouncingScrollPhysics(),
        elevation: 0.3,
        type: StepperType.horizontal,
        currentStep: _currentStep,
        onStepContinue: continueStep,
        onStepCancel: cancelStep,
        onStepTapped: onStepTapped,
        controlsBuilder: controlsBuilder,
        steps: [
          Step(
            title: const SizedBox.shrink(),
            content: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
            isActive: _currentStep >= 0,
            state: _currentStep >= 0 ? StepState.complete : StepState.disabled,
          ),
          Step(
            title: const SizedBox.shrink(),
            content: const Text('Content for Step 2'),
            isActive: _currentStep >= 1,
            state: _currentStep >= 1 ? StepState.complete : StepState.disabled,
          ),
          Step(
            title: const SizedBox.shrink(),
            content: const Text('Content for Step 3'),
            isActive: _currentStep >= 2,
            state: _currentStep >= 2 ? StepState.complete : StepState.disabled,
          ),
          Step(
            title: const SizedBox.shrink(),
            content: const Text('Content for Step 4'),
            isActive: _currentStep >= 3,
            state: _currentStep >= 3 ? StepState.complete : StepState.disabled,
          ),
          Step(
            title: const SizedBox.shrink(),
            content: const Text('Content for Step 5'),
            isActive: _currentStep >= 4,
            state: _currentStep >= 4 ? StepState.complete : StepState.disabled,
          ),
        ],
      ),
    );
  }
}
