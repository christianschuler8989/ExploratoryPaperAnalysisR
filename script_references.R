# R-Script
# 
# Analysis and visualisation of different distributions for the referenced
# scientific works of the main-paper
#
# Author: Christian Schuler
# Date: 2022 Mar
################################################################################
# Order of sources by "Maturity"
# • Scientific journals (e.g. ACM / IEEE Transactions)
# • Conference and Workshop proceedings
# • Scientific Magazines (e.g. “IEEE Software, Special Issue on …”)
# • Books, Textbooks
# • Technical reports
# • Dissertations, master theses
# • Other “gray” literature (Websites, Wikipedia, Etc.)
# c("Journal", "Conference", "Workshop", "Magazine", "Book", "Technical Report", "Dissertation", "Master Thesis", "Wikipedia", "Website")


visualiseCitations <- function(dataframe, paperidentifier, imgAuthor) {
  ################################################
  # Regarding the Maturity of referenced Sources #
  ################################################
  # Selecting specific variables to include in new dataframe
  dataframe_off <- dataframe %>% select(Item.Type, Publication.Title, Marker)
  # Sorting in descending order of "Maturity"
  # Automatic-based categorization for all papers:
  dataframe_off <- dataframe_off %>% arrange(factor(Item.Type, levels = c("journalArticle", "conferencePaper", "book", "bookSection", "report", "document")))
  # Manual categorization as done for our first main-paper:
  #data_ref_off <- data_ref_off %>% arrange(factor(Maturity, levels = c("Journal", "Online Journal", "Conference", "Workshop", "Magazine", "Book", "Technical Report", "Dissertation", "Master Thesis", "Wikipedia", "Website")))
  
  # Print tables to a png file:
  png(file=paste0(paperidentifier, "-references-official.png"),
      height = 25*nrow(dataframe_off),
      width = 300*ncol(dataframe_off))
  grid.table(dataframe_off)
  dev.off()
  
  ################################################################
  # Handling cases without a citation-count (no citations found) #
  ################################################################
  dataframe$SemanticScholarCitations[dataframe$SemanticScholarCitations == "No Citations Found"] <- 0
  dataframe$SemanticScholarCitations = as.numeric(as.character(dataframe$SemanticScholarCitations))
  #data_ref_all$SemanticScholarCitations[is.character(data_ref_all$SemanticScholarCitations)] <- as.numeric(0)
  
  dataframe$CrossRefCitations[dataframe$CrossRefCitations == "No Citations Found"] <- 0
  dataframe$CrossRefCitations = as.numeric(as.character(dataframe$CrossRefCitations))
  #data_ref_all$CrossRefCitations[is.character(data_ref_all$CrossRefCitations)] <- as.numeric(0)
  
  dataframe_temp <- dataframe %>% select(Marker, Item.Type, Publication.Title, SemanticScholarCitations, CrossRefCitations)
  
  ##############################################################
  # Citations per referenced scientific work (SemanticScholar) #
  ##############################################################
  plot_r_citations_semanticScholar <- ggplot(dataframe_temp, aes(x= reorder(Marker, +SemanticScholarCitations), y=SemanticScholarCitations)) +
    ggtitle("Citations (SemanticScholar) per scientific work (from the references of this paper)") +
    geom_bar(stat='identity', position='dodge', colour="black", aes(color=Item.Type, fill=Item.Type)) +
    #scale_fill_manual("Category", values = c("Author" = "red", "Other" = "blue")) + 
    theme(axis.text.x = element_text(size=6),
          legend.position = c(0.2, 0.8)) + 
    labs(x = "Identifier based on reference in this paper") +
    # Insert image of author to the plot
    inset_element(p = imgAuthor,
                   left = 0.4,
                   bottom = 0.6,
                   right = 0.9,
                   top = 0.9)
  print("SemanticScholarPlot")
  #plot_r_citations_semanticScholar
  ############################################
  # Saving plots as png in current directory #
  ############################################
  png(file=paste0(paperidentifier, "-citationsSemanticScholar.png"))
  print(plot_r_citations_semanticScholar)
  dev.off()
  
  
  #######################################################
  # Citations per referenced scientific work (CrossRef) #
  #######################################################
  plot_r_citations_crossRef <- ggplot(dataframe_temp, aes(x= reorder(Marker, +CrossRefCitations), y=CrossRefCitations)) +
    ggtitle("Citations (CrossRef) per scientific work (from the references of this paper)") +
    geom_bar(stat='identity', position='dodge', colour="black", aes(color=Item.Type, fill=Item.Type)) +
    #scale_fill_manual("Category", values = c("Author" = "red", "Other" = "blue")) + 
    theme(axis.text.x = element_text(size=6),
          legend.position = c(0.2, 0.8)) + 
    labs(x = "Identifier based on reference in this paper")
  print("CrossRefPlot")
  #plot_r_citations_crossRef
  ############################################
  # Saving plots as png in current directory #
  ############################################
  png(file=paste0(paperidentifier, "-citationsCrossRef.png"))
  print(plot_r_citations_crossRef)
  dev.off()

}


