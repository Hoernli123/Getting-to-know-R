library(gapminder)
library(dplyr)
library(ggplot2)

gapminder <- gapminder

ggplot(data = gapminder)

#gapminder %>%  ggplot(aes(x = year,
#                          y = lifeExp,
#                          color = continent,
#                          group = country)) + 
#  geom_point(color = "black") + geom_line() 


#gapminder %>%  filter(continent == "Americas") %>% 
#  ggplot(aes(x = year,
#             y = lifeExp)) +
#  geom_line() + geom_point(color = "black", size = 0.1) +
#  facet_wrap(~ country) +
#  labs(
#    x = "Year",
#    y = "Life expectancy",
#    title = "Figure 1"
#  ) + 
#  theme(axis.text.x = element_text(angle = 90,
#                                   hjust = 1,
#                                   vjust = 0))
# ggsave(filename = "resultImg.png",
#       plot = gapminder_img,
#       width = 12,
#       height = 500,
#       dpi = 500,
#       units = "cm",
#       limitsize = FALSE)



gapminder %>% 
  ggplot(aes(x = continent,
             y = lifeExp,
             fill = continent)) +
  geom_boxplot() +
  facet_wrap(~ year) +
  theme(axis.text.x = element_text(angle = 90,
                                   hjust = 1,
                                   vjust = 0))










































































































