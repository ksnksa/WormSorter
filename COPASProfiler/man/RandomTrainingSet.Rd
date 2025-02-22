% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/RandomTrainingSet.R
\name{RandomTrainingSet}
\alias{RandomTrainingSet}
\title{Create random training set and prediction set}
\usage{
RandomTrainingSet(StageChannelData, WormIDs, SizeGood, SizeBad)
}
\arguments{
\item{StageChannelData}{The channel data}

\item{WormIDs}{File containing annotated worm IDs of the channel data.}

\item{SizeGood}{How many good worms to be included in the training set.}

\item{SizeBad}{How many bad worms to be included in the training set.}
}
\value{
List containing the training set and the prediction set.
}
\description{
The function takes in the worm data set and creates a training set and a prediction set based on the input parameters.
The parameters are: The category each worm is in, how many good worms and how many bad worms to include in the
training set.
Each output will provide a different training and prediction set. Consequently, allowing the user to
measure the accuracy of the clustering/categorizing algorithm.
}
