/*******************************************************************************

						ECON4003 EMPIRICAL EXERCISE 3.1

*******************************************************************************/
*	NOTES: 
*	var = variable; yvar = dependent variable; xvar = regressor; 
* 	newvar = new variable; exp = expression
*******************************************************************************/

/*-----------------------------------------------------------------------------
	PREAMBLE
------------------------------------------------------------------------------*/

cd "/Users/duongtrinh/Dropbox/GLASGOW/GTA/ECON4003/Lab Sessions/W6_Empirical Exercise 3.1"

log using "EE3.1.smcl", replace	// Start a log files
use "cps5_small.dta", clear		// open data in Stata; cps5_small is a dataset


/*-----------------------------------------------------------------------------
	Question (a)
------------------------------------------------------------------------------*/
* twoway scatter yvar xvar
* corr xvar yvar
* corr xvar yvar, cov

twoway scatter wage educ
corr wage educ, cov
corr wage educ


/*-----------------------------------------------------------------------------
	Question (b)
------------------------------------------------------------------------------*/
* sum var, detail
* hist var

sum wage, detail
sum educ, detail

hist wage
hist educ


/*-----------------------------------------------------------------------------
	Question (c)
------------------------------------------------------------------------------*/
* reg yvar xvar
* twoway (scatter yvar xvar) (lfit yvar xvar)

regress wage educ
twoway (scatter wage educ) (lfit wage educ)


/*-----------------------------------------------------------------------------
	Question (d)
------------------------------------------------------------------------------*/
* gen newvar = exp
* reg yvar xvar

gen lnwage = ln(wage)
reg lnwage educ


/*-----------------------------------------------------------------------------
	Question (e)
------------------------------------------------------------------------------*/
* reg yvar xvar if exp, robust

eststo M1: reg lnwage educ if female==0
eststo M2: reg lnwage educ if female==1
eststo M3: reg lnwage educ if black==0
eststo M4: reg lnwage educ if black==1

esttab M1 M2 M3 M4, label title("Dependent variable: Log of hourly wage") mtitles("Male" "Female" "White" "Black") se nostar r2 scalars(rmse)


/*-----------------------------------------------------------------------------
	Question (f)
------------------------------------------------------------------------------*/
* reg yvar xvar
* predict e, residuals
* rvpplot xvar

reg lnwage educ
predict e, residuals
rvpplot educ, yline(0)


/*-----------------------------------------------------------------------------
	POSTAMBLE
------------------------------------------------------------------------------*/
log close
