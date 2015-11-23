
load("modelFit.rf.RData") # Guardado al hacer knitr sobre Course Projec.Rmd

pml_testing <- read.csv("Data/pml-testing.csv")

ProjecTesting<-select(pml_testing,
                      starts_with("roll"),
                      starts_with("pitch"),
                      starts_with("yaw"),
                      starts_with("total"),
                      starts_with("gyros"),
                      starts_with("accel"),
                      starts_with("magnet"))

answers<-as.character(predict(modelFit.rf, ProjecTesting))


# Funcion para crear un fichero con cada predicccion
pml_write_files = function(x){
       n = length(x)
       for(i in 1:n){
              filename = paste0("problem_id_",i,".txt")
              write.table(x[i],file=filename,quote=FALSE,row.names=FALSE,col.names=FALSE)
       }
}

pml_write_files(answers)