library(ggplot2)
library(dplyr)
getwd()
setwd("C:/R_project2021_2")
data <- read.csv("seoul.csv")
data.xy_1 <- data %>% filter(사용일자 == 20211030) #파이프 연산자 %>%
data.xy_2 <- data %>% filter(사용일자 == 20211031)
data.xy_3 <- data %>% filter(사용일자 == 20211030)
data.xy_4 <- data %>% filter(사용일자 == 20211031)
data.re_1 <- data.xy_1[order(data.xy_1$하차총승객수,decreasing=T),]#토요일 하차
data.re_2 <- data.xy_2[order(data.xy_2$하차총승객수,decreasing=T),]#일요일 하차
data.re_3 <- data.xy_3[order(data.xy_3$승차총승객수,decreasing=T),]#토요일 승차
data.re_4 <- data.xy_4[order(data.xy_4$승차총승객수,decreasing=T),]#일요일 승차
data.re_1 <- data.re_1[c(1:15),]
data.re_2 <- data.re_2[c(1:15),]
data.re_3 <- data.re_3[c(1:15),]
data.re_4 <- data.re_4[c(1:15),]

ggplot(data.re_1, aes(x=역명)) +
  geom_point(aes(y=승차총승객수, size=3, color=역명)) +
  geom_point(aes(y=하차총승객수, size=3)) +
  ggtitle("역별 승차인원_할로윈당일") +
  theme(plot.title = element_text (size=25, face="bold", colour = "steelblue")) +
  theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5 ))