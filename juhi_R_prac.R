b <-array(c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18),dim=c(3,3,2))
b
b[1,3,2]
b[1,]
b[1,,]
teams=c("PHI","NYM","FLA","ATL","WSN")
w=c(92,89,94,72,59)
l=c(70,73,77,90,102)
results=data.frame(teams,w,l)
results
results$teams
results[1,1]
results[2,3]
e=list(thing="hat",size="34")
e
e$size
e[2]
e[3]
e[0]
f=list(e,location="gurgaon")
f
g=list(thing="hat","cap",size="20","30")
g

getOption("defaultPackages")
(.packages())
(.packages(all.available = TRUE))
library()

d=function(x,y,z){c(x+y+z)}
d(1,5,10)
d

x=3
if (x > 1) "Oranges" else "Apples"
typeof(quote(if(x > 1) "oranges" else "Apples"))
as.list(quote(if(x > 1) "oranges" else "Apples"))


a1=c(1,2,3,4)
b1=c(a1+2)
b1
dj <- read.table("Z:/Analytics/Users/jagarwal/R_prac_juhi.txt",header = FALSE)
dj


x3=data.frame(a=c(1,2,3,4),b=c(pi,2+2))
x3

name=c("juhi","aditi","rubi","arti")
phone=c(1,2,3,4)
location=c("HongKong","Noida","Delhi","Pune")
team=c("A","B","C","D")
friends=data.frame(name,phone,location,team)
friends=edit(friends)
fix(friends)
save(friends,file="Z:/Analytics/Users/jagarwal/friends.rdata")
load("Z:/Analytics/Users/jagarwal/friends.rdata")
friends
hdg=as.integer(3,4)
hdg

animals_vector <- c("Elephant", "Giraffe", "Donkey", "Horse")
factor_animals_vector <- factor(animals_vector)
factor_animals_vector

# Temperature
temperature_vector <- c("High", "Low", "High","Low", "Medium")
factor_temperature_vector <- factor(temperature_vector, order = TRUE, levels = c("Low", "Medium", "High"))
factor_temperature_vector


position_vector=c('M','F','M','F','F')
factor_position_vector=factor(position_vector)
factor_position_vector
levels(factor_position_vector)=c('fe','Ma')
levels(position_vector)[1]="Female"

speed_vector=c("fast","slow","slow","insane","fast")
factor_speed_vector=factor(speed_vector,ordered=TRUE,levels=c("slow","fast","insane"))
da2=factor_speed_vector[2]
da4=factor_speed_vector[4]
da2>da4
Sys.Date()
date()
date_b=as.Date("12/13/2016","%m/%d/%Y")
date_b
def=data.frame("h"=c(1,1,"."))
is.na(def)=def =="."
def
friends
names(friends)
names(friends)[names(friends)=="phone"]="phone_no"
friends
names(friends)[3]="place"
edit(friends)
friends
friends1=data.frame(c(Juhi,101,HongKong,A))
newfriends=rbind(friends,data.frame(name="juhi",phone_no=101,place="HongKong",team="A"))
newfriends
sorta=c(2.4,7.8,5.5,0.2)
order(sorta)
library()
(.packages(all.available = TRUE))
install.packages("dplyr")
library(dplyr)
install.packages("DBI")
view(iris)
##selecting data
DF1=select(iris,Petal.Width,Species)
View(DF1)
Df2=select(iris,starts_with("s",ignore.case = FALSE))
b=select(filter(iris,Sepal.Width>3 & Petal.Length>1),Sepal.Width,Species)
a=distinct(b)
test1=group_by(iris,Species)
View(test1)


a=filter(cars,Price>26720 & Cylinder==8)

