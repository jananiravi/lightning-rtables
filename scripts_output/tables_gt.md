Colorful Tables
================
Janani Ravi
May 09, 2021

## [Slides here](index.html)

``` r
# Necessary packages
library(tidyverse)
```

    ## ── Attaching packages ─────────────────────────────────────── tidyverse 1.3.1 ──

    ## ✓ ggplot2 3.3.3     ✓ purrr   0.3.4
    ## ✓ tibble  3.1.0     ✓ dplyr   1.0.5
    ## ✓ tidyr   1.1.3     ✓ stringr 1.4.0
    ## ✓ readr   1.4.0     ✓ forcats 0.5.1

    ## ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
    ## x dplyr::filter() masks stats::filter()
    ## x dplyr::lag()    masks stats::lag()

``` r
library(gapminder)

gapminder
```

    ## # A tibble: 1,704 x 6
    ##    country     continent  year lifeExp      pop gdpPercap
    ##    <fct>       <fct>     <int>   <dbl>    <int>     <dbl>
    ##  1 Afghanistan Asia       1952    28.8  8425333      779.
    ##  2 Afghanistan Asia       1957    30.3  9240934      821.
    ##  3 Afghanistan Asia       1962    32.0 10267083      853.
    ##  4 Afghanistan Asia       1967    34.0 11537966      836.
    ##  5 Afghanistan Asia       1972    36.1 13079460      740.
    ##  6 Afghanistan Asia       1977    38.4 14880372      786.
    ##  7 Afghanistan Asia       1982    39.9 12881816      978.
    ##  8 Afghanistan Asia       1987    40.8 13867957      852.
    ##  9 Afghanistan Asia       1992    41.7 16317921      649.
    ## 10 Afghanistan Asia       1997    41.8 22227415      635.
    ## # … with 1,694 more rows

``` r
## Reduce the dataset to a summarized form
gapminder_sum <- gapminder %>%
    group_by(continent, year) %>%
    summarise(AvgLifeExp=mean(lifeExp),
                        AvgPop=mean(pop),
                        AvgGDP=mean(gdpPercap)) %>%
    filter(year>1990)
```

    ## `summarise()` has grouped output by 'continent'. You can override using the `.groups` argument.

``` r
gapminder_sum
```

    ## # A tibble: 20 x 5
    ## # Groups:   continent [5]
    ##    continent  year AvgLifeExp     AvgPop AvgGDP
    ##    <fct>     <int>      <dbl>      <dbl>  <dbl>
    ##  1 Africa     1992       53.6  12674645.  2282.
    ##  2 Africa     1997       53.6  14304480.  2379.
    ##  3 Africa     2002       53.3  16033152.  2599.
    ##  4 Africa     2007       54.8  17875763.  3089.
    ##  5 Americas   1992       69.6  29570964.  8045.
    ##  6 Americas   1997       71.2  31876016.  8889.
    ##  7 Americas   2002       72.4  33990910.  9288.
    ##  8 Americas   2007       73.6  35954847. 11003.
    ##  9 Asia       1992       66.5  94948248.  8640.
    ## 10 Asia       1997       68.0 102523803.  9834.
    ## 11 Asia       2002       69.2 109145521. 10174.
    ## 12 Asia       2007       70.7 115513752. 12473.
    ## 13 Europe     1992       74.4  18604760. 17062.
    ## 14 Europe     1997       75.5  18964805. 19077.
    ## 15 Europe     2002       76.7  19274129. 21712.
    ## 16 Europe     2007       77.6  19536618. 25054.
    ## 17 Oceania    1992       76.9  10459826. 20894.
    ## 18 Oceania    1997       78.2  11120715  24024.
    ## 19 Oceania    2002       79.7  11727414. 26939.
    ## 20 Oceania    2007       80.7  12274974. 29810.

## Creating tables using GT

``` r
library(gt)
```

### Simple GT table

``` r
gapminder_gt1 <- gapminder_sum %>%
    gt()
gapminder_gt1
```

<style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#oewdqyaqqv .gt_table {
  display: table;
  border-collapse: collapse;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#oewdqyaqqv .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#oewdqyaqqv .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#oewdqyaqqv .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 4px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#oewdqyaqqv .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#oewdqyaqqv .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#oewdqyaqqv .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#oewdqyaqqv .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#oewdqyaqqv .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#oewdqyaqqv .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#oewdqyaqqv .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#oewdqyaqqv .gt_group_heading {
  padding: 8px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
}

#oewdqyaqqv .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#oewdqyaqqv .gt_from_md > :first-child {
  margin-top: 0;
}

#oewdqyaqqv .gt_from_md > :last-child {
  margin-bottom: 0;
}

#oewdqyaqqv .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#oewdqyaqqv .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 12px;
}

#oewdqyaqqv .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#oewdqyaqqv .gt_first_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
}

#oewdqyaqqv .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#oewdqyaqqv .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#oewdqyaqqv .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#oewdqyaqqv .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#oewdqyaqqv .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#oewdqyaqqv .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding: 4px;
}

#oewdqyaqqv .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#oewdqyaqqv .gt_sourcenote {
  font-size: 90%;
  padding: 4px;
}

#oewdqyaqqv .gt_left {
  text-align: left;
}

#oewdqyaqqv .gt_center {
  text-align: center;
}

#oewdqyaqqv .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#oewdqyaqqv .gt_font_normal {
  font-weight: normal;
}

#oewdqyaqqv .gt_font_bold {
  font-weight: bold;
}

#oewdqyaqqv .gt_font_italic {
  font-style: italic;
}

#oewdqyaqqv .gt_super {
  font-size: 65%;
}

