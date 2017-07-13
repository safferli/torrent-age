library(dplyr)

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

dta <- read.table("torrent_dump_2004.csv", 
                  skip = 51, sep = ";", quote = "\"",
                  col.names = c("ADDED", "HASH(B64)", "NAME", "SIZE(BYTES)", "CATEGORY"),
                  colClasses = rep("character", 5)
                  ) %>% 
  mutate(
    category = case_when(
      substring(.$CATEGORY, 1, 1) == "1" ~ "audio",
      substring(.$CATEGORY, 1, 1) == "2" ~ "video",
      substring(.$CATEGORY, 1, 1) == "3" ~ "applications",
      substring(.$CATEGORY, 1, 1) == "4" ~ "games",
      substring(.$CATEGORY, 1, 1) == "5" ~ "pron",
      substring(.$CATEGORY, 1, 1) == "6" ~ "other"
    ), 
    added = as.POSIXct(ADDED, format = "%Y-%b-%d %T")
  )


tally <- dta %>% 
  group_by(category) %>% 
  tally()

tally
