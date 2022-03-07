# creating global equity data - compare with gvkey data

Note:
  This WRDS Analytics Tool makes use of three distinct Refinitiv Quantitative Analytics (QAD) data products: Datastream, Worldscope, and Core Tables. Through QAD core tables, the stock identifiers from Datastream (infocode) and the company identifiers from Worldscope (code) are mapped together. Compared to the Datastream header linking table, the QAD core tables provide approximately 20% more matching results, primarily from historical identifier records. For additional information, please refer to the following white paper:
  
  Dai, Rui and Drechsler, Qingyi (Freda) Song, Research Guide for Datastream and Worldscope at Wharton Research Data Services (May 11, 2021). Available at SSRN: https://ssrn.com/abstract=3843551 or http://dx.doi.org/10.2139/ssrn.3843551