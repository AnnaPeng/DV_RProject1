require("jsonlite")
require("RCurl")
require("ggplot2")
# Change the USER and PASS below to be your UTEid
df <- data.frame(fromJSON(getURL(URLencode('129.152.144.84:5001/rest/native/?query="select * from titanic where age is not null and age>=2"'),httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521/PDBF15DV.usuniversi01134.oraclecloud.internal', USER='cs329e_pp9774', PASS='orcl_pp9774', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON'), verbose = TRUE), ))
ggplot()+
  coord_cartesian() + 
  scale_x_discrete() +
  scale_y_continuous() +
  facet_wrap(~AGE, ncol=15)+
  labs(title= "Titanic")+
  labs(x="SURVIVED", y="AGE")+
  layer(data=df, mapping = aes(x=SEX, y=as.numeric(as.character(AGE)), color=SEX),
        stat="identity", 
        stat_params=list(), 
        geom="point",
        geom_params=list(), 
        position=position_jitter(width=0.3, height=0)
        
  )