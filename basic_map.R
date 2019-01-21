#> check for devtools package
if(!requireNamespace("devtools")) install.packages("devtools")
#> ggmap dev version contains register_google
devtools::install_github("dkahle/ggmap", ref = "tidyup", force=TRUE)
library("ggmap")
library("rjson")

#> register api-key for application
secrets <- fromJSON(file= "~/secrets/secret.json")
register_google(key = secrets['mpg_google_key'])

#> generate map
ggmap(
  ggmap = get_map(
    location = c(lon = -114.00, lat = 46.7),
    zoom = 12,
    maptype = "satellite")
)