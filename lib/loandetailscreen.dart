import 'package:bls_user_flutter/proposalscreen.dart';
import 'package:flutter/material.dart';

class LoanDetailScreen extends StatefulWidget {
  const LoanDetailScreen({super.key});

  @override
  State<LoanDetailScreen> createState() => _LoanDetailScreenState();
}

class _LoanDetailScreenState extends State<LoanDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          _buildTopCard(),

          _buildDetailsCard(),
          _buildActionButtons(),
        ],
      ),
    );
  }

  Widget _buildDetailsCard() {
    return Card(
      margin: const EdgeInsets.all(8.0),
      color: Colors.white,
      surfaceTintColor: Colors.white,
// White background color for the card
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDetailRow("Loan Amount", "₹50000"),
            _buildDetailRow("Disbursed Amount", "₹6764"),
            _buildDetailRow("Disbursement Amount", "₹50"),
            _buildDetailRow("Tranche No", "5"),
            _buildDetailRow("Sanction Date", "02-05-2024"),
            _buildDetailRow("EMI Amount", "₹224"),
            _buildDetailRow("Next EMI Date", "02-05-2024", isHighlighted: true),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value, {bool isHighlighted = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontSize: 14)),
          Text(
            value,
            style: TextStyle(
              fontSize: 14,
              color: isHighlighted ? Colors.red : Colors.black,
              fontWeight: isHighlighted ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildActionButtons() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: _buildCustomCardButton(
                  title: 'Proposal',
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const ProposalScreen()),
                    );
                  },
                ),
              ),
              Expanded(
                child: _buildCustomCardButton(
                  title: 'Repayment ',
                  onTap: () {
                    // Action for Repayment Schedule button
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: _buildCustomCardButton(
                  title: 'Payment History',
                  onTap: () {
                    // Action for Payment History button
                  },
                ),
              ),
              Expanded(
                child: _buildCustomCardButton(
                  title: 'Pay EMI',
                  onTap: () {
                    // Action for Pay EMI button
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCustomCardButton({required String title, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 3,
        color: Colors.white,
        surfaceTintColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Text(
            textAlign: TextAlign.center,
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.black54,
            ),
          ),
        ),
      ),
    );
  }


  Widget _buildTopCard() {
    return  SizedBox(
      height: 200,
      width: double.infinity,
      child: Stack(
        children: [Image.asset(
          'assets/images/loan.png',
          width: double.infinity,
          fit: BoxFit.fill,
        ),
          const Padding(
            padding: EdgeInsets.only(top: 130,left: 20),
            child: Text('Loan Detail',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w400),),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 50,left: 20),
            child: Icon(Icons.arrow_back),
          )
        ]
      ),
    );
  }

}

