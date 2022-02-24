## Library
# install.packages("meta")
# install.packages("dplyr")
library(meta)
library(dplyr)

## Path setting: Binding multi-center result Excel csv file loc
path1 <- "Path"

## Data read
data <- read.csv(paste(path1,"Meta.csv", sep=''), header=TRUE)

## Group by Outcome
# 1. HbA1c
data.1Hb.1 <- filter(data, Outcome=='HbA1c_7' & PSM==1)
data.1Hb.2 <- filter(data, Outcome=='HbA1c_7' & PSM==2)

# 2. Hypoglycemia
data.2hypo.1 <- filter(data, Outcome=="Hypoglycemia" & PSM==1)
data.2hypo.2 <- filter(data, Outcome=="Hypoglycemia" & PSM==2)

# 3. Complications
data.3IHD.1<-filter(data, CatN==3 & Outcome=="IHD" & PSM==1)
data.3IHD.2<-filter(data, CatN==3 & Outcome=="IHD" & PSM==2)

data.3HF.1<-filter(data, CatN==3 & Outcome=="Heart failure" & PSM==1)
data.3HF.2<-filter(data, CatN==3 & Outcome=="Heart failure" & PSM==2)

data.3IS.1<-filter(data, CatN==3 & Outcome=="Ischemic stroke" & PSM==1)
data.3IS.2<-filter(data, CatN==3 & Outcome=="Ischemic stroke" & PSM==2)

data.3DR.1<-filter(data, CatN==3 & Outcome=="Diabetic retinopathy" & PSM==1)
data.3DR.2<-filter(data, CatN==3 & Outcome=="Diabetic retinopathy" & PSM==2)

data.3DN.1<-filter(data, CatN==3 & Outcome=="Diabetic neuropathy" & PSM==1)
data.3DN.2<-filter(data, CatN==3 & Outcome=="Diabetic neuropathy" & PSM==2)

# 4. Diabetic Nephropathy
data.4DN.1<-filter(data, CatN==4 & Outcome=="Diabetic nephropathy" & PSM==1)
data.4DN.2<-filter(data, CatN==4 & Outcome=="Diabetic nephropathy" & PSM==2)


## Setting export directory
setwd("Export directory")
 
############################################################################################################## 1. HbA1c
#######################################################1-1. Outcome: < 7% / Cov: None
for(i in 1:6){
  Meta<-metagen(log(HR),lower=log(lower.HR),upper=log(upper.HR),studlab=Site,sm="HR",data=subset(data.1Hb.1, data.1Hb.1$DrugN==i))
  tiff(file=paste0('1_F7_1_D',i,".tiff"), width=190, height=60, units="mm", res=1000) 
  if(Meta$pval.Q < 0.05){
    forest(Meta, comb.fixed=FALSE, comb.random=TRUE, digits=2, fontsize=10, layout="JAMA", 
           leftcols = c("studlab", "TargetN", "compN","effect.ci"), leftlabs=c("Source", "TargetN", "ComparatorN", "Hazard Ratio\n(95% CI)"), 
           xlab="Hazard Ratio (95% CI)", col.square="black", col.square.lines="black", xlim=c(0.1, 10),
           plotwidth="7cm", col.diamond.random="grey", colgap="6mm", just.addcols="left", 
           label.right="Outcome: HbA1c < 7%", fs.lr=8, ff.lr="plain", weight.study=1, squaresize=0.3)
  } else
    forest(Meta, comb.fixed=TRUE, comb.random=FALSE, digits=2, fontsize=10, layout="JAMA", 
           leftcols = c("studlab", "TargetN", "compN","effect.ci"), leftlabs=c("Source", "TargetN", "ComparatorN", "Hazard Ratio\n(95% CI)"), 
           xlab="Hazard Ratio (95% CI)", col.square="black", col.square.lines="black", xlim=c(0.1, 10),
           plotwidth="7cm", col.diamond.fixed="grey", colgap="6mm", just.addcols="left", 
           label.right="Outcome: HbA1c < 7%", fs.lr=8, ff.lr="plain", weight.study=1, squaresize=0.3) 
  dev.off() 
}

