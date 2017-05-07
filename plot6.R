require(dplyr)
require(ggplot2)
require(gridExtra)
Emissions <- summarise(group_by(NEI,year,fips,type),Emissions = sum(Emissions))
OnRoadBTL <- Emissions[which(Emissions$type == "ON-ROAD"& Emissions$fips == "24510"),]
OnRoadLA <- Emissions[which(Emissions$type == "ON-ROAD"& Emissions$fips == "06037"),]
png("plot6.png", width=750, height=750)
g1 <- ggplot(OnRoadBTL, aes(x=factor(year), y=Emissions, fill=year))
g2 <- ggplot(OnRoadLA, aes(x=factor(year), y=Emissions, fill=year))
g1 <- g1 + geom_bar(stat="identity") +xlab("year") + ylab("PM25 Emissions in tons") + ggtitle("Vehicle Related Emissions in Baltimore by Year")
g2 <- g2 + geom_bar(stat="identity") +xlab("year") + ylab("PM25 Emissions in tons") + ggtitle("Vehicle Related Emissions in LA by Year")
grid.arrange(g1, g2, nrow=2)
dev.off()