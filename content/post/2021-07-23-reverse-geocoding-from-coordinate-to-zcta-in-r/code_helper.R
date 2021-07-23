library(tidyverse)
library(sf)
library(rgdal)

## Read in ZCTA File
load("../../../../BCHC COVID-19 Data/Data/Crosswalks/Clean/xwalk_zcta_bchc.rdata")
sf_zcta_us = readOGR("../../../../Git big files/BCHC/Census ZCTA Shape Files/tl_2019_us_zcta510.shp") %>%
  st_as_sf()
sf_zcta_philly = sf_zcta_us  %>% 
  mutate(zcta = ZCTA5CE10 ) %>% 
  left_join(xwalk_zcta_bchc) %>% 
  filter(city == "Philadelphia")
save(sf_zcta_philly,file = 'sf_zcta_philly.rdata')


