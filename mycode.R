install.packages("tidyverse")
library(tidyverse)

str(mpg)
head(mpg)

p <- ggplot(data = mpg,
            mapping = aes(x=displ,
                          y=hwy)) # + geom_point()도 가능

#산점도
p + geom_point()


p + geom_point (mapping = aes(color = class))

colors()

p + geom_point (mapping = aes(color = class,
                              size = class,
                              alpha = 0.3))

p + geom_point (mapping = aes(color = class,
                              shape = class))


# 맵핑은 종류별로 부여. -> 점 색깔이 파랑이 안나옴! 
p + geom_point (mapping = aes(color = "blue"))
# 그냥 컬러만 주자! 
p + geom_point(color = "blue") + 
  facet_wrap(~ class, nrow = 2)

p + geom_point (color = "orange") +
  facet_wrap(~ class, nrow = 2)

p + geom_point (color = "orange") +
  facet_grid(drv~cyl)

table(mpg$drv)
table(mpg$cyl)
par(mfrow = c(1,1))
barplot(table(mpg$cyl), col = "steelblue")

p+geom_point(color = "blue") +
  p+geom_smooth(color = "cyan") #추세선

#mapping으로 color을 줌

p + geom_point(mapping = aes(color = class)) +
  geom_smooth(color = "cyan")

#다이아몬드

library(ggplot2)
data("diamonds")
str(diamonds)
?diamonds
?mtcars

#ggplot 은 geom_을 많이 씀


#결과는 똑같이 나옴
p <- ggplot(data = diamonds)
p + geom_bar(mapping = aes(x = cut),
             fill = "steelblue")

p + stat_count(mapping = aes(x = cut),
               fill = "steelblue")

p + geom_bar(mapping = aes (x = cut,
                            fill = clarity), #
             position = "fill") #누적

p + geom_bar(mapping = aes (x = cut,
                            fill = clarity), #
             position = "dodge") #누적
ggplot(data = mpg) + 
  geom_point(mapping = aes (x = displ, y = hwy, 
                            color = class, size = class, alpha = 0.3),
             position = "jitter") #산점도

p <- ggplot (data = mpg,
             mapping= aes(x = class, y = hwy))
p + geom_boxplot(fill = "lightyellow")

p + geom_boxplot(fill = "lightyellow") + coord_flip() # 눕히기
