import 'package:sample/models/transactions/transaction_model.dart';
import 'package:sample/totalexp/total_expense.dart';

class ExpenseData {

  List<TransactionModel> overallExpenseList = [];

  Map<String, double> calculateDAilyExpenseSummary() {
    Map<String, double> dailyExpenseSummary = {};

    for(var expense in overallExpenseList){
      String newdate = convertDateTimeToString(expense.date);
      double newamount = double.parse(expense.amount as String);
      if(dailyExpenseSummary.containsKey(newdate)){
        double currentAmount = dailyExpenseSummary[newdate]!;
        currentAmount += newamount;
        dailyExpenseSummary[newdate] = currentAmount;
      }
      else{
        dailyExpenseSummary.addAll({newdate : newamount});
      }
    }

    return dailyExpenseSummary;
  }
}