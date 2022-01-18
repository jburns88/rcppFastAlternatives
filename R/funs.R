#' @title Rcpp fast alternative to mvrnorm
#' @description
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
#' @description
#' @param Mu
#' @param Sigma
#' @import dplyr
#' @export
mvrnorm.fast <- function(Mu, Sigma) {

  return(setNames(as.vector(mvrnormArma(Mu, Sigma)), colnames(Sigma)))

}
