clear

cd "C:\Users\DurfTop\Google Drive\Classes\pol ana\iv homeworks"

use jobcorps.dta

set more off
/* use p80all.dta */


/* 
some of the control group were allowed to enroll in an alternative
some of the treatment group were allowed to drop out
*/


sum earny1, d


gen earn1_quart = .
replace earn1_quart = 1 if earny1 == 0
replace earn1_quart = 2 if earny1 > 0 & earny1 <=35.92912
replace earn1_quart = 3 if earny1 > 35.92912 & earny1 <= 113.6496
replace earn1_quart = 4 if  earny1 > 113.6496


sum earny2, d


gen earn2_quart = .
replace earn2_quart = 1 if earny1 == 0
replace earn2_quart = 2 if earny1 > 0 & earny1 <=92.04918 
replace earn2_quart = 3 if earny1 > 92.04918  & earny1 <= 211.418 
replace earn2_quart = 4 if  earny1 > 211.418 


sum earny3, d

gen earn3_quart = .
replace earn3_quart = 1 if earny1 <= 29.21514
replace earn3_quart = 2 if earny1 > 29.21514 & earny1 <= 150.8047 
replace earn3_quart = 3 if earny1 > 150.8047   & earny1 <= 262.4071  
replace earn3_quart = 4 if  earny1 > 262.4071 


sum earny4, d

gen earn4_quart = .
replace earn4_quart = 1 if earny1 <= 36.98722  
replace earn4_quart = 2 if earny1 > 36.98722   & earny1 <= 179.9201  
replace earn4_quart = 3 if earny1 > 179.9201   & earny1 <= 306.2942  
replace earn4_quart = 4 if  earny1 > 306.2942  



sum mosjail1, d

gen jail_vigintile = .
replace jail_vigintile = 89 if mosjail1 <= 0
replace jail_vigintile = 90 if mosjail1 > 0   & mosjail1 <= 2
replace jail_vigintile = 95 if mosjail1 > 179.9201   & mosjail1 <= 10.16534   
replace jail_vigintile = 99 if  mosjail1 > 10.16534   & mosjail1 <=  29.95711  
replace jail_vigintile = 100 if  mosjail1 >  29.95711   

/*
part a
Inspect the baseline characteristics of the sample and brie
y describe any key features
that you think are important. Test whether there are any signicant dierences between
treatment and control groups at baseline.
*/


des

local all_vars female race_eth child_ra educ_ra agegroup app_qtr everjc   everwork pworkq16   earn1_quart earn2_quart earn3_quart earn4_quart  afdcev  fsev   evarr  narrany  serconv jail_vigintile evjcvoc  evjcacad

foreach i of local all_vars {
di "`i'"
di "``i''"
tab treatment `i' ,m
tab treatment `i' ,m col
tab treatment `i' ,m row
reg `i' treatment
reg `i' treatment [aweight = wgt]


sdtest `i', by(treatment)
ttest `i' , by(treatment)
ttest `i' , by(treatment) unequal
}

tab jcpservd treatment /*notice the colinearity */


/* is there a differnce in the prevailance of these factors by treatment and comparison groups?

for all of this, 39.93% are in the comparison group, 60.07% in the treatment

female


 race_eth 

 
 
 child_ra 
 
 
 
 educ_ra
 
 
 
 agegroup 
 
 
 
 app_qtr 
 
 
 
 everjc 
 
 
 
 jcpservd   
 
 
 
 everwork 
 
 
 
 pworkq16  
 
 
 
 earn1_quart 
 
 
 
 earn2_quart 
 
 
 
 earn3_quart 
 
 
 
 earn4_quart 
 
 
 
 afdcev 
 
 
 
 fsev  
 
 
 
 evarr 
 
 
 
 narrany  
 
 
 
 serconv 
 
 
 
 jail_vigintile 
 
 
 
 evjcvoc 
 
 
 
 evjcacad


 */

 
 /*
 part b
 What percentage of those assigned to the treatment group are dropouts (those that did
not enroll in the Job Corps program)? What percentage of those assigned to the control
group participated in the program before the three year restriction ended (the rate of
early control substitution)?

*/
 
 
 /*
 part c
 Estimate the impact of the Job Corps program on the earnings per week in the third
year after program entry (earny3) for the full program group (both participants and
non-participants). How do you interpret your estimates?

*/
 
 
 
 /*
 part d
 Explain in words why it would be inappropriate to compute treatment impact estimates
of Job Corps by comparing the mean earnings of participants to mean earnings of non-
participants.
 */
 
 
 
 /*
 part e
 Calculate (by hand) the Wald estimator for the treatment impact of Job Corps. You
should be able to use numbers you found in earlier parts to plug into the Wald formula.
 */
 
 
 
 /*
 part f
 Now estimate the treatment impact of Job Corps using the IV procedure. How do the
IV estimates compare to the estimate you computed by hand?
 */
 
 
 
 /*
 part g
 What are the assumptions required for the Wald estimator to give us the treatment
impact? Whose treatment impact are we getting using this estimator?
 */
 
 
 
 /*
 part h
 Which of your estimates do you consider to be more policy-relevant and why?
 */


