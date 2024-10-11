install.packages("dplyr")
library(dplyr)
library(ggplot2)


# download data from internet
download.file(url = "https://raw.githubusercontent.com/swcarpentry/r-novice-gapminder/main/episodes/data/gapminder_data.csv", 
              destfile = "gapminder_data.csv")

# read the data
gapminder_data <- read.csv("gapminder_data.csv")

head(gapminder_data)

str(gapminder_data)

ncol(gapminder_data)
nrow(gapminder_data)

colnames(gapminder_data)

summary(gapminder_data)


# dplyr makes apperance

# select some columns: year, country, gdpPercap

select(gapminder_data, year, country, gdpPercap)

select(gapminder_data, -lifeExp)

#this command:

select(gapminder_data, year, country, gdpPercap)

# is this one with pipes
# Ctrl + shift + M

gapminder_data |>
  select(year, country, gdpPercap)

# These two are equivalent
select(gapminder_data, -lifeExp)

gapminder_data |>
  select(-lifeExp)

# Filtering observations

gap_eu <- gapminder_data |>
  filter(continent == "Europe")

# check that there is only Europe in the new object

gap_eu |> 
  distinct(continent)

# compare to original

gapminder_data |>
  distinct(continent)


head(gap_eu)


# Filter: continent is Europe & year is 2002

gap_eu |>
  filter(year == 2002)

# or 

gapminder_data %>% 
  filter(continent == "Europe",
         year == 2002)

gapminder_data %>% 
  filter(year == 2002 |
           year == 2007)

gapminder_data %>% 
  filter(year %in% c(1952,1972, 1987)) %>% 
  distinct(year)

# order matters, this does not work
gapminder_data %>% 
  select(continent, year, lifeExp) %>% 
  filter(country == "Germany")

gapminder_data %>%
  filter(country != "Germany") %>% 
  distinct(country)


gap_afr <- gapminder_data %>% 
  filter(continent == "Africa") %>% 
  select(lifeExp, country, year)

nrow(gap_afr)

# summarize 

gapminder_data %>% 
  summarize(mean_gdp = mean(gdpPercap),
            median_gdp = median(gdpPercap),
            min_gdp = min(gdpPercap))

# Let's get better, group observations

gapminder_data %>% 
  group_by(continent) %>% 
  summarise(mean_gdp = mean(gdpPercap),
            median_gdp = median(gdpPercap),
            min_gdp = min(gdpPercap))

gapminder_data %>% 
  group_by(continent, year)


avg_lifeExp = gapminder_data %>% 
  group_by(country) %>% 
  summarise(meanlifeExp = mean(lifeExp)) 

avg_lifeExp

avg_lifeExp %>% 
  filter( meanlifeExp == min(meanlifeExp) |
          meanlifeExp ==  max(meanlifeExp))

avg_lifeExp %>% 
  slice_max(order_by = meanlifeExp, n = 5)

avg_lifeExp %>% 
  slice_min(order_by = meanlifeExp, n = 5)

# How many observations per year

gapminder_data %>% 
  group_by(year, country) %>% 
  count()


# Add a new column

gapminder_data2 <- gapminder_data %>% 
  mutate(lifeExp_round = round(lifeExp))

# export your data
write.csv(gapminder_data2, "gapminder_data2")


gapminder_data %>% 
  mutate(below_30 = ifelse(lifeExp < 30, 
                           "below 30",
                           "30+")) %>% 
  head()

#case_when


















