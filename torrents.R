library(dplyr)
library(readr)
#library(gdata)

#100 = Audio
#101 = Music
#102 = Audio books
#103 = Sound clips
#104 = FLAC
#199 = Other
#200 = Video
#201 = Movies
#202 = Movies DVDR
#203 = Music videos
#204 = Movie clips
#205 = TV shows
#206 = Handheld
#207 = HD - Movies
#208 = HD - TV shows
#209 = 3D
#299 = Other
#300 = Applications
#301 = Windows
#302 = Mac
#303 = UNIX
#304 = Handheld
#305 = IOS (iPad/iPhone)
#306 = Android
#399 = Other OS
#400 = Games
#401 = PC
#402 = Mac
#403 = PSx
#404 = XBOX360
#405 = Wii
#406 = Handheld
#407 = IOS (iPad/iPhone)
#408 = Android
#499 = Other
#500 = Porn
#501 = Movies
#502 = Movies DVDR
#503 = Pictures
#504 = Games
#505 = HD - Movies
#506 = Movie clips
#599 = Other
#600 = Other
#601 = E-books
#602 = Comics
#603 = Pictures
#604 = Covers
#605 = Physibles
#699 = Other


# set to US locate to parse date string
Sys.setlocale(category = "LC_TIME", locale = "en_US.UTF-8")

# get category names
if(!file.exists("category_names.csv")){
  source("category_ids.R")
}


# import data
dta <- read_csv2(
  gzfile("torrent_dump_full.csv.gz"), 
  skip = 1,
  col_names = c("ADDED", "HASH(B64)", "NAME", "SIZE(BYTES)", "CATEGORY")
) %>% 
  # convert to POSIX dates, create category groups, human-readable SIZE
  mutate(
    added = as.POSIXct(ADDED, format = "%Y-%b-%d %T"),
    group.id = CATEGORY %/% 100,
    size = gdata::humanReadable(`SIZE(BYTES)`)
  ) %>% 
  # join category groups names
  left_join(
    tibble(
      group = c("audio", "video", "applications", "games", "pron", "other"), 
      group.id = seq.int(1, 6)
    )
  ) %>%
  # join category names
  left_join(
    y = read_csv("category_names.csv"), 
    by = c("CATEGORY" = "category")
  ) %>% 
  # reorder
  select(
    added, NAME, category, category.name, group, size, everything()
  )



tally <- dta %>% 
  group_by(category) %>% 
  tally()

tally




url <- "https://thepiratebay.org/static/dump/csv/torrent_dump_2004.csv.gz"

options(download.file.method = "wget")
test <- read_csv2(url(url))
read.csv2(url(url))

