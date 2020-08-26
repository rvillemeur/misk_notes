"Cet exemple est complet et correct dans les résultats au 6 janvier 2020"

|startDate endDate duration initDate payDate
initCapital capital nominalInterest period effectiveInterest monthlyInterest monthlyPayment biWeeklyPaiement|

initCapital := 298350.
capital := initCapital.
nominalInterest := 1.14 percent.
period := 25 * 12.

"rate is compounded every 6 month. convert rate to monthly rate."
effectiveInterest := (((1 + (nominalInterest /2) raisedTo: 2)) - 1) round: 8.

"get effective monthly interest"
monthlyInterest := (((1 + effectiveInterest ) raisedTo: (1/12)) -1) round: 8.

"get monthly and bi-weekly payment"
monthlyPayment := (capital * monthlyInterest) / (1 - (( 1 + monthlyInterest )raisedTo: (period negated))) round: 2.

biWeeklyPaiement := monthlyPayment /2.

"display amortissement table"
Transcript clear.

duration := 14 days.
startDate := '4/11/2014' asDateAndTime.
endDate := startDate + 2 years .
initDate := startDate.

(startDate + duration) to: endDate by: duration do: [ :date |
	|dcf  biWeeklyInterest interest repayment| 
	
	dcf := AgDCFActual365Fixed startDate: initDate endDate: date.
	
	biWeeklyInterest := (((1 + effectiveInterest ) raisedTo: (dcf dayCountFraction)) -1) round: 10.

	interest := (capital * biWeeklyInterest) round: 2.
	repayment := (biWeeklyPaiement - interest) round: 2.
	capital := capital - repayment round:2.
	initDate := date.

	Transcript log: date asDate.
	Transcript log: ' | '.
	Transcript log: repayment.
	Transcript log: ' | '.
	Transcript log: interest.
	Transcript log: ' | '.
	Transcript log: capital; cr.
	
 ]






