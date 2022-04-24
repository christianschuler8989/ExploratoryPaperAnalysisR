# R-Script
# 
# Analysis and visualisation of different distributions for the authors of
# by the main-paper referenced scientific works
#
# Author: Christian Schuler
# Date: 2022 Apr
################################################################################
# Group authors by 
# "referenced by current paper"
# "associated with university hamburg"
# "legendary authors"

################################################
# Creating sub-dataframes for separat plotting #
################################################
data_aut_ref <- data_aut %>% dplyr::filter(IdentifierGroup == "Reference")
data_aut_ham <- data_aut %>% dplyr::filter(IdentifierGroup == "Hamburg")
data_aut_leg <- data_aut %>% dplyr::filter(IdentifierGroup == "Legends")


###########################
# Publications per author #
###########################
plot_a_publications_ref <- ggplot(data_aut_ref, aes(x= reorder(Name, +Publications), y=Publications)) +
  ggtitle("Publications per author (from the references of this paper)") +
  geom_bar(stat='identity', position='dodge', colour="black", aes(color=IdentifierGroup, fill=IdentifierGroup)) +
  scale_fill_manual("Groups", values = c("Reference" = "blue", "Hamburg" = "red", "Legends" = "green")) + 
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1, size=8),
        legend.position = c(0.2, 0.7)) +
  labs(x = "Authors from the reference-section of the current paper")
#plot_a_publications_ref

plot_a_publications_ham <- ggplot(data_aut_ham, aes(x= reorder(Name, +Publications), y=Publications)) +
  ggtitle("Publications per author (from University of Hamburg)") +
  geom_bar(stat='identity', position='dodge', colour="black", aes(color=IdentifierGroup, fill=IdentifierGroup)) +
  scale_fill_manual("Groups", values = c("Reference" = "blue", "Hamburg" = "red", "Legends" = "green")) + 
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1, size=8),
        legend.position = c(0.2, 0.7)) +
  labs(x = "Authors from University Hamburg")
#plot_a_publications_ham

plot_a_publications_leg <- ggplot(data_aut_leg, aes(x= reorder(Name, +Publications), y=Publications)) +
  ggtitle("Publications per author (from legendary scientists of history)") +
  geom_bar(stat='identity', position='dodge', colour="black", aes(color=IdentifierGroup, fill=IdentifierGroup)) +
  scale_fill_manual("Groups", values = c("Reference" = "blue", "Hamburg" = "red", "Legends" = "green")) + 
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1, size=8),
        legend.position = c(0.2, 0.7)) +
  labs(x = "Legendary authors")
#plot_a_publications_leg

plot_a_publications_all <- ggplot(data_aut, aes(x= reorder(Name, +Publications), y=Publications)) +
  ggtitle("Publications per author (all of them)") +
  geom_bar(stat='identity', position='dodge', colour="black", aes(color=IdentifierGroup, fill=IdentifierGroup)) +
  scale_fill_manual("Groups", values = c("Reference" = "blue", "Hamburg" = "red", "Legends" = "green")) + 
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1, size=6),
        legend.position = c(0.2, 0.7)) +
  labs(x = "All authors")
#plot_a_publications_all


########################
# Citations per author #
########################
plot_a_citations_ref <- ggplot(data_aut_ref, aes(x= reorder(Name, +Citations), y=Citations)) +
  ggtitle("Citations per author (from the references of this paper)") +
  geom_bar(stat='identity', position='dodge', colour="black", aes(color=IdentifierGroup, fill=IdentifierGroup)) +
  scale_fill_manual("Groups", values = c("Reference" = "blue", "Hamburg" = "red", "Legends" = "green")) + 
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1, size=8),
        legend.position = c(0.2, 0.7)) +
  labs(x = "Authors from the reference-section of the current paper")
#plot_a_citations_ref

plot_a_citations_ham <- ggplot(data_aut_ham, aes(x= reorder(Name, +Citations), y=Citations)) +
  ggtitle("Citations per author (from University of Hamburg)") +
  geom_bar(stat='identity', position='dodge', colour="black", aes(color=IdentifierGroup, fill=IdentifierGroup)) +
  scale_fill_manual("Groups", values = c("Reference" = "blue", "Hamburg" = "red", "Legends" = "green")) + 
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1, size=8),
        legend.position = c(0.2, 0.7)) +
  labs(x = "Author from University Hamburg")
#plot_a_citations_ham

plot_a_citations_leg <- ggplot(data_aut_leg, aes(x= reorder(Name, +Citations), y=Citations)) +
  ggtitle("Citations per author (from legendary scientists of history)") +
  geom_bar(stat='identity', position='dodge', colour="black", aes(color=IdentifierGroup, fill=IdentifierGroup)) +
  scale_fill_manual("Groups", values = c("Reference" = "blue", "Hamburg" = "red", "Legends" = "green")) + 
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1, size=8),
        legend.position = c(0.2, 0.7)) +
  labs(x = "Legendary authors")
