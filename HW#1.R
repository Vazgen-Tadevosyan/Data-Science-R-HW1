

#1) (1p)
#Create a vector "a", containing integers from 1 to 100 and 200 to 300.
a<-c(1:100,200:300)
class(a)
#Use help (bottom right corner in RStudio) and find a function that returns
#the length of an object and print the length of the vector.
print(length(a))
#2) (2p)
#Create a vector "a" containing integers 1-5, letters A,B and C and a boolean value TRUE.
#print the type of the vector and explain why is it of that type.
a<-c(1:5,"A","B","C",T)
class(a)
##it is character type of.All elements in atomic vector must be the same type, if it is not R will coerc 
#it the most flexible type in this case it is Char   

#3a) (2p) 
#Generate a vector containing even numbers from 2 to 50 inclusive (Hint! ?seq)
b<-seq(2,50,by=2)
#Build a 5x5 matrix and populate it with the vector generated above, where matrix 
#elements are increasing by row. Finally check whether R stored it as a matrix.
b_matrix<-matrix(b,nrow = 5,byrow = T)
is.matrix(b_matrix)#it is matrix

#3b) (1p)
#Print the element for which Row=3 Column=4. Make the diagonal elements of the matrix 0 (Hint! ?diag)
print(b_matrix[3,4])#28
?diag
diag(b_matrix)<-0
b_matrix
#4a) (1p)
#Load the "SportsAnalytics270" library, load the dataset "nba2009_2016" 
#from it and save it in R with the name "nba".
library(SportsAnalytics270)
data("nba2009_2016")
nba<-data.frame(nba2009_2016)
#4b) (2p)
#check the structure of the "nba" database and answer the following questions.
str(nba)
dim(nba)
#*) What is the number of rows and columns?
#9600 rows and 9 columns

#*) What are the datatypes of columns "home.PTS", "home.WL" and "home.TEAM_NAME"
#"home.PTS"-numeric, 
#"home.WL"--character, 
#"home.TEAM_NAME"-Factor


#5) (3p)
#Subset the dataframe "nba" into "nba_matches" which will store only home.TEAM_NAME, home.PTS,
#away.TEAM_NAME and away.PTS. Do the same by using column indexes and column names.
nba_matches<-nba[,c("home.TEAM_NAME","home.PTS","away.TEAM_NAME","away.PTS")]
nba_matches<-nba[,c(4,5,7,8)]
#6) (3p)
#Subset the "nba" dataframe into "nba_1" containing onyl those games, where the 
#minimum difference between points is 5. (Hint! ?abs)
nba_1<-nba[abs(nba$home.PTS-nba$away.PTS)>=5,]
check_min<-min(abs(nba_1$home.PTS-nba_1$away.PTS))
check_min
#7) (4p)
#Write a function that takes "x" as an argument and returns vector "y" containing all
#the divisors of "x". (Hint! x%%y expression shows the remainder when x is divided by y)
foo<-function(x){
  y<-c()
  for (i in 1:x){
    if(x%%i==0){
      y<-c(y,i)
    }
  }
y}
foo(12)

#8) (3p)
#Use for loop statement to populate a 5x5 square matrix with random numbers from
#the interval 1-10. (Hint! ?sample).
z<-c()
for (i in 1:5){
  z<-cbind(z,sample(1:10,5))
}
class(z)
z
#9) (5p)
#Write a function that takes "x" vector as an input and returns it in an increasing order.
#(Warning!!! Don't use any built in sorting function in R or from other libraries)
#(Hint! There are many sorting algorithms used to sort a vector, an array etc. One is bubblesort)
# https://en.wikipedia.org/wiki/Bubble_sort
bubble<-function(vec){
  for(i in 1:(length(vec)-1)){
    for (j in 1:(length(vec)-i)){
      if(vec[j]>vec[j+1]){
        t <- vec[j+1]
        vec[j+1]<-vec[j]
        vec[j]<-t}
      }
  }
vec}
v<-c(34,6,4,88)
bubble(v)
#10) (3p)
# Load Exams dataset from Moodle, explain in what format (wide, long) it's represented
#and convert vice versa(If it is wide, convert to long and if long, convert to wide.)
exams<-read.csv("Exams.csv")
str(exams)
head(exams)
#it is long format (tidy)as we see it has an individual's repeated observations distributed 
#across rows.and every row is key value combination
library(reshape2)
new<-reshape(exams,timevar = "Exam",idvar = "Person",direction = "wide")
head(new)
