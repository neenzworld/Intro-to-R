# ==============================================================================
# INTRODUCTORY R WORKSHOP: DATA WRANGLING & VISUALIZATION
# ==============================================================================

# ------------------------------------------------------------------------------
# 1. SETUP & ENVIRONMENT
# ------------------------------------------------------------------------------

if (!requireNamespace("tidyverse", quietly = TRUE)) {
  install.packages("tidyverse")
}
library(tidyverse)

# Inspect sample dataset
glimpse(mpg)
head(mpg)


# ------------------------------------------------------------------------------
# 2. DATA VISUALIZATION (GGPLOT2)
# ------------------------------------------------------------------------------

# Basic Scatterplot
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point()

# Enhanced Scatterplot with Styling
ggplot(data = mpg, mapping = aes(x = displ, y = hwy, color = class)) +
  geom_point(size = 3, alpha = 0.8) +
  geom_smooth(method = "lm", se = FALSE, color = "black") +
  theme_minimal() +
  labs(
    title = "Engine Size vs. Highway Fuel Economy",
    subtitle = "Larger engines consistently yield lower gas mileage",
    x = "Engine Size (Liters)",
    y = "Highway Fuel Economy (MPG)",
    color = "Vehicle Class"
  )


# ------------------------------------------------------------------------------
# 3. DATA WRANGLING (DPLYR)
# ------------------------------------------------------------------------------

# Explicitly use dplyr::select to prevent package conflicts
mpg_small <- mpg %>%
  dplyr::select(manufacturer, model, year, hwy)

head(mpg_small)

# Subset rows matching a condition
audi_2008 <- mpg %>%
  filter(manufacturer == "audi", year == 2008)

head(audi_2008)

# Calculate new variables
mpg_metric <- mpg %>%
  mutate(hwy_kml = hwy * 0.425144) %>%
  dplyr::select(manufacturer, model, hwy, hwy_kml)

head(mpg_metric)

# Chain operations
suv_efficiency <- mpg %>%
  filter(class == "suv", year == 2008) %>%
  dplyr::select(manufacturer, model, cty, hwy) %>%
  arrange(desc(hwy))

print(suv_efficiency)


# ------------------------------------------------------------------------------
# 4. GROUPED AGGREGATIONS
# ------------------------------------------------------------------------------

# Compute summary metrics per group
class_summary <- mpg %>%
  group_by(class) %>%
  summarise(
    avg_hwy = mean(hwy, na.rm = TRUE),
    total_cars = n()
  ) %>%
  arrange(desc(avg_hwy))

print(class_summary)

# Plot summary metrics
ggplot(class_summary, aes(x = reorder(class, avg_hwy), y = avg_hwy)) +
  geom_col(fill = "midnightblue", width = 0.7) +
  coord_flip() +
  theme_minimal() +
  labs(
    title = "Average Highway Efficiency by Vehicle Class",
    x = "Vehicle Class",
    y = "Mean Highway MPG"
  )


# ------------------------------------------------------------------------------
# 5. QUICK REFERENCE CHEATSHEET
# ------------------------------------------------------------------------------

cat("
======================================================================
                     TIDYVERSE BEGINNER CHEATSHEET
======================================================================
Pipe Operator   | %>% or |>       | Chains operations ('and then...')
Pick Columns    | dplyr::select() | Keeps or reorders specific variables
Pick Rows       | filter()        | Subsets data based on logic
New Columns     | mutate()        | Creates or updates columns
Sorting         | arrange()       | Orders rows (desc() for high-to-low)
Aggregations    | group_by()      | Groups data for aggregate calculations
Plotting        | ggplot()        | Layered graphics framework
======================================================================
")