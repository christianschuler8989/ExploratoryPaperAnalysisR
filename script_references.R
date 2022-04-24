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

#################
# Some counting #
#################
data_ref_doi <- data_ref %>% group_by(OfficialDoi) %>%
  summarise(OfficialDoiCount = n())

# Selecting specific variables to include in new dataframe
data_ref_off <- data_ref %>% select(Marker, Maturity, Publisher, PublisherName)
# Sorting in descending order of "Maturity"
data_ref_off <- data_ref_off %>% arrange(factor(Maturity, levels = c("Journal", "Online Journal", "Conference", "Workshop", "Magazine", "Book", "Technical Report", "Dissertation", "Master Thesis", "Wikipedia", "Website")))


############################################
# Citations per referenced scientific work #
############################################
plot_r_citations <- ggplot(data_ref, aes(x= reorder(Marker, +Citations), y=Citations)) +
  ggtitle("Citations per scientific work (from the references of this paper)") +
  geom_bar(stat='identity', position='dodge', colour="black", aes(color=Category, fill=Category)) +
  scale_fill_manual("Category", values = c("Author" = "red", "Other" = "blue")) + 
  theme(axis.text.x = element_text(size=8),
        legend.position = c(0.1, 0.8)) + 
  labs(x = "Identifier based on reference in this paper")
plot_r_citations


########################################
# Views per referenced scientific work #
########################################
plot_r_views <- ggplot(data_ref, aes(x= reorder(Marker, +Views), y=Views)) +
  ggtitle("Views per scientific work (from the references of this paper)") +
  geom_bar(stat='identity', position='dodge', colour="black", aes(color=Category, fill=Category)) +
  scale_fill_manual("Category", values = c("Author" = "red", "Other" = "blue")) + 
  theme(axis.text.x = element_text(size=8),
        legend.position = c(0.1, 0.8)) + 
  labs(x = "Identifier based on reference in this paper")
plot_r_views


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
png(file="paper03-references-citations.png")
plot_r_citations
dev.off()

png(file="paper03-references-views.png")
plot_r_views
dev.off()

png(file="paper03-references-publishers.png")
plot_r_publishers
dev.off()

# Print tables to a png file:
png(file="paper03-references-official.png",
    height = 25*nrow(data_ref_off),
    width = 300*ncol(data_ref_off))
grid.table(data_ref_off)
dev.off()

