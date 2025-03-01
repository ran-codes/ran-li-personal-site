log using "/Users/tboyer3/Library/CloudStorage/OneDrive-JohnsHopkins/JHSPH/TA/CV epi/Pedometer assignment/2025 pedometer assignment log.smcl", replace

*******************************************************
* Introduction to Cardiovascular Disease Epidemiology 
              * Pedometer Assignment 
	     	          * 2025
					  
* Code updated by Theresa Boyer in 2025
********************************************************

*	NOTE FOR 2012-2020 DATA:
* 		PEDOMETER 1 = SM-2000 pedometer

*	NOTE FOR 2016-2020 DATA:
*		PEDOMETER 4 = Actigraph pedometer (provided by Dr. Jennifer Schrack)

*	NOTE FOR 2021 DATA:
* 		PEDOMETER 1 = Course-provided pedometer; actual pedometer received could have varied by student due to COVID-19 shipping and inventory issues.
* 		PEDOMETER 2 = Smart phone pedometer; steps estimated from smart phone.
* 		PEDOMETER 3 = Personal wearable pedometer; steps estimated from wearable device, e.g. Fitbit watch, Apple Watch, Garmin watch.

*	NOTE FOR 2022-2025 DATA:
* 		PEDOMETER 1 = PINGKO Pedometer
* 		PEDOMETER 2 = Smart phone pedometer; steps estimated from smart phone.
* 		PEDOMETER 3 = Personal wearable pedometer; steps estimated from wearable device, e.g. Fitbit watch, Apple Watch, Garmin watch.
*		PEDOMETER 4 = Actigraph pedometer (provided by Dr. Jennifer Schrack)



********************************************************
********************************************************
********************************************************
********************************************************
********************************************************
********************************************************
********************************************************
********************************************************
********************************************************



********************************************************
** LOADING YOUR DATA INTO STATA
********************************************************

** The pathway for your file will change based on where you saved the file on your computer (see example below)
cd "/Users/tboyer3/Library/CloudStorage/OneDrive-JohnsHopkins/JHSPH/TA/CV epi/Pedometer assignment"
use "pedometer_data_2012_2025.dta", clear

** Browse the data to familiarize yourself with the dataset
describe /* Describes data in memory or in file */
codebook /* Describe data contents */
browse   /* Browse the data in the Data Editor (One row = One participant) */



********************************************************
********************************************************
********************************************************
********************************************************
********************************************************
********************************************************
********************************************************
********************************************************20
********************************************************



**********************
** CODE FOR QUESTION 1
**********************

** Summary Statistics for Pedometer Data (Step counts and hours pedometer worn)
summ p1d1steps p1d2steps mean_p1d12steps p1d1hours p1d2hours mean_p1d12hours p2d1steps p2d1hours diff_p1d12steps diff_p12d1steps
histogram p1d1steps, freq
stem p1d1steps


*Plots and correlations of step data 

	** Scatter plot of Day 1 and Day 2 step data from Pedometer #1
	** Includes ordinary least square regression line 
	scatter p1d1steps p1d2steps, ytitle("Pedometer 1, Day 1 (steps)") xtitle("Pedometer 1, Day 2 (steps)") legend(off) title("Comparing steps from pedometers 1 on days 1 and 2", size(medsmall)) || lfit p1d1steps p1d2steps || lfit p1d1steps p1d1steps, ysize(10) xsize(10)
		
	** Pearson correlation of Day 1 and Day 2 step data from Pedometer #1
	corr p1d1steps p1d2steps

	** Scatter plot of Day 1 step data from Pedometer #1 and Pedometer #2
	** Includes ordinary least square regression line 
	scatter p1d1steps p2d1steps, ytitle("Pedometer 1, Day 1 (steps)") xtitle("Pedometer 2, Day 1 (steps)") legend(off) title("Comparing steps from pedometers 1 and 2 on day 1", size(medsmall)) || lfit p1d1steps p2d1steps || lfit p1d1steps p1d1steps, ysize(10) xsize(10)

	** Pearson correlation of Day 1 step data from Pedometer #1 and Pedometer #2
	corr  p1d1steps p2d1steps

	
	