#################################
# Function calls for each paper #
#################################
#visualiseCitations(data_ref_all, "MainPapers")
visualiseCitations(data_ref_p00_schuler, "Schuler", img_schuler)
visualiseCitations(data_ref_p01_sturm, "Sturm", img_sturm)
visualiseCitations(data_ref_p02_lebovitz, "Lebovitz", img_lebovitz)
visualiseCitations(data_ref_p03_kane, "Kane", img_kane)


setwd(dir_init)



################################################################################

################################################################################

################################################################################

################################################################################
# Manual (prior and outdated) parts:
#



################################################
# Regarding the Maturity of referenced Sources #
################################################
# Selecting specific variables to include in new dataframe
data_ref_off <- data_ref_all %>% select(Item.Type, Publication.Title, Marker)
# Sorting in descending order of "Maturity"
# Automatic-based categorization for all papers:
data_ref_off <- data_ref_off %>% arrange(factor(Item.Type, levels = c("journalArticle", "conferencePaper", "book", "bookSection", "report", "document")))
# Manual categorization as done for our first main-paper:
#data_ref_off <- data_ref_off %>% arrange(factor(Maturity, levels = c("Journal", "Online Journal", "Conference", "Workshop", "Magazine", "Book", "Technical Report", "Dissertation", "Master Thesis", "Wikipedia", "Website")))

# Print tables to a png file:
png(file="all-references-official.png",
    height = 25*nrow(data_ref_off),
    width = 300*ncol(data_ref_off))
grid.table(data_ref_off)
dev.off()

################################################################
# Handling cases without a citation-count (no citations found) #
################################################################
data_ref_all$SemanticScholarCitations[data_ref_all$SemanticScholarCitations == "No Citations Found"] <- 0
data_ref_all$SemanticScholarCitations = as.numeric(as.character(data_ref_all$SemanticScholarCitations))
#data_ref_all$SemanticScholarCitations[is.character(data_ref_all$SemanticScholarCitations)] <- as.numeric(0)

data_ref_all$CrossRefCitations[data_ref_all$CrossRefCitations == "No Citations Found"] <- 0
data_ref_all$CrossRefCitations = as.numeric(as.character(data_ref_all$CrossRefCitations))
#data_ref_all$CrossRefCitations[is.character(data_ref_all$CrossRefCitations)] <- as.numeric(0)



##############################################################
# Citations per referenced scientific work (SemanticScholar) #
##############################################################
plot_r_citations_semanticScholar <- ggplot(data_ref_all, aes(x= reorder(Marker, +SemanticScholarCitations), y=SemanticScholarCitations)) +
  ggtitle("Citations (SemanticScholar) per scientific work (from the references of this paper)") +
  geom_bar(stat='identity', position='dodge', colour="black", aes(color=Item.Type, fill=Item.Type)) +
  #scale_fill_manual("Category", values = c("Author" = "red", "Other" = "blue")) + 
  theme(axis.text.x = element_text(size=8),
        legend.position = c(0.1, 0.8)) + 
  labs(x = "Identifier based on reference in this paper")
plot_r_citations_semanticScholar
############################################
# Saving plots as png in current directory #
############################################
png(file="references-citations-semanticScholar.png")
plot_r_citations_sementicScholar
dev.off()


#######################################################
# Citations per referenced scientific work (CrossRef) #
#######################################################
plot_r_citations_crossRef <- ggplot(data_ref_all, aes(x= reorder(Marker, +CrossRefCitations), y=CrossRefCitations)) +
  ggtitle("Citations (CrossRef) per scientific work (from the references of this paper)") +
  geom_bar(stat='identity', position='dodge', colour="black", aes(color=Item.Type, fill=Item.Type)) +
  #scale_fill_manual("Category", values = c("Author" = "red", "Other" = "blue")) + 
  theme(axis.text.x = element_text(size=8),
        legend.position = c(0.1, 0.8)) + 
  labs(x = "Identifier based on reference in this paper")
plot_r_citations_crossRef
############################################
# Saving plots as png in current directory #
############################################
png(file="references-citations-crossRef.png")
plot_r_citations_crossRef
dev.off()





#########################################
# Sources of referenced scientific work #
#########################################
plot_r_publishers <- ggplot(data_ref_doi, aes(x= reorder(OfficialDoi, +OfficialDoiCount), y=OfficialDoiCount)) +
  ggtitle("Publishing information per scientific work (from the references of this paper)") +
  geom_bar(stat='identity', position='dodge', colour="black", aes(color=OfficialDoi, fill=OfficialDoi)) +
  scale_fill_manual("OfficialDoi", values = c("ICSE" = "blue", "ACM" = "green", "ESEM" = "purple", "FSE" = "black", "IEEE" = "orange", "doi" = "yellow", "no doi" = "red")) + 
  theme(axis.text.x = element_text(size=25),
        legend.position = c(0.1, 0.8)) + 
  #scale_fill_manual("Publisher", values = c("Author" = "red", "Else" = "Blue")) +
  #labs(x = "Publisher of referenced work")
  labs(x = "Identifier based on reference in this paper")
plot_r_publishers
############################################
# Saving plots as png in current directory #
############################################
png(file="references-publishers.png")
plot_r_publishers
dev.off()




