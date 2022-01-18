#' @title Rcpp fast alternative to mvrnorm
#' @description Rcpp function to generate vector of correlated random deviates
#' @param Mu vector of means
#' @param Sigma cholsky decomposed covariance matrix
#' @import Rcpp
#' @export
Rcpp::cppFunction(
  depends = "RcppArmadillo",
  'arma::mat mvrnormArma(arma::vec mu, arma::mat sigma) {
   arma::mat Y = arma::randn(1, sigma.n_cols);
   return arma::repmat(mu, 1, 1).t() + Y * sigma;
}
')

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