#plot_a_citations_leg

plot_a_citations_all <- ggplot(data_aut, aes(x= reorder(Name, +Citations), y=Citations)) +
  ggtitle("Citations per author (all of them)") +
  geom_bar(stat='identity', position='dodge', colour="black", aes(color=IdentifierGroup, fill=IdentifierGroup)) +
  scale_fill_manual("Groups", values = c("Reference" = "blue", "Hamburg" = "red", "Legends" = "green")) + 
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1, size=6),
        legend.position = c(0.2, 0.7)) +
  labs(x = "All authors")
#plot_a_citations_all


######################
# H-Index per author #
######################
plot_a_hindex_ref <- ggplot(data_aut_ref, aes(x= reorder(Name, +Hindex), y=Hindex)) +
  ggtitle("H-Index per author (from the references of this paper)") +
  geom_bar(stat='identity', position='dodge', colour="black", aes(color=IdentifierGroup, fill=IdentifierGroup)) +
  scale_fill_manual("Groups", values = c("Reference" = "blue", "Hamburg" = "red", "Legends" = "green")) + 
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1, size=8),
        legend.position = c(0.2, 0.7)) +
  labs(x = "Authors from the reference-section of the current paper")
#plot_a_hindex_ref

plot_a_hindex_ham <- ggplot(data_aut_ham, aes(x= reorder(Name, +Hindex), y=Hindex)) +
  ggtitle("H-Index per author (from University of Hamburg)") +
  geom_bar(stat='identity', position='dodge', colour="black", aes(color=IdentifierGroup, fill=IdentifierGroup)) +
  scale_fill_manual("Groups", values = c("Reference" = "blue", "Hamburg" = "red", "Legends" = "green")) + 
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1, size=8),
        legend.position = c(0.2, 0.7)) +
  labs(x = "Author from University Hamburg")
#plot_a_hindex_ham

plot_a_hindex_leg <- ggplot(data_aut_leg, aes(x= reorder(Name, +Hindex), y=Hindex)) +
  ggtitle("H-Index per author (from legendary scientists of history)") +
  geom_bar(stat='identity', position='dodge', colour="black", aes(color=IdentifierGroup, fill=IdentifierGroup)) +
  scale_fill_manual("Groups", values = c("Reference" = "blue", "Hamburg" = "red", "Legends" = "green")) + 
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1, size=8),
        legend.position = c(0.2, 0.7)) +
  labs(x = "Legendary authors")
#plot_a_hindex_leg

plot_a_hindex_all <- ggplot(data_aut, aes(x= reorder(Name, +Hindex), y=Hindex)) +
  ggtitle("H-Index per author (all of them)") +
  geom_bar(stat='identity', position='dodge', colour="black", aes(color=IdentifierGroup, fill=IdentifierGroup)) +
  scale_fill_manual("Groups", values = c("Reference" = "blue", "Hamburg" = "red", "Legends" = "green")) + 
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1, size=6),
        legend.position = c(0.2, 0.7)) +
  labs(x = "All authors")
#plot_a_hindex_all


############################################
# Saving plots as png in current directory #
############################################
png(file="paper03-authors-publications-reference.png",
    height=800, width=800)
plot_a_publications_ref
dev.off()
png(file="paper03-authors-publications-hamburg.png",
    height=800, width=800)
plot_a_publications_ham
dev.off()
png(file="paper03-authors-publications-legends.png",
    height=800, width=800)
plot_a_publications_leg
dev.off()
png(file="paper03-authors-publications-all.png",
    height=800, width=800)
plot_a_publications_all
dev.off()

png(file="paper03-authors-citations-reference.png",
    height=800, width=800)
plot_a_citations_ref
dev.off()
png(file="paper03-authors-citations-hamburg.png",
    height=800, width=800)
plot_a_citations_ham
dev.off()
png(file="paper03-authors-citations-legends.png",
    height=800, width=800)
plot_a_citations_leg
dev.off()
png(file="paper03-authors-citations-all.png",
    height=800, width=800)
plot_a_citations_all
dev.off()

png(file="paper03-authors-hindex-reference.png",
    height=800, width=800)
plot_a_hindex_ref
dev.off()
png(file="paper03-authors-hindex-hamburg.png",
    height=800, width=800)
plot_a_hindex_ham
dev.off()
png(file="paper03-authors-hindex-legends.png",
    height=800, width=800)
plot_a_hindex_leg
dev.off()
png(file="paper03-authors-hindex-all.png",
    height=800, width=800)
plot_a_hindex_all
dev.off()