#oewdqyaqqv .gt_footnote_marks {
  font-style: italic;
  font-size: 65%;
}
</style>
<div id="oewdqyaqqv" style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;"><table class="gt_table">
  
  <thead class="gt_col_headings">
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">year</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">AvgLifeExp</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">AvgPop</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">AvgGDP</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr class="gt_group_heading_row">
      <td colspan="4" class="gt_group_heading">Africa</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">1992</td>
      <td class="gt_row gt_right">53.62958</td>
      <td class="gt_row gt_right">12674645</td>
      <td class="gt_row gt_right">2281.810</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">1997</td>
      <td class="gt_row gt_right">53.59827</td>
      <td class="gt_row gt_right">14304480</td>
      <td class="gt_row gt_right">2378.760</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">2002</td>
      <td class="gt_row gt_right">53.32523</td>
      <td class="gt_row gt_right">16033152</td>
      <td class="gt_row gt_right">2599.385</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">2007</td>
      <td class="gt_row gt_right">54.80604</td>
      <td class="gt_row gt_right">17875763</td>
      <td class="gt_row gt_right">3089.033</td>
    </tr>
    <tr class="gt_group_heading_row">
      <td colspan="4" class="gt_group_heading">Americas</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">1992</td>
      <td class="gt_row gt_right">69.56836</td>
      <td class="gt_row gt_right">29570964</td>
      <td class="gt_row gt_right">8044.934</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">1997</td>
      <td class="gt_row gt_right">71.15048</td>
      <td class="gt_row gt_right">31876016</td>
      <td class="gt_row gt_right">8889.301</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">2002</td>
      <td class="gt_row gt_right">72.42204</td>
      <td class="gt_row gt_right">33990910</td>
      <td class="gt_row gt_right">9287.677</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">2007</td>
      <td class="gt_row gt_right">73.60812</td>
      <td class="gt_row gt_right">35954847</td>
      <td class="gt_row gt_right">11003.032</td>
    </tr>
    <tr class="gt_group_heading_row">
      <td colspan="4" class="gt_group_heading">Asia</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">1992</td>
      <td class="gt_row gt_right">66.53721</td>
      <td class="gt_row gt_right">94948248</td>
      <td class="gt_row gt_right">8639.690</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">1997</td>
      <td class="gt_row gt_right">68.02052</td>
      <td class="gt_row gt_right">102523803</td>
      <td class="gt_row gt_right">9834.093</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">2002</td>
      <td class="gt_row gt_right">69.23388</td>
      <td class="gt_row gt_right">109145521</td>
      <td class="gt_row gt_right">10174.090</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">2007</td>
      <td class="gt_row gt_right">70.72848</td>
      <td class="gt_row gt_right">115513752</td>
      <td class="gt_row gt_right">12473.027</td>
    </tr>
    <tr class="gt_group_heading_row">
      <td colspan="4" class="gt_group_heading">Europe</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">1992</td>
      <td class="gt_row gt_right">74.44010</td>
      <td class="gt_row gt_right">18604760</td>
      <td class="gt_row gt_right">17061.568</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">1997</td>
      <td class="gt_row gt_right">75.50517</td>
      <td class="gt_row gt_right">18964805</td>
      <td class="gt_row gt_right">19076.782</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">2002</td>
      <td class="gt_row gt_right">76.70060</td>
      <td class="gt_row gt_right">19274129</td>
      <td class="gt_row gt_right">21711.732</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">2007</td>
      <td class="gt_row gt_right">77.64860</td>
      <td class="gt_row gt_right">19536618</td>
      <td class="gt_row gt_right">25054.482</td>
    </tr>
    <tr class="gt_group_heading_row">
      <td colspan="4" class="gt_group_heading">Oceania</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">1992</td>
      <td class="gt_row gt_right">76.94500</td>
      <td class="gt_row gt_right">10459826</td>
      <td class="gt_row gt_right">20894.046</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">1997</td>
      <td class="gt_row gt_right">78.19000</td>
      <td class="gt_row gt_right">11120715</td>
      <td class="gt_row gt_right">24024.175</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">2002</td>
      <td class="gt_row gt_right">79.74000</td>
      <td class="gt_row gt_right">11727414</td>
      <td class="gt_row gt_right">26938.778</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">2007</td>
      <td class="gt_row gt_right">80.71950</td>
      <td class="gt_row gt_right">12274974</td>
      <td class="gt_row gt_right">29810.188</td>
    </tr>
  </tbody>
  
  
</table></div>

### With title, subtitle, and footer

``` r
gapminder_gt2 <- gapminder_gt1 %>%
    tab_header(
        title=md("Gapminder Table"),
        subtitle="using GT") %>%
    tab_source_note(md("More information on the [GT package](https://gt.rstudio.com/index.html).")) %>%
    cols_align(align="right", columns=TRUE)
gapminder_gt2
```

<style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#udsknttqnk .gt_table {
  display: table;
  border-collapse: collapse;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#udsknttqnk .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#udsknttqnk .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#udsknttqnk .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 4px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#udsknttqnk .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#udsknttqnk .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#udsknttqnk .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#udsknttqnk .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#udsknttqnk .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#udsknttqnk .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#udsknttqnk .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#udsknttqnk .gt_group_heading {
  padding: 8px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
}

#udsknttqnk .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#udsknttqnk .gt_from_md > :first-child {
  margin-top: 0;
}

#udsknttqnk .gt_from_md > :last-child {
  margin-bottom: 0;
}

#udsknttqnk .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#udsknttqnk .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 12px;
}

#udsknttqnk .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#udsknttqnk .gt_first_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
}

