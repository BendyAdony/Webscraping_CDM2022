##Copa del mundo##

#library
library(rvest)
library(dplyr)
library(ggplot2)

#recuperation de donnees
CDM="https://www.skysports.com/world-cup-table"
CDM_dataread=read_html(CDM)
table_CDM=html_table(CDM_dataread, fill = TRUE)
length(table_CDM)
g<-bind_rows(table_CDM[[1]],table_CDM[[2]],
             table_CDM[[3]],table_CDM[[4]],
             table_CDM[[5]],table_CDM[[6]],
             table_CDM[[7]],table_CDM[[8]])
CDM_team<-as.data.frame(g)
Top_team<-CDM_team[,c(2,10)]
Top_team1<-Top_team%>%arrange(desc(Pts))
Top_team2<-Top_team1[c(1:10),]
ggplot()+
  geom_col(data=Top_team2,aes(x=Team,y=Pts,fill=Team))+
  ggtitle("Pays avec plus de Pts en phase de groupe : CDM2022")
