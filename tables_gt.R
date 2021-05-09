#' ---
#' title: "Colorful Tables"
#' subtitle: "with GT and flextable"
#' author: "Janani Ravi"
#' date: "May 09, 2021"
#' output: github_document
#' ---

#' ## [Slides here](index.html)


# Necessary packages
library(tidyverse)
library(gapminder)

gapminder

## Reduce the dataset to a summarized form
gapminder_sum <- gapminder %>%
	group_by(continent, year) %>%
	summarise(AvgLifeExp=mean(lifeExp),
						AvgPop=mean(pop),
						AvgGDP=mean(gdpPercap)) %>%
	filter(year>1990)
gapminder_sum

#' ## Creating tables using GT
library(gt)

#' ### Simple GT table
gapminder_gt1 <- gapminder_sum %>%
	gt()
gapminder_gt1

#' ### With title, subtitle, and footer
gapminder_gt2 <- gapminder_gt1 %>%
	tab_header(
		title=md("Gapminder Table"),
		subtitle="using GT") %>%
	tab_source_note(md("More information on the [GT package](https://gt.rstudio.com/index.html).")) %>%
	cols_align(align="right", columns=TRUE)
gapminder_gt2

#' ### Group columns
gapminder_gt3 <- gapminder_gt2 %>%
	tab_spanner(label="Location", columns=matches("country|continent")) %>%
	tab_spanner(label="Stats", columns=matches("lifeExp|pop|gdp"))
gapminder_gt3

#' ### Group data and add color
gapminder_gt4 <- gapminder_gt3 %>%
	tab_options(
		# Row groups
		row_group.background.color="#3C5488", #FFEFDB80
		row_group.border.top.color="#989898",
	)
gapminder_gt4

#' ### Add LOTS more color!
gapminder_gt5 <- gapminder_gt4 %>%
	tab_options(
		# Headings; Titles
		heading.background.color="#3C5488",
		heading.border.bottom.color="#989898",
		heading.title.font.size="12px",
		heading.subtitle.font.size="11px",
		# Column labels
		column_labels.background.color="#4DBBD5", #B09C85FF
		column_labels.font.size="12px",
		# Stubs
		stub.background.color="#4DBBD5", #B09C85FF
		stub.border.style="dashed",
		stub.border.color="#989898",
		stub.border.width="1px",
		# Row groups
		row_group.background.color="#3C5488", #FFEFDB80
		row_group.border.top.color="#989898",
		row_group.border.bottom.style="none",
		row_group.font.size="12px",
		# Summary rows
		summary_row.border.color="#989898",
		# summary_row.background.color="#FFEBEE",
		# grand_summary_row.background.color="#FFFFFF",
		# Table
		table.font.color="#323232",
		table_body.hlines.color="#989898",
		table_body.border.top.color="#989898",
		table.font.size="10px",
		table.width="80%"
	)
gapminder_gt5


#' ### References
#' - GT: https://gt.rstudio.com/index.html
#' - Also checkout flextable: https://davidgohel.github.io/flextable/
#' <br>
#'
#'
#' ### How to reach me?
#' - Email: [janani@msu.edu](mailto:janani@msu.edu)
#' - Webpage: [jravilab.github.io](https://jravilab.github.io)
#' - Twitter: [\@janani137](https://twitter.com/janani137)
