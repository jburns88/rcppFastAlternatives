#' @title fast sample from multivariate distribution
#' @description calls mvrnormArma function and names vector of deviates that
#'              it returns
#' @param Mu vector of means
#' @param Sigma cholsky decomposed covariance matrix
#' @import stats
#' @export
mvrnorm.fast <- function(Mu, Sigma) {

  return(setNames(as.vector(mvrnormArma(Mu, Sigma)), colnames(Sigma)))

}
