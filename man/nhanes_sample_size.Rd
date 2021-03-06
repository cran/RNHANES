% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sample_size.R
\name{nhanes_sample_size}
\alias{nhanes_sample_size}
\title{Compute the sample size of NHANES data}
\usage{
nhanes_sample_size(nhanes_data, column, comment_column = "",
  weights_column = "", filter = NULL)
}
\arguments{
\item{nhanes_data}{data frame containing NHANES data}

\item{column}{column name of the variable to compute quantiles for}

\item{comment_column}{comment column name of the variable for checking if computed quantiles are below the LOD}

\item{weights_column}{name of the weights column}

\item{filter}{logical expression used to subset the data}
}
\value{
a data frame
}
\description{
Compute the sample size of NHANES data
}
\examples{

\dontrun{
dat <- nhanes_load_data("UHG_G", "2011-2012", demographics = TRUE)

nhanes_sample_size(dat, "URXUHG", "URDUHGLC")
}

}

