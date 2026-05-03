# Estimating the Impact of GitHub Activity on GDP: A Dynamic Panel System GMM Approach

## Overview

This replication package contains the datasets, Stata do-files, and output files used to estimate the impact of digital activity (GitHub commits as a proxy for open-source innovation), trade openness, investment, and R&D expenditure on GDP per capita using System GMM (xtabond2).

The study uses a panel dataset of high-income and middle-income countries over the period 2019–2024.

---

## Folder Structure

Replication_Package/
│
├── data/
│   ├── high_income_cleaned_data.xlsx
│   ├── middle_income_cleaned_data.xlsx
│
├── do_files/
│   ├── high_income_analysis.do
│   ├── middle_income_analysis.do
│
├── results/
│   ├── regression_tables.rtf
│   ├── additional_outputs.doc
│
└── README.md


---

## Data Description

The dataset includes macroeconomic and digital economy indicators for selected countries.

### Variables Used:
- GDP per capita (current US$)
- GitHub commits (proxy for open-source innovation activity)
- Trade openness (% of GDP)
- Gross capital formation (% of GDP)
- R&D expenditure (% of GDP or government spending)
- Government final consumption expenditure
- Annual investment in telecommunications infrastructure

### Data Sources:
- World Development Indicators (World Bank)
- GitHub API
- National statistical agencies (where applicable)

---

## Methodology

The empirical strategy employs System Generalized Method of Moments (System GMM) using the `xtabond2` estimator in Stata.

This estimator is used to address:
- Endogeneity
- Unobserved country-specific heterogeneity
- Dynamic panel bias arising from lagged dependent variables

The baseline specification includes lagged GDP per capita and selected structural and digital economy variables.

---

## Software Requirements

- Stata (version 16 or later recommended)
- `xtabond2` package (Roodman, 2009)

---

## Replication Instructions

1. Open Stata
2. Set the working directory to the project folder
3. Run the following commands:

```stata
do do_files/high_income_analysis.do
do do_files/middle_income_analysis.do
4. Regression outputs will be generated in the /results folder.
5. ## Notes on Estimation

- Instrument proliferation is controlled using the collapse option in xtabond2.
- Hansen J-test is used for instrument validity.
- AR(1) and AR(2) tests are reported for serial correlation.
- ## Author

Independent Researcher (MPhil Economics)