#######################################################1-2. Outcome: < 7% / Cov: Sex, Age, HbA1c
for(i in 1:6){
  Meta<-metagen(log(HR),lower=log(lower.HR),upper=log(upper.HR),studlab=Site,sm="HR",data=subset(data.1Hb.2, data.1Hb.2$DrugN==i))
  tiff(file=paste0('1_F7_2_D',i,".tiff"), width=190, height=60, units="mm", res=1000) 
  if(Meta$pval.Q < 0.05){
    forest(Meta, comb.fixed=FALSE, comb.random=TRUE, digits=2, fontsize=10, layout="JAMA", 
           leftcols = c("studlab", "TargetN", "effect.ci"), leftlabs=c("Source", "No. of\nPatients", "Hazard Ratio\n(95% CI)"), 
           xlab="Hazard Ratio (95% CI)", col.square="black", col.square.lines="black", xlim=c(0.1, 10),
           plotwidth="7cm", col.diamond.random="grey", colgap="6mm", just.addcols="left", 
           label.right="Outcome: HbA1c < 7%", fs.lr=8, ff.lr="plain", weight.study=1, squaresize=0.3)
  } else
    forest(Meta, comb.fixed=TRUE, comb.random=FALSE, digits=2, fontsize=10, layout="JAMA", 
           leftcols = c("studlab", "TargetN", "effect.ci"), leftlabs=c("Source", "No. of\nPatients", "Hazard Ratio\n(95% CI)"), 
           xlab="Hazard Ratio (95% CI)", col.square="black", col.square.lines="black", xlim=c(0.1, 10),
           plotwidth="7cm", col.diamond.fixed="grey", colgap="6mm", just.addcols="left", 
           label.right="Outcome: HbA1c < 7%", fs.lr=8, ff.lr="plain", weight.study=1, squaresize=0.3) 
  dev.off() 
}

############################################################################################################## 2. Hypoglycemia
#######################################################2-1-1. Outcome: Hypoglycemia / Cov: None
for(i in 1:6){
  Meta<-metagen(log(HR),lower=log(lower.HR),upper=log(upper.HR),studlab=Site,sm="HR",data=subset(data.2hypo.1, data.2hypo.1$DrugN==i))
  png(file=paste0('2_F1_1_D',i,".png"), width=650, height=200) 
  forest(Meta, digits=2, fontsize=10, layout="RevMan5", leftcols = c("studlab", "TargetN", "effect", "ci"), 
         leftlabs=c("Source", "No. of Patients", "Hazard Ratio", "95% CI"), xlab="Hazard Ratio (95% CI)")
  dev.off() 
}
#######################################################2-1-2. Outcome: Hypoglycemia / Cov: Sex, Age, HbA1c
for(i in 1:6){
  Meta<-metagen(log(HR),lower=log(lower.HR),upper=log(upper.HR),studlab=Site,sm="HR",data=subset(data.2hypo.2, data.2hypo.2$DrugN==i))
  png(file=paste0('2_F1_2_D',i,".png"), width=650, height=200) 
  forest(Meta, digits=2, fontsize=10, layout="RevMan5", leftcols = c("studlab", "TargetN", "effect", "ci"), 
         leftlabs=c("Source", "No. of Patients", "Hazard Ratio", "95% CI"), xlab="Hazard Ratio (95% CI)") 
  dev.off() 
}

