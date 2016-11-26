/**/

cd "C:\Users\DurfTop\Google Drive\Classes\pol ana\iv homeworks"
use p80all.dta
/*
(a) Regress INCOMEM on MOREKIDS. Other covariates you should control for are AGE,
BLACKM, HISPM, OTHRACEM and NONMOMI. Interpret the coecient on MOREKIDS.
*/

reg incomem morekids 
reg incomem morekids agem1 blackm hispm othracem nonmomi 

gen agemsqr = agem1^2

reg incomem morekids agem1 agemsqr blackm hispm othracem nonmomi


/*
(b) Now use an IV regression to gure out impact of MOREKIDS on INCOMEM. Use the
variable SAMESEX as an IV and use the ivreg command in this part. Include the same
covariates as before. Interpret the coecient on MOREKIDS and if it is dierent from
the coecient in part a, brie
y explain why you think it may be so.
*/


ivreg incomem morekids (morekids = samesex)
ivreg incomem morekids agem1 blackm hispm othracem nonmomi (morekids = samesex agem1 blackm hispm othracem nonmomi)
ivreg incomem morekids agem1 agemsqr blackm hispm othracem nonmomi (morekids = samesex agem1 agemsqr blackm hispm othracem nonmomi) 

/* include the first stage regression in the results */
ivreg incomem (morekids = samesex) agem1 agemsqr blackm hispm nonmomi, first


/*
(c) State the assumptions required for us to interpret the estimates in part b as an unbiased,
LATE parameter.
*/

/* 
instrument condition:
we see that the first stage of the regression has a strong correlation with same sex of kids and nuber of kids


monotonicity
does having more kids make you have more income for same sex kids rather than different sex kids?

exclusion - no equilibrium effects
one kids being same sex hasno impact on the same sex ness of another family - check


this is a late, this means that we are not measuring the effect of more kids on everyone, only for same sex couples, who would have been sensitive to income levels based on children
this means same sex kids families that were always going to have X kids are not counted

*/



/*
(d) State the assumptions required for us to interpret the estimates in part b as the unbiased
treatment eect that is the same for everybody.
*/

/*
the late needs to be the same for everyone, the income effects of ore kids for same sex kids must be the same as for different sex kids
*/


/*
(e) Repeat the IV regression from part b but now do the two steps of 2SLS separately in
Stata (i.e. do not use ivreg). Compare the estimates for MOREKIDS (coecient and
standard error) you obtain from this procedure to those obtained in part b. Explain
why they dier or do not dier.
*/

regress morekids samesex
predict morekidshat

regress incomem morekidshat agem1 agemsqr blackm hispm othracem nonmomi
/*the size f the effect is gettign closer and closer to 0*/



/*
(f) State the F statistic on the instrument SAMESEX used and evaluate whether the in-
strument is strong or weak.
*/





/*
(g) Repeat the IV regression with the ivreg command but now instead of using NONMOMI
as an X variable to control for, use it as an instrument (do not use SAMESEX anywhere
in this part). State the F statistic on this new instrument. Interpret the IV estimates
obtained and compare to the estimates obtained using SAMESEX as an IV in part b.
*/

ivreg incomem (morekids = nonmomi) agem1 agemsqr blackm hispm othracem

/*
(h) Discuss whether you think NONMOMI is a valid instrument. Explain all possible reasons
why the estimates using the two dierent instruments may dier.

*/

/*the sign of the effect switched. 
this means that same sex kids are similar to the rest of the population
but the factor of if the mother contributes income to the family is different

moms working is different from same sex kids families

I think this is not a valid instrument
*/

/*side note, does nonmomi correlate with samesex? who is the mother in a same sex household?*/


/*
(i) Is there another variable you could condition on, after which NONMOMI would be a
more plausible instrument? Repeat your IV regression conditioning for such a variable
and briey interpret the results obtained.

*/

/*=1 second birth is multiple, better insturment, little choice if you have twins
*/

ivreg incomem (morekids = multi2nd) agem1 agemsqr blackm hispm othracem, first
