/*******************************************************************************

						ECON4003 EMPIRICAL EXERCISE 4

*******************************************************************************/
*	NOTES: 
*	var = variable; yvar = dependent variable; xvar = regressor; 
* 	newvar = new variable; exp = expression;
*   df = degrees of freedom; level = level of significance
*******************************************************************************/

/*-----------------------------------------------------------------------------
	PREAMBLE
------------------------------------------------------------------------------*/

log using "EE4.smcl", replace	// Start a log files
use "D:\Glasgow Uni\GTA\ECON4003\Lab session\W8_Empirical Exercise 4\election.dta", clear		// open data in Stata; election is a dataset

* keep if year >= exp & year <=exp
keep if year>=1916 & year<=2008 


/*-----------------------------------------------------------------------------
	Question 1(a)
------------------------------------------------------------------------------*/
* gen newvar = exp
* tabstat var1, by(var2) stat(exp)

gen majority = vote>50
tabstat growth, by(majority) stat(mean n)

reg growth majority, robust
display 3.381667 - (-1.868333)


/*-----------------------------------------------------------------------------
	Question 2(a)
------------------------------------------------------------------------------*/
* reg yvar xvar, robust

reg vote growth, robust


/*-----------------------------------------------------------------------------
	Question 2(b)
------------------------------------------------------------------------------*/
* display invttail(df, level)

display invttail(22, 0.05)


/*-----------------------------------------------------------------------------
	Question 2(c)
------------------------------------------------------------------------------*/
* reg yvar xvar, robust level(exp)

reg vote growth, robust level(90)
reg vote growth, robust level(99)


/*-----------------------------------------------------------------------------
	Question 3(a)-(c)
------------------------------------------------------------------------------*/
* reg yvar xvar, robust
* display invttail(df, level)

reg vote inflation, robust
display invttail(22, 0.01)


/*-----------------------------------------------------------------------------
	PRACTICE
------------------------------------------------------------------------------*/
reg vote inflation, robust
display invttail(22, 0.01)
reg vote inflation, robust level(99)

/*-----------------------------------------------------------------------------
	POSTAMBLE
------------------------------------------------------------------------------*/
log close

