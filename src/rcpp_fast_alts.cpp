// -*- mode: C++; c-indent-level: 4; c-basic-offset: 4; indent-tabs-mode: nil; -*-

// we only include RcppArmadillo.h which pulls Rcpp.h in for us
#include "RcppArmadillo.h"

// via the depends attribute we tell Rcpp to create hooks for
// RcppArmadillo so that the build process will know what to do
//
// [[Rcpp::depends(RcppArmadillo)]]

// simple example of creating two matrices and
// returning the result of an operatioon on them
//
// [[Rcpp::export]]
arma::mat mvrnormArma(arma::vec mu, arma::mat sigma) {
  arma::mat Y = arma::randn(1, sigma.n_cols);

  return arma::repmat(mu, 1, 1).t() + Y * sigma;
}
