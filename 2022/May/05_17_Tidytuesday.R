---
title: "Tidytuesday: How many points do you need for winning Eurovision"
format:
  html:
    theme: default
---


```{r, Lib}
library(lubridate)
library(tidytuesdayR)
library(tidyverse)
```

```{r, data}
tuesdata <- tidytuesdayR::tt_load(2022, week = 20)
eurovision <- tuesdata$eurovision
```

```{r, Handle}
Plot_Data<-eurovision%>%
  filter(section=="final" & rank==1)%>% #Who was the winner?
  mutate(Decade=floor_date(
    ymd(year, truncated = 2L), years(10)
  ))%>%
  select(artist, song, artist_country, total_points, Decade, year)

Plot_Data%>%
  ggplot(., aes(x=Decade, y=total_points, color=as.factor(Decade)))+
  geom_jitter()+
  geom_point()
```
