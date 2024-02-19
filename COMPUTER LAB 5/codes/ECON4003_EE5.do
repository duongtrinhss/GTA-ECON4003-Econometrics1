
/*******************************************************************************

						ECON4003 EMPIRICAL EXERCISE 5

*******************************************************************************/
*	NOTES: 
*	var = variable; yvar = dependent variable; xvar = regressor; 
* 	newvar = new variable; exp = expression;
*******************************************************************************/

/*-----------------------------------------------------------------------------
	PREAMBLE
------------------------------------------------------------------------------*/

log using "EE5.smcl", replace		 // Start a log files
use "birthweight_smoking.dta", clear // open data in Stata; election is a dataset


/*-----------------------------------------------------------------------------
	Question 1(a)
------------------------------------------------------------------------------*/
* reg yvar xvar, robust
* display e(r2_a)

reg birthweight smoker, robust
display e(r2_a)
reg birthweight smoker alcohol nprevist, robust
display e(r2_a)


/*-----------------------------------------------------------------------------
	Question 1(b)
------------------------------------------------------------------------------*/
* reg yvar xvar, robust

reg smoker alcohol nprevist, robust


/*-----------------------------------------------------------------------------
	Question 1(c)
------------------------------------------------------------------------------*/
* reg yvar xvar, robust
* display _b[_cons] + (_b[xvar]*exp)

reg birthweight smoker alcohol nprevist, robust
display _b[_cons] + (_b[smoker]*1) + (_b[alcohol]*0) + (_b[nprevist]*8)


/*-----------------------------------------------------------------------------
	Question 2(a)
------------------------------------------------------------------------------*/
* gen newvar = exp
* tab newvar
* reg yvar xvar, robust

gen trip = tripre0 + tripre1 + tripre2 + tripre3
tab trip
reg birthweight smoker alcohol tripre0 tripre1 tripre2 tripre3, robust


/*-----------------------------------------------------------------------------
	Question 2(b)
------------------------------------------------------------------------------*/
* reg yvar xvar, robust
* display e(r2_a)

reg birthweight smoker alcohol tripre0 tripre2 tripre3, robust
display e(r2_a)


/*-----------------------------------------------------------------------------
	POSTAMBLE
------------------------------------------------------------------------------*/
log close