** Bland Altman plot of p1d1steps and p1d2steps -- please add appropriate titles, axis labels

	*You do not have to run the following code; it is here to show you how the variables used in the Bland-Altman plot were created: 
	*	gen mean_p1d12steps=(p1d1steps+p1d2steps)/2 
	*	label var mean_p1d12steps "Mean steps for pedometer 1 on Day 1 and Day 2"
	*	gen diff_p1d12steps=p1d1steps-p1d2steps 
	*	label var diff_p1d12steps "Difference in Pedometer 1 on Day 1 and Day 2"

	sum diff_p1d12steps  
	global mean1   =r(mean)
	global lowerCL1=r(mean) - 1.96*r(sd)
	global upperCL1=r(mean) + 1.96*r(sd)
	scatter diff_p1d12steps mean_p1d12steps, legend(off) ytitle("Difference in steps between Days 1 and 2 for Pedometer 1") xtitle("Mean steps on Days 1 and 2 for Pedometer 1") title( "Bland-Altman Plot, Days 1 vs 2 for Pedometer 1" ) yline(0)  ylabel(-10000(5000)10000) yline($mean1, lpattern(dash)) yline($lowerCL1, lpattern(dash)) yline($upperCL1, lpattern(dash))

	
	
*Bland Altman plot of p1d1steps p2d1steps -- -- please add appropriate titles, axis labels

	*You do not have to run the following code; it is here to show you how the variables used in the Bland-Altman plot were created: 
	*	gen mean_p12d1steps=(p1d1steps+p2d1steps)/2 
	*	label var mean_p12d1steps "Mean steps for pedometer 1 and pedometer 2 on Day 1"
	*	gen diff_p12d1steps=p1d1steps-p2d1steps if 
	*	label var diff_p12d1steps "Difference in Pedometer 1 and Pedometer 2 measurements on Day 1"

	sum diff_p12d1steps
	global mean2   =r(mean)
	global lowerCL2=r(mean) - 1.96*r(sd)
	global upperCL2=r(mean) + 1.96*r(sd)
	scatter diff_p12d1steps mean_p12d1steps, legend(off) ytitle("Difference in steps between pedometers 1 and 2 on day 1") xtitle("Mean steps for pedometers 1 and 2 on day 1")  title( "Bland-Altman Plot, Pedometers 1 and 2 on Day 1" ) yline(0)  ylabel(-10000(5000)10000)  xlabel(0(10000)30000) yline($mean2, lpattern(dash)) yline($lowerCL2, lpattern(dash)) yline($upperCL2, lpattern(dash))


	
********************************************************
********************************************************
********************************************************
********************************************************
********************************************************
********************************************************
********************************************************
********************************************************
********************************************************



**********************
** CODE FOR QUESTION 2
**********************

*attaching label to Pedometer 1 - Notes: 2016–2020 Pedometer 1 was an SM-2000
label variable p1d1steps "Pedometer 1 (SM-2000/PINGKO) Day 1 Steps"

** Summary Statistics for Pedometer Data (Step counts and hours pedometer worn)
*Restricting anaysis to data from 2016 - 2025 (excluding 2021: no Actigraph). 
summ p1d1steps p4d1steps diff_p1p4d1steps if class_2016_2025==1 & p1d1steps!=. & p4d1steps!=.

histogram p1d1steps if class_2016_2025==1 & p1d1steps!=. & p4d1steps!=., freq
stem p1d1steps if p1d1steps!=. & p4d1steps!=.

histogram p4d1steps if class_2016_2025==1 & p1d1steps!=. & p4d1steps!=., freq
stem p4d1steps if p1d1steps!=. & p4d1steps!=.


** Scatter plot of Day 1 step data from Pedometer #1 and Pedometer #4
** Includes ordinary least square regression line 
scatter p1d1steps p4d1steps if class_2016_2025==1 & p1d1steps!=. & p4d1steps!=.,  xlabel(0(5000)25000) ylabel(0(10000)30000) ytitle("Step Counts from SM-2000/PINGKO on Day 1") xtitle("Step Counts from Actigraph on Day 1") legend(off) title("Comparing Two Pedometer Step Counts on Day 1", size(medsmall)) || lfit p1d1steps p4d1steps || lfit p1d1steps p1d1steps if class_2016_2025==1, ysize(10) xsize(10)

** Pearson correlation of Day 1 step data from Pedometer #1 and Pedometer #4
corr  p1d1steps p4d1steps if class_2016_2025==1 & p1d1steps!=. & p4d1steps!=.



