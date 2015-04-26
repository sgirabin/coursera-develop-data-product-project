library(reshape2)

#internet data
internet <- read.csv('./data/internet.csv')
internetmelt <- melt(internet, id=c('Year','Average'), measure.vars=c('Singapore','Thailand','Malaysia','Indonesia','Philippines','Vietnam','Myanmar','Cambodia'))
names(internetmelt) <- c('year','averageInternet', 'countries', 'countriesInternet')

#mobile data
mobile <- read.csv('./data/mobile.csv')
mobilemelt <- melt(mobile, id=c('Year','Average'), measure.vars=c('Singapore','Thailand','Malaysia','Indonesia','Philippines','Vietnam','Myanmar','Cambodia'))
names(mobilemelt) <- c('year','averageMobile', 'countries', 'countriesMobile')

# combine all datasets above into single data frame
dataset <- merge(internetmelt, mobilemelt, by=c('year','countries'))
write.csv(file='./data/dataset.csv', x=dataset, row.names=FALSE)
