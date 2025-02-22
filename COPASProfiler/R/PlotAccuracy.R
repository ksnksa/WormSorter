#' Plots the accuracy
#'
#' The function takes in the accuracy vector and the Set number and the bad worm sample size, and plots
#' the accuracy of the model against different number of good worms in the training set.
#'
#' @param Accuracy The accuracy data set from the bootstrap for loop
#' @param SetNumber The vector containing the different numbers of good worms in the training set
#' @param BadWormSampleSize How many bad worms in the training set
#'
#' @return Returns the accuracy plot of the model
#' @export


PlotAccuracy <- function(Accuracy, SetNumber, BadWormSampleSize) {

  if(missing(Accuracy)){
    stop('Missing Accuracy input')
  } else if(missing(SetNumber)) {
    stop('Missing SetNumber input')
  }else if(missing(BadWormSampleSize)) {
    stop('Missing BadWormSampleSize input')
  } else if(typeof(Accuracy) != 'list') {
    stop('Accuracy type is expected to be list, please provide the correct input type')
  } else if(typeof(SetNumber) != 'double') {
    stop('SetNumber type is expected to be double, please provide the correct input type')
  } else if(typeof(BadWormSampleSize) != 'double') {
    stop('BadWormSampleSize type is expected to be double, please provide the correct input type')
  }
  if(!require("ggplot2")){
    library("ggplot2")
  }
  y <- matrix()
  std <- matrix()
  NumberOfGoodWorms <- matrix()
  for (x in 1:dim(Accuracy)[1]) {
    y[x] <- mean(as.numeric(Accuracy[x,]))
    std[x] <- sd(as.numeric(Accuracy[x,]))
    NumberOfGoodWorms[x] <- as.character(SetNumber[x])
  }
  df <- data.frame(Mean=y, sd=std, NumberOfGoodWorms = NumberOfGoodWorms)
  df <- df[dim(df)[1]:1,]
  df$NumberOfGoodWorms <- factor(df$NumberOfGoodWorms, levels=unique(df$NumberOfGoodWorms))
  plots <- ggplot(df,aes(x=NumberOfGoodWorms))+geom_boxplot(aes(lower=Mean-sd,upper=Mean+sd,middle=Mean,ymin=Mean-3*sd,ymax=Mean+3*sd),stat="identity") +
    theme_minimal() + theme(plot.title = element_text(size=15)) +
    ylab("Accuracy %")  +
    ggtitle(paste('Accuracy with ',BadWormSampleSize,' bad worms.', sep = ''))
  return(plots)

}