*Bland Altman plot of p1d1steps p4d1steps -- -- please add appropriate titles, axis labels, and labels for dotted lines)
	
	*You do not have to run the following code; it is here to show you how the variables used in the Bland-Altman plot were created: 
	*	gen mean_p1p4d1steps=(p1d1steps+p4d1steps)/2 if class_2016_2025==1
	*	label var mean_p1p4d1steps "Mean steps for pedometer 1 and pedometer 4 on Day 1"
	*	gen diff_p1p4d1steps=p1d1steps- p4d1steps if class_2016_2025==1
	*	label var diff_p1p4d1steps "Difference in Pedometer 1 and Pedometer 4 measurements on Day 1"

sum diff_p1p4d1steps if class_2016_2025==1
global mean3   =r(mean)
global lowerCL3=r(mean) - 1.96*r(sd)
global upperCL3=r(mean) + 1.96*r(sd)
scatter diff_p1p4d1steps mean_p1p4d1steps if class_2016_2025==1 & p1d1steps!=. & p4d1steps!=., legend(off) ytitle("Difference in Steps, Day 1 (SM-2000/PINGKO - Actigraph)") xtitle("Mean steps of SM-2000/PINGKO and Actigraph, Day 1")  title( "Bland-Altman Plot, SM-2000/PINGKO vs Actigraph, Day 1" ) yline(0) ylabel(-10000(5000)10000) xlabel(2000(5000)24000) yline($mean3, lpattern(dash)) yline($lowerCL3, lpattern(dash)) yline($upperCL3, lpattern(dash))



********************************************************
********************************************************
********************************************************
********************************************************
********************************************************
********************************************************
********************************************************
********************************************************
********************************************************



**********************
** CODE FOR QUESTION 3
**********************

*OPTION 1: Use questionnaire data that asked about physical activity from the past 30 days (data available for 2012-2022)

	*For this question we use the complete data i.e. collected since 2012
	*We have created an overall physical activity score - the variable "active" in the Stata file.
	*	DON'T RUN, THIS IS ONLY FOR 
		/*gen active = 0
		replace active = active+1 if wbyn=="Yes"
		replace active = active+2 if vigactyn=="Yes"
		replace active = active+1 if modactyn=="Yes"
		replace active = active+1 if strengthyn=="Yes"
		replace active = active-1 if tvviduse=="4 hours" | tvviduse=="5 hours or more" | compuse=="4 hours" | compuse=="5 hours or more"
		label variable active "Overall Activity Score"*/
	*This score can range from -1 to 5 points (higher score / higher activity level).
	*It combines the yes/no responses for types of physical activity with a penalty for high television or computer use. 

	codebook active 
	summ active
	 
	*Is there an association between activity and pedometer data (average step count)?
	scatter p1d1steps active || lfit p1d1steps active 

	** Potential linear regression models using "active" variable, which incorporates information based on past 30 days (2012-2022 data)
	regress mean_p1d12steps active				
	regress mean_p1d12steps active meanhours
	regress mean_p1d12steps active meanhours age sex_numeric



*OPTION 2: Use questionnaire data that asked about physical activity data from the past 2 days (data available for 2020–2025 only)

	*For this question we use 2020-2025 data
	*We have created an overall physical activity score - the variable "active_2day" in the Stata file.
	/*gen active_2day = 0
	replace active_2day = active_2day+1 if wbyn_2day=="Yes"
	replace active_2day = active_2day+2 if vigactyn_2day=="Yes"
	replace active_2day = active_2day+1 if modactyn_2day=="Yes"
	replace active_2day = active_2day+1 if strengthyn_2day=="Yes"
	replace active_2day = active_2day-1 if tvviduse_2day=="4 hours" | tvviduse_2day=="5 hours or more" | compuse_2day=="4 hours" | compuse_2day=="5 hours or more"
	label variable active_2day "Overall Activity Score - 2 days"*/
	*This score can range from -1 to 5 points (higher score / higher activity level).
	*It combines the yes/no responses for types of physical activity with a penalty for high television or computer use. 

	codebook active_2day 
	summ active_2day
	 
	* NOTE for 2021 Students: Feel free to look at pedometers 1, 2, or 3 below
	
	*Is there an association between activity and pedometer data (average step count)?
	scatter p1d1steps active_2day || lfit p1d1steps active_2day 

	** Potential linear regression models using "active_2day" variable, which incorporates information based on past 2 days (2020-22 data only)
	* Regression models looking at Pedometer 1
	regress mean_p1d12steps active_2day				
	regress mean_p1d12steps active_2day meanhours
	regress mean_p1d12steps active_2day meanhours age sex_numeric



********************************************************
********************************************************
********************************************************
********************************************************
********************************************************
********************************************************
********************************************************
********************************************************
********************************************************

log close



