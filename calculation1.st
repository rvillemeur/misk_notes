"Cet exemple est complet et correct dans les résultats au 6 janvier 2020"
"According to the Canada Interest Act, the effective rate charged can not be greater than that which results from semi-annual compounding of the annual percentage rate - section 6 and 7 of https://laws-lois.justice.gc.ca/eng/acts/i-15/index.html
The amount of the principal money and the rate of interest chargeable on that money, calculated yearly or half-yearly. No
interest shall be chargeable, payable or recoverable, on the principal money advanced, than the rate shown in the statement.
As half-yearly compounded interest is greater than yearly, financial institution always use half yearly compounded interest rate."


|startDate endDate duration initDate payDate
initCapital balance nominalInterest period effectiveInterest monthlyInterest monthlyPayment biWeeklyPaiement|

initCapital := 200000.
balance := initCapital.
nominalInterest := 2 percent.
period := 274.

"rate is compounded every 6 month. convert rate to monthly rate."
effectiveInterest := (((1 + (nominalInterest /2) raisedTo: 2)) - 1) round: 8.

"get effective monthly interest"
monthlyInterest := (((1 + effectiveInterest ) raisedTo: (1/12)) -1) round: 8.

"get monthly and bi-weekly payment"
monthlyPayment := (initCapital * monthlyInterest) / (1 - (( 1 + monthlyInterest )raisedTo: (period negated))) round: 2.

biWeeklyPaiement := monthlyPayment /2.

"display amortissement table"
Transcript clear.

duration := 14 days.
startDate := '4/8/2016' asDateAndTime.
endDate := startDate + 3 years .
initDate := startDate.

(startDate + duration) to: endDate by: duration do: [ :date |
	|dcf  biWeeklyInterest interest capital| 
	
	dcf := AgDCFActual365Fixed startDate: initDate endDate: date.
	
	biWeeklyInterest := (((1 + effectiveInterest ) raisedTo: (dcf dayCountFraction)) -1) round: 10.

	interest := (balance * biWeeklyInterest) round: 2.
	capital := (biWeeklyPaiement - interest) round: 2.
	balance := balance - capital round: 2.
	initDate := date.

	Transcript log: date asDate.
	Transcript log: ' | '.
	Transcript log: (capital round:2).
	Transcript log: ' | '.
	Transcript log: (interest round:2).
	Transcript log: ' | '.
	Transcript log: (balance round: 2); cr.
	
 ]






