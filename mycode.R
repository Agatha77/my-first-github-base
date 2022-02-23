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


#ggplot으로 geom_bar그리기

p <- ggplot(data = diamonds,
            mapping = aes(x = cut, fill = cut))

p + geom_bar(show.legend = F, width = 1) #width는 barplot의 간격
# 0.5로 두면 간격이 띄워짐

#극좌표계
p + geom_bar(show.legend = F, width = 1) +
  labs(x = NULL, y = NULL) +
  theme(aspect.ratio = 1) +
  coord_polar()

world <- map_data("world")
ggplot(world, aes(long, lat, group = group)) + 
  geom_polygon(fill = "lightyellow", color = "blue")

nz <-map_data("nz")
ggplot(world, aes(long, lat, group = group)) + 
  geom_polygon(fill = "orange", color = "tomato")



##-----------------------데이터 시각화 실습 (타이틀 넣기)----------------------

library(ggplot2)
p <- ggplot (data = mpg,aes(displ, hwy)) + #data생략가능
  geom_point (aes(color = class)) +
  geom_smooth (se = F)

#labs => 타이틀추가
p + labs(title = "Fuel Efficiency .vs. Engine Size",
         subtitle = "Two seaters are exceptional", #서브타이틀
         caption = "Data from fueleconomy.gov", #설명
         x = "Engine displacement (L)", #x축
         y = "Highway fuel economy", #y축
         color = "Car Type") #유형별 색상


##--------------------- r이 함수형 프로그램인 이유 -----------------------

"+"(3,4)

":" (1,10)