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
  ggtitle("Publications per author (from this paper)") +
  geom_bar(stat='identity', position='dodge', colour="black", aes(color=IdentifierGroup, fill=IdentifierGroup)) +
  scale_fill_manual("Groups", values = c("Reference" = "blue", "Hamburg" = "red", "Legends" = "green")) + 
  theme(axis.text.x = element_text(angle = 45, vjust = 0.8, hjust = 0.5, size=16),
        axis.text.y = element_text(size=16),
        legend.position = c(0.15, 0.8), 
        legend.key.size = unit(2, 'cm'),
        legend.text = element_text(size=16)) +
  labs(x = "Authors from the reference-section of the current paper")
#plot_a_publications_ref

plot_a_publications_ham <- ggplot(data_aut_ham, aes(x= reorder(Name, +Publications), y=Publications)) +
  ggtitle("Publications per author (from University of Hamburg)") +
  geom_bar(stat='identity', position='dodge', colour="black", aes(color=IdentifierGroup, fill=IdentifierGroup)) +
  scale_fill_manual("Groups", values = c("Reference" = "blue", "Hamburg" = "red", "Legends" = "green")) + 
  theme(axis.text.x = element_text(angle = 45, vjust = 0.8, hjust = 0.5, size=16),
        axis.text.y = element_text(size=16),
        legend.position = c(0.15, 0.8), 
        legend.key.size = unit(2, 'cm'),
        legend.text = element_text(size=16)) +
  labs(x = "Authors from University Hamburg")
#plot_a_publications_ham

plot_a_publications_leg <- ggplot(data_aut_leg, aes(x= reorder(Name, +Publications), y=Publications)) +
  ggtitle("Publications per author (from legendary scientists of history)") +
  geom_bar(stat='identity', position='dodge', colour="black", aes(color=IdentifierGroup, fill=IdentifierGroup)) +
  scale_fill_manual("Groups", values = c("Reference" = "blue", "Hamburg" = "red", "Legends" = "green")) + 
  theme(axis.text.x = element_text(angle = 45, vjust = 0.8, hjust = 0.5, size=16),
        axis.text.y = element_text(size=16),
        legend.position = c(0.15, 0.8), 
        legend.key.size = unit(2, 'cm'),
        legend.text = element_text(size=16)) +
  labs(x = "Legendary authors")
#plot_a_publications_leg

plot_a_publications_all <- ggplot(data_aut, aes(x= reorder(Name, +Publications), y=Publications)) +
  ggtitle("Publications per author (all of them)") +
  geom_bar(stat='identity', position='dodge', colour="black", aes(color=IdentifierGroup, fill=IdentifierGroup)) +
  scale_fill_manual("Groups", values = c("Reference" = "blue", "Hamburg" = "red", "Legends" = "green")) + 
  theme(axis.text.x = element_text(angle = 45, vjust = 0.8, hjust = 0.5, size=16),
        axis.text.y = element_text(size=16),
        legend.position = c(0.15, 0.8), 
        legend.key.size = unit(2, 'cm'),
        legend.text = element_text(size=16)) +
  labs(x = "All authors")
#plot_a_publications_all


########################
# Citations per author #
########################
plot_a_citations_ref <- ggplot(data_aut_ref, aes(x= reorder(Name, +Citations), y=Citations)) +
  ggtitle("Citations per author (from this paper)") +
  geom_bar(stat='identity', position='dodge', colour="black", aes(color=IdentifierGroup, fill=IdentifierGroup)) +
  scale_y_continuous(labels = label_number()) +
  scale_fill_manual("Groups", values = c("Reference" = "blue")) + 
  theme(axis.text.x = element_text(angle = 45, vjust = 0.8, hjust = 0.5, size=16),
        axis.text.y = element_text(size=16),
        legend.position = c(0.15, 0.8), 
        legend.key.size = unit(2, 'cm'),
        legend.text = element_text(size=16)) +
  labs(x = "Authors from the reference-section of the current paper")
#plot_a_citations_ref

plot_a_citations_ham <- ggplot(data_aut_ham, aes(x= reorder(Name, +Citations), y=Citations)) +
  ggtitle("Citations per author (from University of Hamburg)") +
  geom_bar(stat='identity', position='dodge', colour="black", aes(color=IdentifierGroup, fill=IdentifierGroup)) +
  scale_y_continuous(labels = label_number()) +
  scale_fill_manual("Groups", values = c("Hamburg" = "red")) + 
  theme(axis.text.x = element_text(angle = 45, vjust = 0.8, hjust = 0.5, size=16),
        axis.text.y = element_text(size=16),
        legend.position = c(0.15, 0.8), 
        legend.key.size = unit(2, 'cm'),
        legend.text = element_text(size=16)) +
  labs(x = "Author from University Hamburg")
#plot_a_citations_ham

plot_a_citations_leg <- ggplot(data_aut_leg, aes(x= reorder(Name, +Citations), y=Citations)) +
  ggtitle("Citations per author (from legendary scientists of history)") +
  geom_bar(stat='identity', position='dodge', colour="black", aes(color=IdentifierGroup, fill=IdentifierGroup)) +
  scale_y_continuous(labels = label_number()) +
  scale_fill_manual("Groups", values = c("Legends" = "green")) + 
  theme(axis.text.x = element_text(angle = 45, vjust = 0.8, hjust = 0.5, size=16),
        axis.text.y = element_text(size=16),
        legend.position = c(0.15, 0.8), 
        legend.key.size = unit(2, 'cm'),
        legend.text = element_text(size=16)) +
  labs(x = "Legendary authors")