#udsknttqnk .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#udsknttqnk .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#udsknttqnk .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#udsknttqnk .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#udsknttqnk .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#udsknttqnk .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding: 4px;
}

#udsknttqnk .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#udsknttqnk .gt_sourcenote {
  font-size: 90%;
  padding: 4px;
}

#udsknttqnk .gt_left {
  text-align: left;
}

#udsknttqnk .gt_center {
  text-align: center;
}

#udsknttqnk .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#udsknttqnk .gt_font_normal {
  font-weight: normal;
}

#udsknttqnk .gt_font_bold {
  font-weight: bold;
}

#udsknttqnk .gt_font_italic {
  font-style: italic;
}

#udsknttqnk .gt_super {
  font-size: 65%;
}

#udsknttqnk .gt_footnote_marks {
  font-style: italic;
  font-size: 65%;
}
</style>
<div id="udsknttqnk" style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;"><table class="gt_table">
  <thead class="gt_header">
    <tr>
      <th colspan="4" class="gt_heading gt_title gt_font_normal" style>Gapminder Table</th>
    </tr>
    <tr>
      <th colspan="4" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style>using GT</th>
    </tr>
  </thead>
  <thead class="gt_col_headings">
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">year</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">AvgLifeExp</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">AvgPop</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">AvgGDP</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr class="gt_group_heading_row">
      <td colspan="4" class="gt_group_heading">Africa</td>
    </tr>
    <tr>
      <td class="gt_row gt_right">1992</td>
      <td class="gt_row gt_right">53.62958</td>
      <td class="gt_row gt_right">12674645</td>
      <td class="gt_row gt_right">2281.810</td>
    </tr>
    <tr>
      <td class="gt_row gt_right">1997</td>
      <td class="gt_row gt_right">53.59827</td>
      <td class="gt_row gt_right">14304480</td>
      <td class="gt_row gt_right">2378.760</td>
    </tr>
    <tr>
      <td class="gt_row gt_right">2002</td>
      <td class="gt_row gt_right">53.32523</td>
      <td class="gt_row gt_right">16033152</td>
      <td class="gt_row gt_right">2599.385</td>
    </tr>
    <tr>
      <td class="gt_row gt_right">2007</td>
      <td class="gt_row gt_right">54.80604</td>
      <td class="gt_row gt_right">17875763</td>
      <td class="gt_row gt_right">3089.033</td>
    </tr>
    <tr class="gt_group_heading_row">
      <td colspan="4" class="gt_group_heading">Americas</td>
    </tr>
    <tr>
      <td class="gt_row gt_right">1992</td>
      <td class="gt_row gt_right">69.56836</td>
      <td class="gt_row gt_right">29570964</td>
      <td class="gt_row gt_right">8044.934</td>
    </tr>
    <tr>
      <td class="gt_row gt_right">1997</td>
      <td class="gt_row gt_right">71.15048</td>
      <td class="gt_row gt_right">31876016</td>
      <td class="gt_row gt_right">8889.301</td>
    </tr>
    <tr>
      <td class="gt_row gt_right">2002</td>
      <td class="gt_row gt_right">72.42204</td>
      <td class="gt_row gt_right">33990910</td>
      <td class="gt_row gt_right">9287.677</td>
    </tr>
    <tr>
      <td class="gt_row gt_right">2007</td>
      <td class="gt_row gt_right">73.60812</td>
      <td class="gt_row gt_right">35954847</td>
      <td class="gt_row gt_right">11003.032</td>
    </tr>
    <tr class="gt_group_heading_row">
      <td colspan="4" class="gt_group_heading">Asia</td>
    </tr>
    <tr>
      <td class="gt_row gt_right">1992</td>
      <td class="gt_row gt_right">66.53721</td>
      <td class="gt_row gt_right">94948248</td>
      <td class="gt_row gt_right">8639.690</td>
    </tr>
    <tr>
      <td class="gt_row gt_right">1997</td>
      <td class="gt_row gt_right">68.02052</td>
      <td class="gt_row gt_right">102523803</td>
      <td class="gt_row gt_right">9834.093</td>
    </tr>
    <tr>
      <td class="gt_row gt_right">2002</td>
      <td class="gt_row gt_right">69.23388</td>
      <td class="gt_row gt_right">109145521</td>
      <td class="gt_row gt_right">10174.090</td>
    </tr>
    <tr>
      <td class="gt_row gt_right">2007</td>
      <td class="gt_row gt_right">70.72848</td>
      <td class="gt_row gt_right">115513752</td>
      <td class="gt_row gt_right">12473.027</td>
    </tr>
    <tr class="gt_group_heading_row">
      <td colspan="4" class="gt_group_heading">Europe</td>
    </tr>
    <tr>
      <td class="gt_row gt_right">1992</td>
      <td class="gt_row gt_right">74.44010</td>
      <td class="gt_row gt_right">18604760</td>
      <td class="gt_row gt_right">17061.568</td>
    </tr>
    <tr>
      <td class="gt_row gt_right">1997</td>
      <td class="gt_row gt_right">75.50517</td>
      <td class="gt_row gt_right">18964805</td>
      <td class="gt_row gt_right">19076.782</td>
    </tr>
    <tr>
      <td class="gt_row gt_right">2002</td>
      <td class="gt_row gt_right">76.70060</td>
      <td class="gt_row gt_right">19274129</td>
      <td class="gt_row gt_right">21711.732</td>
    </tr>
    <tr>
      <td class="gt_row gt_right">2007</td>
      <td class="gt_row gt_right">77.64860</td>
      <td class="gt_row gt_right">19536618</td>
      <td class="gt_row gt_right">25054.482</td>
    </tr>
    <tr class="gt_group_heading_row">
      <td colspan="4" class="gt_group_heading">Oceania</td>
    </tr>
    <tr>
      <td class="gt_row gt_right">1992</td>
      <td class="gt_row gt_right">76.94500</td>
      <td class="gt_row gt_right">10459826</td>
      <td class="gt_row gt_right">20894.046</td>
    </tr>
    <tr>
      <td class="gt_row gt_right">1997</td>
      <td class="gt_row gt_right">78.19000</td>
      <td class="gt_row gt_right">11120715</td>
      <td class="gt_row gt_right">24024.175</td>
    </tr>
    <tr>
      <td class="gt_row gt_right">2002</td>
      <td class="gt_row gt_right">79.74000</td>
      <td class="gt_row gt_right">11727414</td>
      <td class="gt_row gt_right">26938.778</td>
    </tr>
    <tr>
      <td class="gt_row gt_right">2007</td>
      <td class="gt_row gt_right">80.71950</td>
      <td class="gt_row gt_right">12274974</td>
      <td class="gt_row gt_right">29810.188</td>
    </tr>
  </tbody>
  <tfoot class="gt_sourcenotes">
    <tr>
      <td class="gt_sourcenote" colspan="4">More information on the <a href="https://gt.rstudio.com/index.html">GT package</a>.</td>
    </tr>
  </tfoot>
  
