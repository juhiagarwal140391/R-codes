
lib.location        <- "Z:\\Analytics\\Users\\jagarwal\\R_Libs"
workspace.location  <- "Z:/Analytics/Users/jagarwal/workspace/"
#Setting up personal library
#---------------------------
.libPaths(c(.libPaths(), lib.location))

#Setting up worskspace
#---------------------
setwd(workspace.location)


#install.packages("RPostgreSQL", lib = lib.location)
#install.packages("h2o", lib = lib.location)
#install.packages("data.table", lib = lib.location)
#install.packages("frailtypack", lib = lib.location)

#require("RPostgreSQL",  lib.loc = lib.location)
#require("dplyr",  lib.loc = lib.location)
#require("RODBC",  lib.loc = lib.location)
#require("h2o",  lib.loc = lib.location)
require("data.table",  lib.loc = lib.location)
require("mlr",        lib.loc = lib.location)
require("frailtypack",        lib.loc = lib.location)
require("sqldf", lib.loc = lib.location)

require("smbinning",  lib.loc = lib.location)
require("reshape2",   lib.loc = lib.location)
require("FSelector", lib.loc = lib.location)
require("Boruta",     lib.loc = lib.location)
require("caret",     lib.loc = lib.location)
require("rFerns",     lib.loc = lib.location)
require("rpart",     lib.loc = lib.location)
require("ROCR",     lib.loc = lib.location)
require("ROSE",     lib.loc = lib.location)
require("randomForest",     lib.loc = lib.location)
require("caretEnsemble",     lib.loc = lib.location)
require("gbm",     lib.loc = lib.location)
require('doParallel',     lib = lib.location)
require("xgboost",  lib.loc = lib.location)
require("dplyr",  lib.loc = lib.location)
require("fmsb",  lib.loc = lib.location)


validationSet <- fread("hha_variables2017juhi.csv")
head(validationSet)
str(validationSet)
summary(validationSet)## this shows data has NAs and tells me what all are factors, integer fields and continuous feilds

#column names and their class in datasetClass1
DFClass=sapply(validationSet,class)
DFClass1=cbind.data.frame(names(DFClass),DFClass)
rownames(DFClass1)=NULL
colnames(DFClass1)=c("colnames","class")
DFClass1



## finding the no of NAs in columns
ColNAs=sapply(validationSet,function(x)sum(is.na(x)))
typeof(ColNAs)

DFNaSum=cbind.data.frame(names(ColNAs),ColNAs)
colnames(DFNaSum)=c("colnames","NAnos")
DFNaSum1=DFNaSum[DFNaSum$NAnos!=0,]
rownames(DFNaSum1)=NULL

DFNaSum1#columns having NAs

#Extracting unique levels for each variable 
#------------------------------------------
unique.values=sapply(validationSet, function(x)length(unique(x)))
DFUniqueValues=cbind.data.frame(names(unique.values), unique.values)
rownames(DFUniqueValues)=NULL
colnames(DFUniqueValues)=c("colnames","UnqCnt")
typeof(DFUniqueValues)


All1=cbind.data.frame(DFClass1,DFUniqueValues$UnqCnt,DFNaSum$NAnos)
colnames(All1)=c("ColNames","Class","UnqCNT","NACnt")

IndexContinuous=which(All1$UnqCNT >10)
All1$VarType=""
All1$VarType[IndexContinuous]="Continuous"
All1$VarType[-IndexContinuous]="Categorical"

##table with col names, class, no of unique vals, Na count and var type in All1
as.data.table(All1)
fwrite(All1,file="VarsInfo.csv",append = FALSE,row.names = FALSE)



##na % is less than 30 so we will keep all vars
validationSet%>%summarize_all(funs(sum(is.na(.))/length(.)))

ALLcont=All1[All1$VarType=="Categorical",ColNames]
validationSet[ ,`:=`(end_date = NULL, start_date = NULL, wb_pgs_faq=NULL,retail_enrol_flag=NULL)]


categorical.vars <- All1$ColNames[which(All1$VarType=="Categorical")]



