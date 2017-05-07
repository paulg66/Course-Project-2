require(dplyr)
require(ggplot2)
EmissionsBTLType <- summarise(group_by(NEI,year,fips,type),Emissions = sum(Emissions))
EmissionsBTLType <- subset(EmissionsBTLType, fips == "24510")
EmissionsBTLType <- EmissionsBTLType[order(EmissionsBTLType$year),]
EmissionsBTLType <- EmissionsBTLType[order(EmissionsBTLType$type),]
png("plot3.png", width=750, height=480)
g <- ggplot(EmissionsBTLType, aes(x=factor(year), y=Emissions, fill=type))
g + geom_bar(stat="identity") + facet_grid(. ~ type) + xlab("year") + ylab("PM25 Emissions in tons") + ggtitle("Baltimore PM25 Emissions by Type and Year")
dev.off()
                                                                                                              