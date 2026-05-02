# middle_income_analysis.do

```stata
*====================================================
* Middle Income Countries Analysis
* Estimating the Impact of GitHub Activity on GDP
* Dynamic Panel System GMM Estimation
*====================================================

clear all
set more off

*----------------------------------------------------
* Load Dataset
*----------------------------------------------------

import excel "middle_income_cleaned_data.xlsx", firstrow clear

*----------------------------------------------------
* Panel Data Setup
*----------------------------------------------------

encode countries, gen(id)
xtset id years

*----------------------------------------------------
* Install Required Package (if not already installed)
*----------------------------------------------------

* ssc install xtabond2

*----------------------------------------------------
* Baseline System GMM Model
*----------------------------------------------------

xtabond2 gdppercapitacurrentus ///
L.gdppercapitacurrentus ///
githubcommits ///
tradeofgdp ///
grosscapitalformationofgdp ///
finalconsumptionexpenditureofgdp ///
rdexpenditurebygovernmentsandhig ///
annualinvestmentintelecommunicat, ///
gmm(L.gdppercapitacurrentus, lag(2 3) collapse) ///
iv(githubcommits ///
tradeofgdp ///
grosscapitalformationofgdp ///
finalconsumptionexpenditureofgdp ///
rdexpenditurebygovernmentsandhig ///
annualinvestmentintelecommunicat, eq(level)) ///
twostep robust small

*----------------------------------------------------
* Lagged GitHub Model
*----------------------------------------------------

gen L1_github = L.githubcommits

xtabond2 gdppercapitacurrentus ///
L.gdppercapitacurrentus ///
L1_github ///
tradeofgdp ///
grosscapitalformationofgdp ///
finalconsumptionexpenditureofgdp ///
rdexpenditurebygovernmentsandhig ///
annualinvestmentintelecommunicat, ///
gmm(L.gdppercapitacurrentus, lag(2 3) collapse) ///
iv(L1_github ///
tradeofgdp ///
grosscapitalformationofgdp ///
finalconsumptionexpenditureofgdp ///
rdexpenditurebygovernmentsandhig ///
annualinvestmentintelecommunicat, eq(level)) ///
twostep robust small