</table></div>

### Group columns

``` r
gapminder_gt3 <- gapminder_gt2 %>%
    tab_spanner(label="Location", columns=matches("country|continent")) %>%
    tab_spanner(label="Stats", columns=matches("lifeExp|pop|gdp"))
gapminder_gt3
```

<style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#qtidiyuxeb .gt_table {
  display: table;
  border-collapse: collapse;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#qtidiyuxeb .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#qtidiyuxeb .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#qtidiyuxeb .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 4px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#qtidiyuxeb .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#qtidiyuxeb .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#qtidiyuxeb .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#qtidiyuxeb .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#qtidiyuxeb .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#qtidiyuxeb .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#qtidiyuxeb .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#qtidiyuxeb .gt_group_heading {
  padding: 8px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
}

#qtidiyuxeb .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#qtidiyuxeb .gt_from_md > :first-child {
  margin-top: 0;
}

#qtidiyuxeb .gt_from_md > :last-child {
  margin-bottom: 0;
}

#qtidiyuxeb .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#qtidiyuxeb .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 12px;
}

#qtidiyuxeb .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#qtidiyuxeb .gt_first_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
}

#qtidiyuxeb .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#qtidiyuxeb .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#qtidiyuxeb .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#qtidiyuxeb .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#qtidiyuxeb .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#qtidiyuxeb .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding: 4px;
}

#qtidiyuxeb .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#qtidiyuxeb .gt_sourcenote {
  font-size: 90%;
  padding: 4px;
}

#qtidiyuxeb .gt_left {
  text-align: left;
}

#qtidiyuxeb .gt_center {
  text-align: center;
}

#qtidiyuxeb .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#qtidiyuxeb .gt_font_normal {
  font-weight: normal;
}

#qtidiyuxeb .gt_font_bold {
  font-weight: bold;
}

#qtidiyuxeb .gt_font_italic {
  font-style: italic;
}

#qtidiyuxeb .gt_super {
  font-size: 65%;
}