View(a)
b=a %>% summarise(avg_price=mean(Price))
b
test=iris %>% select(Species,Sepal.Length,Petal.Length) %>% mutate(ratio=Sepal.Length/Petal.Length)
View(test)
df=data.frame(a=c(1:5),b=c("a","g","h","j","s"),c=c(1,2,3,4,0),x=rnorm(5))
df
df1=data.frame(a=c(1,7,8,9,7),b1=c("as","d","gh","l","p"),c1=c(1,4,5,6,7),x1=c(1.2,3.4,4.5,4,4.5))
df1
P2=read.csv(file="D:/Users/jagarwal/Desktop/P2.csv",header=TRUE)
P1=read.csv(file="D:/Users/jagarwal/Desktop/P1.csv",header=TRUE)
View(P1)
View(P2)
a=inner_join(P1,P2,by="IP")
c=full_join(P1,P2,by="IP")
b=a %>% filter(ServerName=="ERWWDC1")
View(b)
b %>% summarise(mean(CPUSpeed))
View(c)
c %>% summarise(sum1=sum(DaysUptime,na.rm=TRUE))
group_by(c,Domain) %>% summarise(days_mean=mean(DaysUptime))
group_by(c,CPUType) %>% summarise(max_type=mean(Price))
View(d)

install.packages("tidyr")
library("tidyr")
stock=data.frame(date1=as.Date("2017-01-01") + 0:49,x=rnorm(50,20,1),y=rnorm(50,20,1),z=rnorm(50,20,1))
stock
stockgather=gather(data=stock,key=stockc,value=price,x,y,z)
stockspread=spread(data=stockgather,key=stockc,value=price)
head(stockspread)
tidyr.ex=data.frame(participant=c("p1","p2","p3","p4","p5"),info=c("g1-m","g2-f","g1-f","g2-m","g1-m"),day1=rnorm(5,mean=80,sd=25),day2=rnorm(5,mean=60,sd=50))
test3=separate(data=tidyr.ex,info,into=c("group","gender"),sep="-")
unite(test3,new_col,group,gender,sep="-")

install.packages("data.table")
library(data.table)
df=fread("D:/Users/jagarwal/Desktop/P2.csv")
df
nrow(df)
ncol(df)
summary(df)
Dfsubset=df[CPUType=="Intel_Pentium_III"]
str(df)
class(df)
newspeed=df[,newS :=CPUSpeed+100]
df$newS=NULL
df
df[,.(avg_speed=mean(CPUSpeed,na.rm = TRUE))]
df[,.(.N),by=.(CPUType)]
DT=data.table(ID=c('b','b','b','a','a','c'),a=c(1:6),b=c(7:12),c=c(13:18))
DT
DT[,print(.SD),by=ID]
DT[,lapply(.SD,mean),by=ID]
mtcars
DT=as.data.table(mtcars)
class(DT)
DT
head(DT)
as=DT[,avg_mpg:=mean(mpg),by=.(carb)][,avg_cyl:=mean(cyl),by=.(carb)]
print(as)
library(ggplot2)
diamonds
ggplot(diamonds,aes(x=carat,y=price,color=cut))+geom_point()+facet_grid(color~clarity)
colnames(diamonds)
ggplot(diamonds,aes(x=carat,y=price,color=color))+geom_line(alpha=0.9)

head(mtcars)
mutate(separate)
typeof(mtcars)

typeof(mtcars)
dt <- data.table( a= c("30JAN14:23:16:00","23MAY12:02:00:00"), 
                  b=c("03AUG09:00:00:00","13JUN12:02:00:00"), 
                  c=c("31JAN14:15:19:00","23MAY12:00:00:00"))


install.packages("tidyr")
library(tidyr)

dt
data <-
  data.frame(
    shoptype=c("A","B","B"),
    city=c("bah", "bah", "slah"),
    sale=c("type cheese; price 200", "type ham; price 150","type cheese; price 100" )) %>%
  tbl_df()
names(data)
a=separate(data,sale,into=c("type","price"),sep="; price")
b=separate(a,type,into=c("del","type"),sep=" ")
b[,-3] 


names(data)[3]="sale"
names(data)

install.packages("ISLR")
library(ISLR)

dtcollege = data.table(College, keep.rownames = T)
head(dtcollege)
aa=dtcollege[!(Expend>=8000 & Expend <=1400),]
head(aa)
head(dtcollege[order(-Top10perc)],10)$rn
bb$rn

cbind(dtcollege,data.frame(enrollment_ratio=Enroll/Accept))
