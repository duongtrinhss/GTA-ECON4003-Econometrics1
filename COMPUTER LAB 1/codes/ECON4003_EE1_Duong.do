/*******************************************************************************

						ECON4003 INTRODUCTION TO STATA

*******************************************************************************/



display 4+5

* Help
help codebook

* Change working directory - type your working directory in the quote marks below:
cd ""

* Import the dataset
use nlsw88small.dta, clear

/*-----------------------------------------------------------------------------
	Data Description
------------------------------------------------------------------------------*/


* Browse
browse
browse age wage 

* Describe
des
des age wage

* Codebook
codebook age
codebook union

* Summarize
sum wage
sum wage, detail
sum wage if married==1
sum wage if age>=40 & age<=44

* Tabulation
tab industry
tab industry, nolabel

sum wage if industry==Manufacturing // display an error
sum wage if industry==4

tab industry race


/*-----------------------------------------------------------------------------
	Graphs
------------------------------------------------------------------------------*/

* Categorical data *
* Pie chart
graph pie, over(industry)

* Bar chart
graph bar, over(race)

* Horizontal Bar chart
graph hbar, over(occupation)

* Univariate distributions *
* Histogram
hist wage
hist wage, percent
hist wage, freq
hist wage, normal

* Bivariate distributions *
* Scatter plot
twoway scatter wage tenure
twoway scatter wage tenure, by(race)



/*-----------------------------------------------------------------------------
	Data Management
------------------------------------------------------------------------------*/

* Create new variables *
* Continuous
gen age2=age^2
browse

* Categorical
gen over40=1 if age>=40
browse age over40
gen over40=0 if age<=39 //display an error
replace over40=0 if age<=39

* String
gen hello="hello"

* Rename variables
rename age2 agesq

* Delete variables
drop hello

*Save the new data set
save lab1.dta, replace



/*-----------------------------------------------------------------------------
	Exercise Data Description
------------------------------------------------------------------------------*/

*Which is the mean of the variable tenure for those women who live in the south?
sum tenure if south == 0

*Which is the working hour’s mean for married women who belong to a union?
sum hours if (married == 1 & union ==1)

*Is it higher or lower than the working hours average of single women who belong to a union?
sum hours if (married == 0 & union ==1)

bysort married: sum hours if union == 1

/*-----------------------------------------------------------------------------
	Exercise Graphs
------------------------------------------------------------------------------*/

*Ex1: draw pie chart for “occupation”
graph pie, over(occupation)

*Ex2: create a bar graph for the variable “married”
graph bar, over(married)

*Ex3: create a horizonal bar graph for the variable “industry”
graph hbar, over(industry)

*Ex4: Repeat the hist exercise above for the variable “hours”
hist hours
hist hours, percent
hist hours, freq
hist hours, norm

*Ex5: create a scatter plot of “wage” on “ttl_exp”
twoway scatter wage ttl_exp 
twoway scatter wage ttl_exp || lfit wage ttl_exp

*Ex6: create a scatter plots of “wage” on “ttl_exp” by “married"
twoway scatter wage ttl_exp, by(married)
twoway scatter wage ttl_exp || lfit wage ttl_exp, by(married)

/*-----------------------------------------------------------------------------
	Exercise Data Management
------------------------------------------------------------------------------*/
*Create a new variable called “totwage” which is “wage” multiplied by “hours”. Replace “totwage” with the natural log of “totwage”? (hint: natural log of x is “log(x)”).  What is the mean of totwage?
gen totwage = wage*hours
replace totwage = log(totwage)
sum totwage