############################################################################################################## 3. Complications
#######################################################3-1-1. Outcome: IHD/ Cov: None
for(i in 1:6){
  Meta<-metagen(log(HR),lower=log(lower.HR),upper=log(upper.HR),studlab=Site,sm="HR",data=subset(data.3IHD.1, data.3IHD.1$DrugN==i))
  png(file=paste0('3_F1_1_D',i,".png"), width=650, height=200) 
  forest(Meta, digits=2, fontsize=10, layout="RevMan5", leftcols = c("studlab", "TargetN", "effect", "ci"), 
         leftlabs=c("Source", "No. of Patients", "Hazard Ratio", "95% CI"), xlab="Hazard Ratio (95% CI)") 
  dev.off() 
}
#######################################################3-1-2. Outcome: IHD/ Cov: Sex, Age, HbA1c, Statin
for(i in 1:6){
  Meta<-metagen(log(HR),lower=log(lower.HR),upper=log(upper.HR),studlab=Site,sm="HR",data=subset(data.3IHD.2, data.3IHD.2$DrugN==i))
  png(file=paste0('3_F1_2_D',i,".png"), width=650, height=200) 
  forest(Meta, digits=2, fontsize=10, layout="RevMan5", leftcols = c("studlab", "TargetN", "effect", "ci"), 
         leftlabs=c("Source", "No. of Patients", "Hazard Ratio", "95% CI"), xlab="Hazard Ratio (95% CI)") 
  dev.off() 
}

#######################################################3-2-1. Outcome: Heart failure/ Cov: None
for(i in 1:6){
  Meta<-metagen(log(HR),lower=log(lower.HR),upper=log(upper.HR),studlab=Site,sm="HR",data=subset(data.3HF.1, data.3HF.1$DrugN==i))
  png(file=paste0('3_F2_1_D',i,".png"), width=650, height=200) 
  forest(Meta, digits=2, fontsize=10, layout="RevMan5", leftcols = c("studlab", "TargetN", "effect", "ci"), 
         leftlabs=c("Source", "No. of Patients", "Hazard Ratio", "95% CI"), xlab="Hazard Ratio (95% CI)") 
  dev.off() 
}
#######################################################3-2-2. Outcome: Heart failure/ Cov: Sex, Age, HbA1c, Statin
for(i in 1:6){
  Meta<-metagen(log(HR),lower=log(lower.HR),upper=log(upper.HR),studlab=Site,sm="HR",data=subset(data.3HF.2, data.3HF.2$DrugN==i))
  png(file=paste0('3_F2_2_D',i,".png"), width=650, height=200) 
  forest(Meta, digits=2, fontsize=10, layout="RevMan5", leftcols = c("studlab", "TargetN", "effect", "ci"), 
         leftlabs=c("Source", "No. of Patients", "Hazard Ratio", "95% CI"), xlab="Hazard Ratio (95% CI)") 
  dev.off() 
}

#######################################################3-3-1. Outcome: Ischemic stroke/ Cov: None
for(i in 1:6){
  Meta<-metagen(log(HR),lower=log(lower.HR),upper=log(upper.HR),studlab=Site,sm="HR",data=subset(data.3IS.1, data.3IS.1$DrugN==i))
  png(file=paste0('3_F3_1_D',i,".png"), width=650, height=200) 
  forest(Meta, digits=2, fontsize=10, layout="RevMan5", leftcols = c("studlab", "TargetN", "effect", "ci"), 
         leftlabs=c("Source", "No. of Patients", "Hazard Ratio", "95% CI"), xlab="Hazard Ratio (95% CI)") 
  dev.off() 
}
#######################################################3-3-2. Outcome: Ischemic stroke/ Cov: Sex, Age, HbA1c, Statin
for(i in 1:6){
  Meta<-metagen(log(HR),lower=log(lower.HR),upper=log(upper.HR),studlab=Site,sm="HR",data=subset(data.3IS.2, data.3IS.2$DrugN==i))
  png(file=paste0('3_F3_2_D',i,".png"), width=650, height=200) 
  forest(Meta, digits=2, fontsize=10, layout="RevMan5", leftcols = c("studlab", "TargetN", "effect", "ci"), 
         leftlabs=c("Source", "No. of Patients", "Hazard Ratio", "95% CI"), xlab="Hazard Ratio (95% CI)") 
  dev.off() 
}

