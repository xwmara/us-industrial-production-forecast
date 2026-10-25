# Data

Monthly data, January 1990 to April 2025 (424 observations), retrieved from
[ALFRED](https://alfred.stlouisfed.org/), the archive of past FRED® data
vintages, using the **vintage of 2025-12-17**. A fixed vintage is used because
industrial production is revised every year; a fresh download from FRED may
give slightly different numbers.

Both files have two columns: `date` (first day of the month) and `value`.
They are created by [`R/get_data.R`](../R/get_data.R).

| File | Series | Units | In this repo? |
|---|---|---|---|
| `ipb50001n.csv` | Industrial Production: Total Index (IPB50001N) | Index 2017 = 100, not seasonally adjusted | Yes |
| `umcsent.csv` | University of Michigan: Consumer Sentiment (UMCSENT) | Index 1966:Q1 = 100, not seasonally adjusted | No, run `Rscript R/get_data.R` |

## Sources and terms of use

**IPB50001N.** Source: Board of Governors of the Federal Reserve System (US),
G.17 Industrial Production and Capacity Utilization. FRED labels this series
"Public Domain: Citation Requested".

> Board of Governors of the Federal Reserve System (US), Industrial Production:
> Total Index [IPB50001N], retrieved from FRED, Federal Reserve Bank of St. Louis;
> https://fred.stlouisfed.org/series/IPB50001N

**UMCSENT.** Source: Surveys of Consumers, University of Michigan. FRED labels
this series "Copyrighted: Citation Required" ("Copyright, Surveys of Consumers,
University of Michigan. Reprinted with permission."). The raw data is therefore
**not redistributed** in this repository; `R/get_data.R` downloads it locally,
and the published report only shows results derived from it, with attribution.

> Surveys of Consumers, University of Michigan, University of Michigan: Consumer
> Sentiment © [UMCSENT], retrieved from FRED, Federal Reserve Bank of St. Louis;
> https://fred.stlouisfed.org/series/UMCSENT

Use of FRED® data is subject to the
[FRED® terms of use](https://fred.stlouisfed.org/legal/). This project is not
endorsed by the Federal Reserve Bank of St. Louis, the Federal Reserve Board or
the University of Michigan.
