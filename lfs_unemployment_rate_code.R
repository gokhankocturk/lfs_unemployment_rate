library(tidyverse)
library(extrafont)
library(Cairo)
library(readxl)
library(ggplot2)
library(ggtext)

lfs_turkey <- read_xls("lfs_turkey.xls")

lfs_turkey %>%
  ggplot(aes(x = month, y = unemployment_rate, fill = unemployment_rate)) +
  geom_bar(stat = "identity") +
  ylim(-15, 17) +
  coord_polar() +
  scale_fill_gradient(low = "yellow", high = "red") +
  scale_x_discrete(breaks = 1:12,
                   limits = as.character(1:12),
                   labels = month.abb) +
  facet_wrap(~ year, ncol = 3) +
  labs(x = NULL, y = NULL,
       fill = "Unemployment Rate",
       caption = "Source: <i>tuik.gov.tr</i>",
       subtitle = "**<span style = 'color:#F72C25; font-size:60px;'> 25% </span> <br> increase in unemployment rate <br> from 2014 to 2021 in Turkey**") +
  theme(text = element_text(family = "Roboto Condensed"),
        legend.position = "bottom",
        legend.background = element_rect(color = "red", fill = "#9BCD9B"),
        plot.caption = element_markdown(face = "bold"),
        axis.text.y = element_blank(),
        axis.ticks = element_blank(),
        plot.background = element_rect("#C1FFc1"),
        panel.background = element_blank(),
        axis.title = element_text(color = "#292929", face = "bold"),
        axis.text = element_text(color = "#292929", face = "bold"),
        plot.subtitle = element_markdown(face = "bold", color = "#292929"),
        strip.text.x = element_text(face = "bold", color = "#292929"),
        strip.background = element_blank(),
        panel.spacing = unit(2, "lines")) 


ggsave("lfs_unemployment_graph3.png",
       width = 21,
       height = 30,
       units = "cm",
       dpi = 500,
       type = "cairo-png")
