# ExploratoryPaperAnalysisR
Using R to analyse and visualise collected information regarding scientific papers for an exploratory approach to reviewing scientific papers.

![PaperAnalysis.png](PaperAnalysis.png)

---
---
# Setup
 * You need a way to run R scripts on your system.
 * Zotero for collecting citation information.
 * Python (jupyter-notebook) for reformatting collected data.

## R
R is an amazing and free software for statistical analyses.
https://www.r-project.org/

## RStudio
RStudio enables an easy start into and use of R.
https://www.rstudio.com/

---
---
# How to use

#### Reference-sections from PDF-paper extraction via online-solution:
https://ref.scholarcy.com/api/
[Upload a PDF of a scientific paper]

#### Transforming the extracted references into a BibTex:
https://anystyle.io/
[Manually check the references and their number]
[Copy the references to the online application]

#### Importing the references to Zotero:
[Import these into Zotero from file]

#### Zotero Add-On to collect dois
https://github.com/bwiernik/zotero-shortdoi 
[Select the items and acquire the DOIs via Add-On]
 * Get short DOIs
 * Get long DOIS
 * Verify DOIs

#### Zotero Add-On to collect citation count based on dois
https://github.com/eschnett/zotero-citationcounts
[Select the items and acquire the citation counts via Add-On]
 * Get citation count for CrossRef
 * Get citation count for Google Scholar

#### Zotero export collection as CSV-file

#### Activate virtual environment:
[$ conda activate]
[Use the jupyter-notebook "CitationReformatter.ipynb"]

#### Fun with R
[Start RStudio and execute the code from the ".Rprofile"]
[Run the first part of the "script_references.R"]

---
---
# Required information
If no information could be found, decide on a default value to not confuse the scripts.

#### For "script_authors.R"
 * IdentifierGroup
 * Name
 * Publications
 * Citations
 * Hindex

#### For "script_references.R"
 * Marker
 * Citations
 * PublisherName
 * Publisher
 * Maturity
 * OfficialDoi
 * OfficialDoiCount
 * Category
 * Views


