# Collect the data
# 1. first connect remotely to wrds
# 2. then query the segments data 

# when finished substitute the paths;
# $pathDataIntermediate

# to set up connection from R to WRDS (https://wrds-www.wharton.upenn.edu/pages/support/programming-wrds/programming-r/r-from-your-computer/)
pacman::p_load(tidyverse,RPostgres,DBI,wrdsmc)

tfn<-connect_to_wrds_lib(wrds_lib = "tfn")
wrds<-connect_to_wrds()

# 1. Compustat Customer segments --------------------------------------------------
res <- dbSendQuery(wrds, "SELECT a.*  FROM tfn.ds_eq_wrds_ds_names as a")
data <- dbFetch(res, n=5) # fetches the data that results from running the query res against wrds and stores it as data
data %>% rename(datadate=srcdate) %>% write_csv("data/raw/CompustatSegmentDataCustomers.csv")  # to create customer momentum in R



# 13-f data

> tfn<-connect_to_wrds_lib(wrds_lib = "tr_13f")
> wrdsmc::list_tables(tfn)

"s34"      "s34names" "s34type1" "s34type2" "s34type3" "s34type4" "s34type6"

# dealscan

Dealscan - LPC Connector Feed data
Query Form
Variable Descriptions
Manuals and Overviews
Knowledge Base
Dealscan - LPC Connector Feed data

Translation tables between the legacy Dealscan and the new Dealscan
For users who need translation between the IDs in the legacy database and the IDs in the new database 
(facility id to tranche id, package id to deal id, LPC company id to LoanConnector company id), 
the linking tables are available on wrds-cloud: lpc_loanconnector_company_id_map, wrds_loanconnector_ids


The new Dealscan database is available
Dealscan recently changed its database structure and stopped supporting the previous version of the database. Users can still access the last version (Legacy files), but we recommend using the new Dealscan for up-to-date data.
dealscan<-wrdsmc::connect_to_wrds_lib(wrds_lib = "dealscan")
>
  https://wrds-www.wharton.upenn.edu/pages/get-data/macro-finance-society/dealscan-compustat-linking-database/
  
  Note:
  This WRDS Analytics Tool is built on the different data vintages from Refinitiv Dealscan and Worldscope data. The equity identifiers, 
such as cusip, isin, sedol and I/B/E/S tickers are linked to Dealscan borrowers through a fuzzy name-matching algorithm based on the company
identities primarily form Worldscope and verified by research assistants. An earlier version of this data has been used in following paper:
  
  Beyhaghi, et al. " International Lending: The Role of Lender’s Home Country" Journal of Money, Credit and Banking, Forthcoming.

To acknowledge the contributions of the manual verification tasks and unqiue algorithm, we would suggest users of this data cite above work. The data will be automatically updated based on the trained matching algorithm and verification procedure. WRDS will manually verify the content periodically. If you find any wrong matchings, please feel free to contact us.
  
tr_dealscan<-wrdsmc::connect_to_wrds_lib(wrds_lib = "tr_dealscan")
# commodities



tr_ds_comds <- wrdsmc::connect_to_wrds_lib(wrds_lib = "tr_ds_comds")


tr_ds_econ	Datastream Economics Data
Last updated March 2nd, 2022. Data updated monthly.

tr_ds_equities	Datastream Equities Data
Last updated February 3rd, 2022. Data updates are not scheduled.

tr_ds_fut	Datastream Futures
Last updated March 2nd, 2022. Data updated monthly.

tr_esg	Refinitiv ESG Data
Last updated January 27th, 2022. Data updated quarterly.


tr_ibes	Thomson Reuters IBES Historical Estimates (Global)
Last updated December 28th, 2021. Data updated quarterly.

tr_ibes_corporate	IBES Corporate (Institutional)
Data update frequency is not defined.

tr_ibes_guidance	Thomson Reuters IBES Guidance
tr_ibes_iga	Thomson Reuters IBES Global Aggregates
Last updated February 1st, 2022. Data updated quarterly.

tr_ibeskpi	IBES Key Performance Indicators

tr_insiders	Thomson Reuters Insiders Filing Data
Last updated March 1st, 2022. Data updated quarterly.

tr_mutualfunds	Thomson Reuters Mutual Funds Holdings
Last updated February 10th, 2022. Data updated quarterly.

tr_mutualfunds_archive	Archived snapshot of uncorrected, corrupted data in TR Mutual Funds Holdings
Data update frequency is not defined.

tr_ownership	Thomson Reuters Global OP Ownership


tr_sdc_ma	Thomson Reuters - SDC M&A
Last updated March 5th, 2022. Data updated daily.

tr_sdc_ni	Thomson Reuters - SDC New Issues
Last updated March 5th, 2022. Data updated daily.

tr_tass	Thomson Reuters TASS / Lipper Hedge Fund Database
Last updated February 2nd, 2022. Data updated quarterly.


WRDS Thomson Reuters Institutional (13f) Holdings - Stock Ownership Summary

Dealscan has the following
[1] "borrowerbase"                     "chars"                            "company"                          "currfacpricing"                   "dealamendment"                    "dealpurposecomment"               "dealscan"                        
[8] "facility"                         "facilityamendment"                "facilitydates"                    "facilityguarantor"                "facilitypaymentschedule"          "facilityrepaymentcomment"         "facilitysecurity"                
[15] "facilitysponsor"                  "financialcovenant"                "financialratios"                  "lendershares"                     "lins"                             "lpc_loanconnector_company_id_map" "marketsegment"                   
[22] "networthcovenant"                 "organizationtype"                 "package"                          "packageassignmentcomment"         "packageprepaymentcomment"         "performancepricing"               "performancepricingcomments"      
[29] "sublimits"                        "wrds_loanconnector_ids"    

