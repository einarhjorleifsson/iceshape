library(sf)
library(tidyverse)

url <- "http://www.fao.org/figis/geoserver/area/ows?service=WFS&request=GetFeature&version=1.0.0&typeName=area:FAO_AREAS&outputFormat=SHAPE-ZIP"
download.file(url, destfile = "data-raw/fao_areas.zip")
unzip("data-raw/fao_areas.zip", exdir = "data-raw")


fao <-
  read_sf("data-raw/FAO_AREAS.shp",
          stringsAsFactors = FALSE) %>%
  rename_all(., tolower) %>%
  mutate(f_level = tolower(f_level))

# issue: shapefiles not unique:
fao %>% ggplot() + geom_sf(fill = "red", alpha = 0.2)

# One shape, one record
i <- !is.na(fao$f_subunit)
rd <- fao[i,]
rest <- fao[!i & !fao$f_subdivis %in% rd$f_subdivis,]

i <- !is.na(rest$f_subdivis)
rd2 <- rest[i & !rest$f_subunit %in% unique(rd$f_subunit),]
rd <- rbind(rd, rd2)
rest <- rest[!i & !rest$f_division %in% rd$f_division,]

i <- !is.na(rest$f_division)
rd2 <- rest[i & !rest$f_subdivis %in% unique(rd$f_subdivis),]
rd <- rbind(rd, rd2)
rest <- rest[!i & !rest$f_subarea %in% rd$f_subarea,]

i <- !is.na(rest$f_subarea)
rd2 <- rest[i & !rest$f_division %in% unique(rd$f_division),]
rd <- rbind(rd, rd2)
rest <- rest[!i & !rest$f_area %in% rd$f_area,]

i <- !is.na(rest$f_area)
rd2 <- rest[i & !rest$f_subarea %in% unique(rd$f_subarea),]
rd <- rbind(rd, rd2)

# the missing piece
miss <- fao %>% filter(f_area == "71")
rd <- rbind(rd, miss)
# non recognized split
rd <- rd %>% filter(!fid %in% c(130, 133))
# variable name constitue unique name for shapefile
fao <-
  rd %>%
  mutate(name = case_when(!is.na(f_subunit) ~ f_subunit,
                          !is.na(f_subdivis) ~ f_subdivis,
                          !is.na(f_division) ~ f_division,
                          !is.na(f_subarea) ~ f_subarea,
                          TRUE ~ f_area))

# issue solved: each shape covers unqiue area
fao %>% ggplot() + geom_sf(fill = "red", alpha = 0.2)

library(stringr)
colnames(fao) <- str_replace(colnames(fao), "f_", "")
fao <-
  fao %>%
  select(name, ocean:surface, geometry)

devtools::use_data(fao, overwrite = TRUE)