#qtidiyuxeb .gt_footnote_marks {
  font-style: italic;
  font-size: 65%;
}
</style>
<div id="qtidiyuxeb" style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;"><table class="gt_table">
  <thead class="gt_header">
    <tr>
      <th colspan="4" class="gt_heading gt_title gt_font_normal" style>Gapminder Table</th>
    </tr>
    <tr>
      <th colspan="4" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style>using GT</th>
    </tr>
  </thead>
  <thead class="gt_col_headings">
    <tr>
      <th class="gt_col_heading gt_center gt_columns_bottom_border" rowspan="2" colspan="1">year</th>
      <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="3">
        <span class="gt_column_spanner">Stats</span>
      </th>
    </tr>
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">AvgLifeExp</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">AvgPop</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">AvgGDP</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr class="gt_group_heading_row">
      <td colspan="4" class="gt_group_heading">Africa</td>
    </tr>
    <tr>
      <td class="gt_row gt_right">1992</td>
      <td class="gt_row gt_right">53.62958</td>
      <td class="gt_row gt_right">12674645</td>
      <td class="gt_row gt_right">2281.810</td>
    </tr>
    <tr>
      <td class="gt_row gt_right">1997</td>
      <td class="gt_row gt_right">53.59827</td>
      <td class="gt_row gt_right">14304480</td>
      <td class="gt_row gt_right">2378.760</td>
    </tr>
    <tr>
      <td class="gt_row gt_right">2002</td>
      <td class="gt_row gt_right">53.32523</td>
      <td class="gt_row gt_right">16033152</td>
      <td class="gt_row gt_right">2599.385</td>
    </tr>
    <tr>
      <td class="gt_row gt_right">2007</td>
      <td class="gt_row gt_right">54.80604</td>
      <td class="gt_row gt_right">17875763</td>
      <td class="gt_row gt_right">3089.033</td>
    </tr>
    <tr class="gt_group_heading_row">
      <td colspan="4" class="gt_group_heading">Americas</td>
    </tr>
    <tr>
      <td class="gt_row gt_right">1992</td>
      <td class="gt_row gt_right">69.56836</td>
      <td class="gt_row gt_right">29570964</td>
      <td class="gt_row gt_right">8044.934</td>
    </tr>
    <tr>
      <td class="gt_row gt_right">1997</td>
      <td class="gt_row gt_right">71.15048</td>
      <td class="gt_row gt_right">31876016</td>
      <td class="gt_row gt_right">8889.301</td>
    </tr>
    <tr>
      <td class="gt_row gt_right">2002</td>
      <td class="gt_row gt_right">72.42204</td>
      <td class="gt_row gt_right">33990910</td>
      <td class="gt_row gt_right">9287.677</td>
    </tr>
    <tr>
      <td class="gt_row gt_right">2007</td>
      <td class="gt_row gt_right">73.60812</td>
      <td class="gt_row gt_right">35954847</td>
      <td class="gt_row gt_right">11003.032</td>
    </tr>
    <tr class="gt_group_heading_row">
      <td colspan="4" class="gt_group_heading">Asia</td>
    </tr>
    <tr>
      <td class="gt_row gt_right">1992</td>
      <td class="gt_row gt_right">66.53721</td>
      <td class="gt_row gt_right">94948248</td>
      <td class="gt_row gt_right">8639.690</td>
    </tr>
    <tr>
      <td class="gt_row gt_right">1997</td>
      <td class="gt_row gt_right">68.02052</td>
      <td class="gt_row gt_right">102523803</td>
      <td class="gt_row gt_right">9834.093</td>
    </tr>
    <tr>
      <td class="gt_row gt_right">2002</td>
      <td class="gt_row gt_right">69.23388</td>
      <td class="gt_row gt_right">109145521</td>
      <td class="gt_row gt_right">10174.090</td>
    </tr>
    <tr>
      <td class="gt_row gt_right">2007</td>
      <td class="gt_row gt_right">70.72848</td>
      <td class="gt_row gt_right">115513752</td>
      <td class="gt_row gt_right">12473.027</td>
    </tr>
    <tr class="gt_group_heading_row">
      <td colspan="4" class="gt_group_heading">Europe</td>
    </tr>
    <tr>
      <td class="gt_row gt_right">1992</td>
      <td class="gt_row gt_right">74.44010</td>
      <td class="gt_row gt_right">18604760</td>
      <td class="gt_row gt_right">17061.568</td>
    </tr>
    <tr>
      <td class="gt_row gt_right">1997</td>
      <td class="gt_row gt_right">75.50517</td>
      <td class="gt_row gt_right">18964805</td>
      <td class="gt_row gt_right">19076.782</td>
    </tr>
    <tr>
      <td class="gt_row gt_right">2002</td>
      <td class="gt_row gt_right">76.70060</td>
      <td class="gt_row gt_right">19274129</td>
      <td class="gt_row gt_right">21711.732</td>
    </tr>
    <tr>
      <td class="gt_row gt_right">2007</td>
      <td class="gt_row gt_right">77.64860</td>
      <td class="gt_row gt_right">19536618</td>
      <td class="gt_row gt_right">25054.482</td>
    </tr>
    <tr class="gt_group_heading_row">
      <td colspan="4" class="gt_group_heading">Oceania</td>
    </tr>
    <tr>
      <td class="gt_row gt_right">1992</td>
      <td class="gt_row gt_right">76.94500</td>
      <td class="gt_row gt_right">10459826</td>
      <td class="gt_row gt_right">20894.046</td>
    </tr>
    <tr>
      <td class="gt_row gt_right">1997</td>
      <td class="gt_row gt_right">78.19000</td>
      <td class="gt_row gt_right">11120715</td>
      <td class="gt_row gt_right">24024.175</td>
    </tr>
    <tr>
      <td class="gt_row gt_right">2002</td>
      <td class="gt_row gt_right">79.74000</td>
      <td class="gt_row gt_right">11727414</td>
      <td class="gt_row gt_right">26938.778</td>
    </tr>
    <tr>
      <td class="gt_row gt_right">2007</td>
      <td class="gt_row gt_right">80.71950</td>
      <td class="gt_row gt_right">12274974</td>
      <td class="gt_row gt_right">29810.188</td>
    </tr>
  </tbody>
  <tfoot class="gt_sourcenotes">
    <tr>
      <td class="gt_sourcenote" colspan="4">More information on the <a href="https://gt.rstudio.com/index.html">GT package</a>.</td>
    </tr>
  </tfoot>
  
</table></div>

### Group data and add color

``` r
gapminder_gt4 <- gapminder_gt3 %>%
    tab_options(
        # Row groups
        row_group.background.color="#3C5488", #FFEFDB80
        row_group.border.top.color="#989898",
    )
gapminder_gt4
```

<style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#tkzaeirjji .gt_table {
  display: table;
  border-collapse: collapse;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#tkzaeirjji .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#tkzaeirjji .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#tkzaeirjji .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 4px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#tkzaeirjji .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#tkzaeirjji .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#tkzaeirjji .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#tkzaeirjji .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#tkzaeirjji .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#tkzaeirjji .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#tkzaeirjji .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#tkzaeirjji .gt_group_heading {
  padding: 8px;
  color: #FFFFFF;
  background-color: #3C5488;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #989898;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
}

#tkzaeirjji .gt_empty_group_heading {
  padding: 0.5px;
  color: #FFFFFF;
  background-color: #3C5488;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #989898;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#tkzaeirjji .gt_from_md > :first-child {
  margin-top: 0;
}

#tkzaeirjji .gt_from_md > :last-child {
  margin-bottom: 0;
}

#tkzaeirjji .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#tkzaeirjji .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 12px;
}

#tkzaeirjji .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#tkzaeirjji .gt_first_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
}

#tkzaeirjji .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#tkzaeirjji .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#tkzaeirjji .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#tkzaeirjji .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#tkzaeirjji .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#tkzaeirjji .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding: 4px;
}

