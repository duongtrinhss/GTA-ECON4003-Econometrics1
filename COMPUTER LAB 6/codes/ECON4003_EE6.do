/*******************************************************************************

						ECON4003 EMPIRICAL EXERCISE 6

*******************************************************************************/
*	NOTES: 
*	yvar = dependent variable; xvar = regressor; exp = expression
*   df = degrees of freedom; level = level of significance
*******************************************************************************/

/*-----------------------------------------------------------------------------
	PREAMBLE
------------------------------------------------------------------------------*/
cd "D:\Glasgow Uni\GTA\ECON4003\Lab session\W10_Empirical Exercise 6"
log using "EE6.smcl", replace	// Start a log files
use "inequality_aus.dta", clear	// open data in Stata; election is a dataset


/*-----------------------------------------------------------------------------
	Question (a)
------------------------------------------------------------------------------*/
* reg yvar xvar, robust

reg share tax, robust



/*-----------------------------------------------------------------------------
	Question (b)
------------------------------------------------------------------------------*/
* reg yvar xvar, robust
* corr xvar1 xvar2

reg share tax year, robust
corr tax year


/*-----------------------------------------------------------------------------
	Question (c)
------------------------------------------------------------------------------*/
* reg yvar xvar, robust
* test (exp = exp) 
* display invttail(df1, df2, level)

quiet reg share tax year, robust
test (_cons + 64*tax + 80*year = 5)
display r(F)
display invFtail(1,77,0.05)

reg share tax year
test (_cons + 64*tax + 80*year = 5)


/*-----------------------------------------------------------------------------
	Question (d)
------------------------------------------------------------------------------*/
* reg yvar xvar, robust
* test (exp1 = exp1) (exp2 = exp2)
* display invttail(df1, df2, level)

quiet reg share tax year, robust
test (_cons + 64*tax + 5*year = 5) (_cons + 64*tax + 80*year = 5)
display r(F)
display invFtail(2,77,0.1)


/*-----------------------------------------------------------------------------
	Question (e)
------------------------------------------------------------------------------*/
* reg yvar xvar, robust
* corr xvar1 xvar2

reg share tax year gwth, robust
corr gwth tax
corr gwth year



/*-----------------------------------------------------------------------------
	Question (f)
------------------------------------------------------------------------------*/
* reg yvar xvar, robust
* test xvar1 xvar2 xvar3
quiet reg share tax year gwth, robust
test (tax = 0) (year = 0) (gwth = 0)
test tax year gwth

display invFtail(3,76,0.01)


/*-----------------------------------------------------------------------------
	PRACTICE
------------------------------------------------------------------------------*/
* reg yvar xvar, robust
* test (exp1 = exp1) (exp2 = exp2)
* display invttail(df1, df2, level)

reg share tax year gwth, robust
test (_cons + 64*tax + 5*year - 1.05*gwth = 5) (_cons + 64*tax +  80*year + 1.74*gwth = 5)
display r(F)
display invFtail(2,76,0.1)

/*-----------------------------------------------------------------------------
	POSTAMBLE
------------------------------------------------------------------------------*/
log close

