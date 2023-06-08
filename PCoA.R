rm(list=ls())

install.packages("vegan")
install.packages("ggplot2")
install.packages("ggprism")

library(vegan)
library(ggplot2)
library(ggprism)

otu_raw <- read.table(file="otu.txt",sep="\t",header=T,check.names=FALSE ,row.names=1)
otu <- t(otu_raw)
otu.distance <- vegdist(otu)
PCoA <- cmdscale (otu.distance,eig=TRUE)
pc12 <- PCoA$points[,1:2]
pc <- round(PCoA$eig/sum(PCoA$eig)*100,digits=2)
pc12 <- as.data.frame(pc12)
pc12$samples <- row.names(pc12)
group <- read.table("group.txt", sep='\t', header=T)
colnames(group) <- c("samples","group")
df <- merge(pc12,group,by="samples")
head(df)

ggplot(df,aes(x=V1, y=V2,color=group,shape=group))
  geom_point(size=3)+
  theme_bw()