#######################################################3-4-1. Outcome: Diabetic retinopathy/ Cov: None
for(i in 1:6){
  Meta<-metagen(log(HR),lower=log(lower.HR),upper=log(upper.HR),studlab=Site,sm="HR",data=subset(data.3DR.1, data.3DR.1$DrugN==i))
  png(file=paste0('3_F4_1_D',i,".png"), width=650, height=200) 
  forest(Meta, digits=2, fontsize=10, layout="RevMan5", leftcols = c("studlab", "TargetN", "effect", "ci"), 
         leftlabs=c("Source", "No. of Patients", "Hazard Ratio", "95% CI"), xlab="Hazard Ratio (95% CI)") 
  dev.off() 
}
#######################################################3-4-2. Outcome: Diabetic retinopathy/ Cov: Sex, Age, HbA1c, Statin
for(i in 1:6){
  Meta<-metagen(log(HR),lower=log(lower.HR),upper=log(upper.HR),studlab=Site,sm="HR",data=subset(data.3DR.2, data.3DR.2$DrugN==i))
  png(file=paste0('3_F4_2_D',i,".png"), width=650, height=200) 
  forest(Meta, digits=2, fontsize=10, layout="RevMan5", leftcols = c("studlab", "TargetN", "effect", "ci"), 
         leftlabs=c("Source", "No. of Patients", "Hazard Ratio", "95% CI"), xlab="Hazard Ratio (95% CI)") 
  dev.off() 
}

#######################################################3-5-1. Outcome: Diabetic neuropathy/ Cov: None
for(i in 1:6){
  Meta<-metagen(log(HR),lower=log(lower.HR),upper=log(upper.HR),studlab=Site,sm="HR",data=subset(data.3DN.1, data.3DN.1$DrugN==i))
  png(file=paste0('3_F5_1_D',i,".png"), width=650, height=200) 
  forest(Meta, digits=2, fontsize=10, layout="RevMan5", leftcols = c("studlab", "TargetN", "effect", "ci"), 
         leftlabs=c("Source", "No. of Patients", "Hazard Ratio", "95% CI"), xlab="Hazard Ratio (95% CI)") 
  dev.off() 
}
#######################################################3-5-2. Outcome: Diabetic neuropathy/ Cov: Sex, Age, HbA1c, Statin
for(i in 1:6){
  Meta<-metagen(log(HR),lower=log(lower.HR),upper=log(upper.HR),studlab=Site,sm="HR",data=subset(data.3DN.2, data.3DN.2$DrugN==i))
  png(file=paste0('3_F5_2_D',i,".png"), width=650, height=200) 
  forest(Meta, digits=2, fontsize=10, layout="RevMan5", leftcols = c("studlab", "TargetN", "effect", "ci"), 
         leftlabs=c("Source", "No. of Patients", "Hazard Ratio", "95% CI"), xlab="Hazard Ratio (95% CI)") 
  dev.off() 
}

############################################################################################################## 4. Diabetic Nephropathy
#######################################################4-1. Outcome: Diabetic neuropathy/ Cov: None
for(i in 1:6){
  Meta<-metagen(log(HR),lower=log(lower.HR),upper=log(upper.HR),studlab=Site,sm="HR",data=subset(data.4DN.1, data.4DN.1$DrugN==i))
  png(file=paste0('4_F1_1_D',i,".png"), width=650, height=200) 
  forest(Meta, digits=2, fontsize=10, layout="RevMan5", leftcols = c("studlab", "TargetN", "effect", "ci"), 
         leftlabs=c("Source", "No. of Patients", "Hazard Ratio", "95% CI"), xlab="Hazard Ratio (95% CI)") 
  dev.off() 
}
#######################################################4-2. Outcome: Diabetic neuropathy/ Cov: Sex, Age, HbA1c, Statin
for(i in 1:6){
  Meta<-metagen(log(HR),lower=log(lower.HR),upper=log(upper.HR),studlab=Site,sm="HR",data=subset(data.4DN.2, data.4DN.2$DrugN==i))
  png(file=paste0('4_F1_2_D',i,".png"), width=650, height=200) 
  forest(Meta, digits=2, fontsize=10, layout="RevMan5", leftcols = c("studlab", "TargetN", "effect", "ci"), 
         leftlabs=c("Source", "No. of Patients", "Hazard Ratio", "95% CI"), xlab="Hazard Ratio (95% CI)") 
  dev.off() 
}