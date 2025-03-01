% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_departments_list.R
\name{get_departments_list}
\alias{get_departments_list}
\title{Get the List of Departments in Colombia}
\usage{
get_departments_list()
}
\value{
A data frame with the following columns:
\itemize{
  \item \code{id}: The unique identifier of the department.
  \item \code{name}: The name of the department.
  \item \code{surface}: The surface area of the department in square kilometers.
  \item \code{population}: The population of the department.
}
}
\description{
This function retrieves a list of departments in Colombia from the public API
"https://api-colombia.com/api/v1/Department" and returns a data frame containing
selected information about each department, ordered by department name in alphabetical order.
}
\details{
This function sends a GET request to the API, processes the JSON response,
and converts it into a structured data frame. The data is filtered and formatted
to include only relevant columns (\code{id}, \code{name}, \code{surface}, \code{population}),
and it is ordered by the \code{name} column in alphabetical order (A to Z).

If the API returns a status code other than 200, the function issues a message
with the status code received and returns \code{NULL}.
}
\note{
Ensure you have an active internet connection to access the API. If the API structure changes
or the API becomes unavailable, the function may need modifications.

This function relies on the following packages: \code{httr}, \code{jsonlite}, \code{dplyr}, and \code{magrittr}.
The \code{\%>\%} operator, used for chaining commands, is provided by the \code{magrittr} package.
}
\examples{
\dontrun{
# Retrieve the list of departments
departments <- get_departments_list()

# Print the data frame
print(departments)

# View the data in a spreadsheet-like interface
View(departments)

# Select departments with a specific population range
large_departments <- departments \%>\%
  filter(population > 1000000)
print(large_departments)
}

}
\seealso{
\code{\link[httr]{GET}},
\code{\link[jsonlite]{fromJSON}},
\code{\link[dplyr]{select}},
\code{\link[dplyr]{arrange}}
}