#tkzaeirjji .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#tkzaeirjji .gt_sourcenote {
  font-size: 90%;
  padding: 4px;
}

#tkzaeirjji .gt_left {
  text-align: left;
}

#tkzaeirjji .gt_center {
  text-align: center;
}

#tkzaeirjji .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#tkzaeirjji .gt_font_normal {
  font-weight: normal;
}

#tkzaeirjji .gt_font_bold {
  font-weight: bold;
}

#tkzaeirjji .gt_font_italic {
  font-style: italic;
}

#tkzaeirjji .gt_super {
  font-size: 65%;
}

#tkzaeirjji .gt_footnote_marks {
  font-style: italic;
  font-size: 65%;
}
</style>
<div id="tkzaeirjji" style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;"><table class="gt_table">
  <thead class="gt_header">
    <tr>
      <th colspan="4" class="gt_heading gt_title gt_font_normal" style>Gapminder Table</th>
    </tr>
    <tr>
      <th colspan="4" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style>using GT</th>
    </tr>
  </thead>
  <thead class="gt_col_headings">
    <tr>
      <th class="gt_col_heading gt_center gt_columns_bottom_border" rowspan="2" colspan="1">year</th>
      <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="3">
        <span class="gt_column_spanner">Stats</span>
      </th>
    </tr>
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">AvgLifeExp</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">AvgPop</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">AvgGDP</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr class="gt_group_heading_row">
      <td colspan="4" class="gt_group_heading">Africa</td>
    </tr>
    <tr>
      <td class="gt_row gt_right">1992</td>
      <td class="gt_row gt_right">53.62958</td>
      <td class="gt_row gt_right">12674645</td>
      <td class="gt_row gt_right">2281.810</td>
    </tr>
    <tr>
      <td class="gt_row gt_right">1997</td>
      <td class="gt_row gt_right">53.59827</td>
      <td class="gt_row gt_right">14304480</td>
      <td class="gt_row gt_right">2378.760</td>
    </tr>
    <tr>
      <td class="gt_row gt_right">2002</td>
      <td class="gt_row gt_right">53.32523</td>
      <td class="gt_row gt_right">16033152</td>
      <td class="gt_row gt_right">2599.385</td>
    </tr>
    <tr>
      <td class="gt_row gt_right">2007</td>
      <td class="gt_row gt_right">54.80604</td>
      <td class="gt_row gt_right">17875763</td>
      <td class="gt_row gt_right">3089.033</td>
    </tr>
    <tr class="gt_group_heading_row">
      <td colspan="4" class="gt_group_heading">Americas</td>
    </tr>
    <tr>
      <td class="gt_row gt_right">1992</td>
      <td class="gt_row gt_right">69.56836</td>
      <td class="gt_row gt_right">29570964</td>
      <td class="gt_row gt_right">8044.934</td>
    </tr>
    <tr>
      <td class="gt_row gt_right">1997</td>
      <td class="gt_row gt_right">71.15048</td>
      <td class="gt_row gt_right">31876016</td>
      <td class="gt_row gt_right">8889.301</td>
    </tr>
    <tr>
      <td class="gt_row gt_right">2002</td>
      <td class="gt_row gt_right">72.42204</td>
      <td class="gt_row gt_right">33990910</td>
      <td class="gt_row gt_right">9287.677</td>
    </tr>
    <tr>
      <td class="gt_row gt_right">2007</td>
      <td class="gt_row gt_right">73.60812</td>
      <td class="gt_row gt_right">35954847</td>
      <td class="gt_row gt_right">11003.032</td>
    </tr>
    <tr class="gt_group_heading_row">
      <td colspan="4" class="gt_group_heading">Asia</td>
    </tr>
    <tr>
      <td class="gt_row gt_right">1992</td>
      <td class="gt_row gt_right">66.53721</td>
      <td class="gt_row gt_right">94948248</td>
      <td class="gt_row gt_right">8639.690</td>
    </tr>
    <tr>
      <td class="gt_row gt_right">1997</td>
      <td class="gt_row gt_right">68.02052</td>
      <td class="gt_row gt_right">102523803</td>
      <td class="gt_row gt_right">9834.093</td>
    </tr>
    <tr>
      <td class="gt_row gt_right">2002</td>
      <td class="gt_row gt_right">69.23388</td>
      <td class="gt_row gt_right">109145521</td>
      <td class="gt_row gt_right">10174.090</td>
    </tr>
    <tr>
      <td class="gt_row gt_right">2007</td>
      <td class="gt_row gt_right">70.72848</td>
      <td class="gt_row gt_right">115513752</td>
      <td class="gt_row gt_right">12473.027</td>
    </tr>
    <tr class="gt_group_heading_row">
      <td colspan="4" class="gt_group_heading">Europe</td>
    </tr>
    <tr>
      <td class="gt_row gt_right">1992</td>
      <td class="gt_row gt_right">74.44010</td>
      <td class="gt_row gt_right">18604760</td>
      <td class="gt_row gt_right">17061.568</td>
    </tr>
    <tr>
      <td class="gt_row gt_right">1997</td>
      <td class="gt_row gt_right">75.50517</td>
      <td class="gt_row gt_right">18964805</td>
      <td class="gt_row gt_right">19076.782</td>
    </tr>
    <tr>
      <td class="gt_row gt_right">2002</td>
      <td class="gt_row gt_right">76.70060</td>
      <td class="gt_row gt_right">19274129</td>
      <td class="gt_row gt_right">21711.732</td>
    </tr>
    <tr>
      <td class="gt_row gt_right">2007</td>
      <td class="gt_row gt_right">77.64860</td>
      <td class="gt_row gt_right">19536618</td>
      <td class="gt_row gt_right">25054.482</td>
    </tr>
    <tr class="gt_group_heading_row">
      <td colspan="4" class="gt_group_heading">Oceania</td>
    </tr>
    <tr>
      <td class="gt_row gt_right">1992</td>
      <td class="gt_row gt_right">76.94500</td>
      <td class="gt_row gt_right">10459826</td>
      <td class="gt_row gt_right">20894.046</td>
    </tr>
    <tr>
      <td class="gt_row gt_right">1997</td>
      <td class="gt_row gt_right">78.19000</td>
      <td class="gt_row gt_right">11120715</td>
      <td class="gt_row gt_right">24024.175</td>
    </tr>
    <tr>
      <td class="gt_row gt_right">2002</td>
      <td class="gt_row gt_right">79.74000</td>
      <td class="gt_row gt_right">11727414</td>
      <td class="gt_row gt_right">26938.778</td>
    </tr>
    <tr>
      <td class="gt_row gt_right">2007</td>
      <td class="gt_row gt_right">80.71950</td>
      <td class="gt_row gt_right">12274974</td>
      <td class="gt_row gt_right">29810.188</td>
    </tr>
  </tbody>
  <tfoot class="gt_sourcenotes">
    <tr>
      <td class="gt_sourcenote" colspan="4">More information on the <a href="https://gt.rstudio.com/index.html">GT package</a>.</td>
    </tr>
  </tfoot>
  
