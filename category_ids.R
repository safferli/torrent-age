library(tibble)

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

categories <- tibble(
  category = c(100, 101, 102, 103, 104, 199, 200, 201, 202, 203, 204, 205, 206, 207, 208, 209, 299, 300, 301, 302, 303, 304, 305, 306, 399, 400, 401, 402, 403, 404, 405, 406, 407, 408, 499, 500, 501, 502, 503, 504, 505, 506, 599, 600, 601, 602, 603, 604, 605, 699), 
  category.name = c("Audio", "Music", "Audio books", "Sound clips", "FLAC", "Other", "Video", "Movies", "Movies DVDR", "Music videos", "Movie clips", "TV shows", "Handheld", "HD - Movies", "HD - TV shows", "3D", "Other", "Applications", "Windows", "Mac", "UNIX", "Handheld", "IOS (iPad/iPhone)", "Android", "Other OS", "Games", "PC", "Mac", "PSx", "XBOX360", "Wii", "Handheld", "IOS (iPad/iPhone)", "Android", "Other", "Porn", "Movies", "Movies DVDR", "Pictures", "Games", "HD - Movies", "Movie clips", "Other", "Other", "E-books", "Comics", "Pictures", "Covers", "Physibles", "Other")
)  
  
write.csv(categories, file = "category_names.csv", row.names = FALSE)  

rm(categories)



