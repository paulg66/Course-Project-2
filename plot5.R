require(dplyr)
require(ggplot2)
Emissions <- summarise(group_by(NEI,year,fips,type),Emissions = sum(Emissions))
OnRoad <- Emissions[which(Emissions$type == "ON-ROAD"& Emissions$fips == "24510"),]
png("plot5.png", width=480, height=480)
g <- ggplot(OnRoad, aes(x=factor(year), y=Emissions, fill=year))
g + geom_bar(stat="identity") +xlab("year") + ylab("PM25 Emissions in tons") + ggtitle("Vehicle Related Emissions in Baltimore by Year")
dev.off()