</table></div>

### Add LOTS more color!

``` r
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
```

<style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#ydxavffzhw .gt_table {
  display: table;
  border-collapse: collapse;
  margin-left: auto;
  margin-right: auto;
  color: #323232;
  font-size: 10px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: 80%;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#ydxavffzhw .gt_heading {
  background-color: #3C5488;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#ydxavffzhw .gt_title {
  color: #FFFFFF;
  font-size: 12px;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#ydxavffzhw .gt_subtitle {
  color: #FFFFFF;
  font-size: 11px;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 4px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#ydxavffzhw .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #989898;
}

#ydxavffzhw .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#ydxavffzhw .gt_col_heading {
  color: #FFFFFF;
  background-color: #4DBBD5;
  font-size: 12px;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#ydxavffzhw .gt_column_spanner_outer {
  color: #FFFFFF;
  background-color: #4DBBD5;
  font-size: 12px;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#ydxavffzhw .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#ydxavffzhw .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#ydxavffzhw .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#ydxavffzhw .gt_group_heading {
  padding: 8px;
  color: #FFFFFF;
  background-color: #3C5488;
  font-size: 12px;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #989898;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
}

#ydxavffzhw .gt_empty_group_heading {
  padding: 0.5px;
  color: #FFFFFF;
  background-color: #3C5488;
  font-size: 12px;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #989898;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#ydxavffzhw .gt_from_md > :first-child {
  margin-top: 0;
}

#ydxavffzhw .gt_from_md > :last-child {
  margin-bottom: 0;
}

#ydxavffzhw .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #989898;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#ydxavffzhw .gt_stub {
  color: #FFFFFF;
  background-color: #4DBBD5;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: dashed;
  border-right-width: 1px;
  border-right-color: #989898;
  padding-left: 12px;
}

#ydxavffzhw .gt_summary_row {
  color: #323232;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#ydxavffzhw .gt_first_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #989898;
}

#ydxavffzhw .gt_grand_summary_row {
  color: #323232;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#ydxavffzhw .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#ydxavffzhw .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#ydxavffzhw .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #989898;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#ydxavffzhw .gt_footnotes {
  color: #323232;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#ydxavffzhw .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding: 4px;
}

#ydxavffzhw .gt_sourcenotes {
  color: #323232;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#ydxavffzhw .gt_sourcenote {
  font-size: 90%;
  padding: 4px;
}

#ydxavffzhw .gt_left {
  text-align: left;
}

#ydxavffzhw .gt_center {
  text-align: center;
}

#ydxavffzhw .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#ydxavffzhw .gt_font_normal {
  font-weight: normal;
}

#ydxavffzhw .gt_font_bold {
  font-weight: bold;
}

#ydxavffzhw .gt_font_italic {
  font-style: italic;
}

#ydxavffzhw .gt_super {
  font-size: 65%;
}

