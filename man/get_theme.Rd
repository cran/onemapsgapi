% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_theme.R
\name{get_theme}
\alias{get_theme}
\title{Get Theme Data from OneMap.Sg}
\usage{
get_theme(token, theme, extents = NULL, return_info = FALSE)
}
\arguments{
\item{token}{User's API token. This can be retrieved using \code{\link{get_token}}}

\item{theme}{OneMap theme in its \code{QUERYNAME} format. A tibble of available themes can be retrieved using \code{\link{search_themes}}}

\item{extents}{Optional Location Extents for search. This should be in the format "Lat1,\%20Lng1,Lat2,\%20Lng2". For more information, consult the \href{https://docs.onemap.sg/#retrieve-theme}{API Documentation}.}

\item{return_info}{Default = \code{FALSE}. If \code{FALSE}, function only returns a tibble for query results. If \code{TRUE}, function returns output as a list containing a tibble for query information and a tibble for query results.}
}
\value{
If no error occurs:
\describe{
  \item{query_info}{A 1 x 7 tibble containing information about the query. The variables are \code{FeatCount}, \code{Theme_Name}, \code{Category}, \code{Owner}, \code{DateTime.date}, \code{DateTime.timezone_type}, \code{DateTime.timezone}}
  \item{query_result}{Retuned if return_info = \code{TRUE}. A tibble containing the data retrieved from the query. The columns and rows vary depending on theme and user specification, however all tibbles will contain the variables: \code{NAME}, \code{DESCRIPTION}, \code{ADDRESSPOSTALCODE}, \code{ADDRESSSTREETNAME}, \code{Lat}, \code{Lng}, \code{ICON_NAME}}
}

If an error occurs, the output will be \code{NULL}, along with a warning message.
For non-error queries where 0 results are returned, the output will be \code{query_info}, along with a warning message.
}
\description{
This function is a wrapper for the \href{https://docs.onemap.sg/#retrieve-theme}{Retrieve Theme API}. It returns the data as cleaned tibbles.
}
\examples{
# returns a tibble of output
\dontrun{get_theme(token, "hotels")}
\dontrun{get_theme(token, "monuments",
    extents = "1.291789,\%20103.7796402,1.3290461,\%20103.8726032")}

# returns a list of status tibble and output tibble
\dontrun{get_theme(token, "lighting", return_info = TRUE)}

# error: output is NULL, warning message shows status code
\dontrun{get_theme("invalid_token", "hotels")}

# error: output is NULL, warning message shows error message from request
\dontrun{get_theme(token, "non-existent-theme")}

# error: output is \code{query_info}, warning message query did not return any records
\dontrun{get_theme(token, "ura_parking_lot", "1.291789,\%20103.7796402,1.3290461,\%20103.8726032")}
}