#plot_a_citations_leg

plot_a_citations_all <- ggplot(data_aut, aes(x= reorder(Name, +Citations), y=Citations)) +
  ggtitle("Citations per author (all of them)") +
  geom_bar(stat='identity', position='dodge', colour="black", aes(color=IdentifierGroup, fill=IdentifierGroup)) +
  scale_y_continuous(labels = label_number()) +
  scale_fill_manual("Groups", values = c("Reference" = "blue", "Hamburg" = "red", "Legends" = "green")) + 
  theme(axis.text.x = element_text(angle = 45, vjust = 0.8, hjust = 0.5, size=16),
        axis.text.y = element_text(size=16),
        legend.position = c(0.15, 0.8), 
        legend.key.size = unit(2, 'cm'),
        legend.text = element_text(size=16)) +
  labs(x = "All authors")
#plot_a_citations_all


######################
# H-Index per author #
######################
plot_a_hindex_ref <- ggplot(data_aut_ref, aes(x= reorder(Name, +Hindex), y=Hindex)) +
  ggtitle("H-Index per author (from this paper)") +
  geom_bar(stat='identity', position='dodge', colour="black", aes(color=IdentifierGroup, fill=IdentifierGroup)) +
  scale_fill_manual("Groups", values = c("Reference" = "blue", "Hamburg" = "red", "Legends" = "green")) + 
  theme(axis.text.x = element_text(angle = 45, vjust = 0.8, hjust = 0.5, size=16),
        axis.text.y = element_text(size=16),
        legend.position = c(0.15, 0.8), 
        legend.key.size = unit(2, 'cm'),
        legend.text = element_text(size=16)) +
  labs(x = "Authors from the reference-section of the current paper")
#plot_a_hindex_ref

plot_a_hindex_ham <- ggplot(data_aut_ham, aes(x= reorder(Name, +Hindex), y=Hindex)) +
  ggtitle("H-Index per author (from University of Hamburg)") +
  geom_bar(stat='identity', position='dodge', colour="black", aes(color=IdentifierGroup, fill=IdentifierGroup)) +
  scale_fill_manual("Groups", values = c("Reference" = "blue", "Hamburg" = "red", "Legends" = "green")) + 
  theme(axis.text.x = element_text(angle = 45, vjust = 0.8, hjust = 0.5, size=16),
        axis.text.y = element_text(size=16),
        legend.position = c(0.15, 0.8), 
        legend.key.size = unit(2, 'cm'),
        legend.text = element_text(size=16)) +
  labs(x = "Author from University Hamburg")
#plot_a_hindex_ham

plot_a_hindex_leg <- ggplot(data_aut_leg, aes(x= reorder(Name, +Hindex), y=Hindex)) +
  ggtitle("H-Index per author (from legendary scientists of history)") +
  geom_bar(stat='identity', position='dodge', colour="black", aes(color=IdentifierGroup, fill=IdentifierGroup)) +
  scale_fill_manual("Groups", values = c("Reference" = "blue", "Hamburg" = "red", "Legends" = "green")) + 
  theme(axis.text.x = element_text(angle = 45, vjust = 0.8, hjust = 0.5, size=16),
        axis.text.y = element_text(size=16),
        legend.position = c(0.15, 0.8), 
        legend.key.size = unit(2, 'cm'),
        legend.text = element_text(size=16)) +
  labs(x = "Legendary authors")
#plot_a_hindex_leg

plot_a_hindex_all <- ggplot(data_aut, aes(x= reorder(Name, +Hindex), y=Hindex)) +
  ggtitle("H-Index per author (all of them)") +
  geom_bar(stat='identity', position='dodge', colour="black", aes(color=IdentifierGroup, fill=IdentifierGroup)) +
  scale_fill_manual("Groups", values = c("Reference" = "blue", "Hamburg" = "red", "Legends" = "green")) + 
  theme(axis.text.x = element_text(angle = 45, vjust = 0.8, hjust = 0.5, size=16),
        axis.text.y = element_text(size=16),
        legend.position = c(0.15, 0.8), 
        legend.key.size = unit(2, 'cm'),
        legend.text = element_text(size=16)) +
  labs(x = "All authors")
#plot_a_hindex_all


############################################
# Saving plots as png in current directory #
############################################
png(file="authors-publications-reference.png",
    height=800, width=800)
plot_a_publications_ref
dev.off()
png(file="authors-publications-hamburg.png",
    height=800, width=800)
plot_a_publications_ham
dev.off()
png(file="authors-publications-legends.png",
    height=800, width=800)
plot_a_publications_leg
dev.off()
png(file="authors-publications-all.png",
    height=800, width=800)
plot_a_publications_all
dev.off()

png(file="authors-citations-reference.png",
    height=800, width=800)
plot_a_citations_ref
dev.off()
png(file="authors-citations-hamburg.png",
    height=800, width=800)
plot_a_citations_ham
dev.off()
png(file="authors-citations-legends.png",
    height=800, width=800)
plot_a_citations_leg
dev.off()
png(file="authors-citations-all.png",
    height=800, width=800)
plot_a_citations_all
dev.off()

png(file="authors-hindex-reference.png",
    height=800, width=800)
plot_a_hindex_ref
dev.off()
png(file="authors-hindex-hamburg.png",
    height=800, width=800)
plot_a_hindex_ham
dev.off()
png(file="authors-hindex-legends.png",
    height=800, width=800)
plot_a_hindex_leg
dev.off()
png(file="authors-hindex-all.png",
    height=800, width=800)
plot_a_hindex_all
dev.off()

################################################################################
setwd(dir_init)