#ydxavffzhw .gt_footnote_marks {
  font-style: italic;
  font-size: 65%;
}
</style>
<div id="ydxavffzhw" style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;"><table class="gt_table">
  <thead class="gt_header">
    <tr>
      <th colspan="4" class="gt_heading gt_title gt_font_normal" style>Gapminder Table</th>
    </tr>
    <tr>
      <th colspan="4" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style>using GT</th>
    </tr>
  </thead>
  <thead class="gt_col_headings">
    <tr>
      <th class="gt_col_heading gt_center gt_columns_bottom_border" rowspan="2" colspan="1">year</th>
      <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="3">
        <span class="gt_column_spanner">Stats</span>
      </th>
    </tr>
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">AvgLifeExp</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">AvgPop</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">AvgGDP</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr class="gt_group_heading_row">
      <td colspan="4" class="gt_group_heading">Africa</td>
    </tr>
    <tr>
      <td class="gt_row gt_right">1992</td>
      <td class="gt_row gt_right">53.62958</td>
      <td class="gt_row gt_right">12674645</td>
      <td class="gt_row gt_right">2281.810</td>
    </tr>
    <tr>
      <td class="gt_row gt_right">1997</td>
      <td class="gt_row gt_right">53.59827</td>
      <td class="gt_row gt_right">14304480</td>
      <td class="gt_row gt_right">2378.760</td>
    </tr>
    <tr>
      <td class="gt_row gt_right">2002</td>
      <td class="gt_row gt_right">53.32523</td>
      <td class="gt_row gt_right">16033152</td>
      <td class="gt_row gt_right">2599.385</td>
    </tr>
    <tr>
      <td class="gt_row gt_right">2007</td>
      <td class="gt_row gt_right">54.80604</td>
      <td class="gt_row gt_right">17875763</td>
      <td class="gt_row gt_right">3089.033</td>
    </tr>
    <tr class="gt_group_heading_row">
      <td colspan="4" class="gt_group_heading">Americas</td>
    </tr>
    <tr>
      <td class="gt_row gt_right">1992</td>
      <td class="gt_row gt_right">69.56836</td>
      <td class="gt_row gt_right">29570964</td>
      <td class="gt_row gt_right">8044.934</td>
    </tr>
    <tr>
      <td class="gt_row gt_right">1997</td>
      <td class="gt_row gt_right">71.15048</td>
      <td class="gt_row gt_right">31876016</td>
      <td class="gt_row gt_right">8889.301</td>
    </tr>
    <tr>
      <td class="gt_row gt_right">2002</td>
      <td class="gt_row gt_right">72.42204</td>
      <td class="gt_row gt_right">33990910</td>
      <td class="gt_row gt_right">9287.677</td>
    </tr>
    <tr>
      <td class="gt_row gt_right">2007</td>
      <td class="gt_row gt_right">73.60812</td>
      <td class="gt_row gt_right">35954847</td>
      <td class="gt_row gt_right">11003.032</td>
    </tr>
    <tr class="gt_group_heading_row">
      <td colspan="4" class="gt_group_heading">Asia</td>
    </tr>
    <tr>
      <td class="gt_row gt_right">1992</td>
      <td class="gt_row gt_right">66.53721</td>
      <td class="gt_row gt_right">94948248</td>
      <td class="gt_row gt_right">8639.690</td>
    </tr>
    <tr>
      <td class="gt_row gt_right">1997</td>
      <td class="gt_row gt_right">68.02052</td>
      <td class="gt_row gt_right">102523803</td>
      <td class="gt_row gt_right">9834.093</td>
    </tr>
    <tr>
      <td class="gt_row gt_right">2002</td>
      <td class="gt_row gt_right">69.23388</td>
      <td class="gt_row gt_right">109145521</td>
      <td class="gt_row gt_right">10174.090</td>
    </tr>
    <tr>
      <td class="gt_row gt_right">2007</td>
      <td class="gt_row gt_right">70.72848</td>
      <td class="gt_row gt_right">115513752</td>
      <td class="gt_row gt_right">12473.027</td>
    </tr>
    <tr class="gt_group_heading_row">
      <td colspan="4" class="gt_group_heading">Europe</td>
    </tr>
    <tr>
      <td class="gt_row gt_right">1992</td>
      <td class="gt_row gt_right">74.44010</td>
      <td class="gt_row gt_right">18604760</td>
      <td class="gt_row gt_right">17061.568</td>
    </tr>
    <tr>
      <td class="gt_row gt_right">1997</td>
      <td class="gt_row gt_right">75.50517</td>
      <td class="gt_row gt_right">18964805</td>
      <td class="gt_row gt_right">19076.782</td>
    </tr>
    <tr>
      <td class="gt_row gt_right">2002</td>
      <td class="gt_row gt_right">76.70060</td>
      <td class="gt_row gt_right">19274129</td>
      <td class="gt_row gt_right">21711.732</td>
    </tr>
    <tr>
      <td class="gt_row gt_right">2007</td>
      <td class="gt_row gt_right">77.64860</td>
      <td class="gt_row gt_right">19536618</td>
      <td class="gt_row gt_right">25054.482</td>
    </tr>
    <tr class="gt_group_heading_row">
      <td colspan="4" class="gt_group_heading">Oceania</td>
    </tr>
    <tr>
      <td class="gt_row gt_right">1992</td>
      <td class="gt_row gt_right">76.94500</td>
      <td class="gt_row gt_right">10459826</td>
      <td class="gt_row gt_right">20894.046</td>
    </tr>
    <tr>
      <td class="gt_row gt_right">1997</td>
      <td class="gt_row gt_right">78.19000</td>
      <td class="gt_row gt_right">11120715</td>
      <td class="gt_row gt_right">24024.175</td>
    </tr>
    <tr>
      <td class="gt_row gt_right">2002</td>
      <td class="gt_row gt_right">79.74000</td>
      <td class="gt_row gt_right">11727414</td>
      <td class="gt_row gt_right">26938.778</td>
    </tr>
    <tr>
      <td class="gt_row gt_right">2007</td>
      <td class="gt_row gt_right">80.71950</td>
      <td class="gt_row gt_right">12274974</td>
      <td class="gt_row gt_right">29810.188</td>
    </tr>
  </tbody>
  <tfoot class="gt_sourcenotes">
    <tr>
      <td class="gt_sourcenote" colspan="4">More information on the <a href="https://gt.rstudio.com/index.html">GT package</a>.</td>
    </tr>
  </tfoot>
  
</table></div>

### References

-   GT: <https://gt.rstudio.com/index.html>
-   Also checkout flextable: <https://davidgohel.github.io/flextable/>
    <br>

### How to reach me?

-   Email: <janani@msu.edu>
-   Webpage: [jravilab.github.io](https://jravilab.github.io)
-   Twitter: [@janani137](https://twitter.com/janani137)
