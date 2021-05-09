#' ---
#' title: "Interactive Tables"
#' subtitle: "with DT, knitr, RMarkdown"
#' author: "Janani Ravi"
#' date: "May 09, 2021"
#' output: html_document
#' ---

#' ## [Slides here](index.html)

library(tidyverse)

glimpse(iris)
iris <- iris[,c(5,1:4)]
glimpse(iris)

#' ## Tables using knitr, kableExtra, & rmarkdown
## Using kable
library(knitr)
iris %>%
	head %>%
	kable()

## Using kableExtra
library(kableExtra)
iris %>% head %>%
	kable(caption = "Table 1. Annotate with kableExtra") %>%
	kable_styling(c("striped", "hover", "condensed"), full_width = F,
								position = "left") %>%
	add_header_above(c("categorical"=1, "numerical" = 4)) %>%
	column_spec(1, bold = T) %>%
	row_spec(0, italic = T)

#' ### Using RMarkdown | works with Rmd files
library(rmarkdown)
paged_table(iris)

#' ## Tables using DT
#' ### Simple datatable
iris %>%
	DT::datatable()

#' ### With added features (using DT)
iris %>%
	DT::datatable(extensions = c('Buttons', 'FixedColumns', 'RowReorder'),
								filter = 'top',
								caption = 'Iris table using DT datatable',
								options = list(
									autoWidth = TRUE,
									pageLength = 10, # dom = 'Bfrtip',
									buttons=list(list(extend = 'colvis', columns = c(3:5))),
									# fixedColumns = list(leftColumns = 2), #, rightColumns = 1),
									rowReorder = TRUE, order = list(c(0, 'asc')),
									scrollX = TRUE,
									lengthMenu = c(10, 25, 100)
								))

#' ### References
#' - knitr: https://yihui.org/knitr/
#' - kableExtra: https://haozhu233.github.io/kableExtra/
#' - rmarkdown: https://rmarkdown.rstudio.com/
#' - DT: https://rstudio.github.io/DT/
#'
#'
#' ### How to reach me?
#' - Email: [janani@msu.edu](mailto:janani@msu.edu)
#' - Webpage: [jravilab.github.io](https://jravilab.github.io)
#' - Twitter: [\@janani137](https://twitter.com/janani137)
