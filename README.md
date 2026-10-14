# Introductory R Workshop: Data Wrangling & Visualization

A fast-paced, hands-on introductory workshop script designed to teach absolute beginners core data science concepts in R using the **Tidyverse** ecosystem. 

Participants transition from zero setup to building visualizations, filtering datasets, and computing summary statistics.

---

## 📋 Workshop Modules

| Module | Focus Area | Core Concepts |
| :--- | :--- | :--- |
| **Module 1** | **Setup & Environment** | RStudio UI, loading `tidyverse`, inspecting raw data (`glimpse`, `head`) |
| **Module 2** | **Instant Visualization** | `ggplot2` syntax layers (`data`, `aes`, `geom_*`), scatterplots, styling |
| **Module 3** | **Data Wrangling** | `dplyr` verbs (`select`, `filter`, `mutate`, `arrange`), the pipe operator (`%>%`) |
| **Module 4** | **Grouped Aggregations** | Summarizing statistics (`group_by` + `summarise`), bar charts (`geom_col`) |
| **Module 5** | **Recap & Next Steps** | Cheat sheet overview and key syntax takeaways |

---

## 🛠 Prerequisites & Installation

No prior programming experience is required. Attendees need:

1. **R** (>= 4.0.0) downloaded from [CRAN](https://cran.r-project.org/).
2. **RStudio Desktop** downloaded from [Posit](https://posit.co/download/rstudio-desktop/).

### Required R Packages
The script automatically detects and installs missing dependencies, but you can manually install the required package ahead of time:

```r
install.packages("tidyverse")
