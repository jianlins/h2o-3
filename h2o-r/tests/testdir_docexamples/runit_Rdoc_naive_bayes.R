setwd(normalizePath(dirname(R.utils::commandArgs(asValues=TRUE)$"f")))
source("../../scripts/h2o-r-test-setup.R")



test.rdoc_naive_bayes.golden <- function() {
  
  votesPath <- locate("smalldata/extdata/housevotes.csv")
  votes.hex <- h2o.uploadFile(path = votesPath, header = TRUE)
  h2o.naiveBayes(x = 2:17, y = 1, training_frame = votes.hex, laplace = 3)
  
  
}

doTest("R Doc Naive Bayes", test.rdoc_naive_bayes.golden)
