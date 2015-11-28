# HOC scripts

# png pixel to number colouring sheet
# 0 - black, 1 - red, 2 - green, 3 - yellow, 4 - blue, 5 - magenta, 6 - cyan, 7 - white

# load png library read png file
library(png)

pngFilename <- "test2.png"
csvFilename <- sub(".png",".csv",pngFilename)
txtFilename <- sub(".png",".txt",pngFilename)

pngData <- readPNG(pngFilename)

# create the final indexed colour array

arraySize <- length(pngData[,,1])
indexColArray <- array(1, c(arraySize,arraySize))

# extract out RGB channels
arrayRed <- pngData[,,1]
arrayGreen <- pngData[,,2]
arrayBlue <- pngData[,,3]

# combine into 3 bit RGB
indexColArray <- round(arrayRed,0) + 2*round(arrayGreen,0) + 4*round(arrayBlue,0)

# write to csv
# just for fun, not used if using the javascript pixel art converter
# write.csv(indexColArray,csvFilename,row.names=F)

# write to plain file
write.table(indexColArray,txtFilename,sep="",row.names=F,col.names=F)
