library(gapminder)
library(ggplot2)
library(dplyr)
theme_set(theme_classic())

subset(gapminder, year == 2007) %>% arrange(lifeExp) -> gm #2007 data
global_mean <- mean(gm$lifeExp)
set.seed(1234)
gm20 <- gm[sample(1:nrow(gm),20),] #select randomly 20 country

gm20 %>% arrange(desc(continent), country) -> gm20
gm20$country <- factor(gm20$country, levels = gm20$country)

ggplot(gm20, aes(y = country, x = lifeExp, color = continent)) + 
  geom_point(size  = 11) +
  geom_segment(aes(xend = 0, yend = country), size = 2) + 
  geom_text(aes(label = round(lifeExp,2)), size = 2.8, color = "white")+
  scale_x_continuous("",position = "top", expand = expansion(mult = c(0.01,0.05)))+
  labs(
    title = "Life Expectancy (year) in 2007",
    subtitle = "20 randomly selected countries",
    caption = "source: gapminder; developed by: Ovi Rahman",
    color = ""
  )+
  geom_vline(xintercept = global_mean,color = "grey40", linetype = 3)+
  theme(
    axis.text.y = element_text(size = 20),
    axis.text.x = element_text(size = 20),
    axis.title.y = element_blank(),
    axis.line.y = element_blank(),
    plot.title = element_text(size = 30),
    plot.subtitle = element_text(size = 18),
    plot.caption = element_text(size = 15),
    legend.text = element_text(size = 15),
    legend.position = "bottom"
  )+
  annotate(
    "text",
    x = global_mean+6, y = 16,
    label = "global mean",
    color = "grey40"
  )+
  annotate(
    "curve",
    x = global_mean+6, y = 16.2,
    xend = global_mean, yend = 17.5,
    color = "grey40",
    linetype = 2,
    arrow  = arrow(type = "closed", length = unit(0.4, "cm"))
  )
