library(readxl)
library(tidyverse)

data(mpg)
View(mpg)

glimpse(mpg)

?filter
Audi <- filter(mpg, manufacturer == "audi")
View(Audi)


newAudi <- filter(Audi, year >= 2000)
View(newAudi)


Audi_metric <- mutate(newAudi, topSpeed = 80 * cty)
glimpse(Audi_metric)
View(Audi_metric)


mpg %>%
  group_by(class) %>%
  summarise(mean(cty), median(cty))


#Data viz with ggplot2

ggplot(mpg, aes(x = cty)) + geom_histogram() + labs(x="City Mileage")

#
ggplot(mpg, aes(x = cty,
                y = hwy)) +
  geom_point() +
  geom_smooth(method = "lm")


#
ggplot(mpg, aes(x = cty,
                y = hwy,
                color = class)) +
  geom_point() +
  scale_color_brewer(palette = "Dark2")



