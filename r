cat("Praktiskais darbs Nr. 1 -- Artjoms Sitnuks\n\n")

# ielasīt CSV datni spectra2.csv kā datu ietvaru, atpazīstot kolonnu nosaukumus un skaitļus
# TE JŪSU KODS
if (!require("readr")) {
  install.packages("readr")
}

library(readr)
file_path <- "spectra2.csv"

my_locale <- readr::locale(decimal_mark = ",")

data <- read_csv(file_path, locale = my_locale)

str(data)

# izdrukāt datu ietvara tās kolonnas, kuru nosaukumos ir grieķu burti
# atcerieties, ka labāk ir atsaukties uz kolonnām pēc to nosaukuma, ne kārtas numura
# TE JŪSU KODS
grieku_kolonnas <- names(data)[grepl("[[:alpha:]]", names(data))]

print(data[grieku_kolonnas])


# izdrukāt datu ietvara tās rindiņas, kuru kārtas numurs ir vienāds ar Jūsu atzīmi iepriekšējā semestrī – kā arī rindiņas, kuru kārtas numurs ir šā skaitļa daudzkārtņi
# TE JŪSU KODS

print(data[c(6, 12), ])

# aprēķināt un izvadīt:
#    vidējo vērtību λS1 un λS2 (rezultāts ir vektors)
#    mediānu λS1 un λS2 (rezultāts ir vektors)
#    iepriekšējo divu lielumu starpību (rezultāts ir vektors)
#    standartnovirzi λS1 un λS2 (rezultāts ir vektors)
# TE JŪSU KODS

vid_s1 <- mean(data$λS1)
vid_s2 <- mean(data$λS2)

med_s1 <- median(data$λS1)
med_s2 <- median(data$λS2)

starpiba_s1 <- diff(data$λS1)
starpiba_s2 <- diff(data$λS2)

sd_s1 <- sd(data$λS1)
sd_s2 <- sd(data$λS2)

cat("Vidējā vērtība kolonnai λS1:", vid_s1, "\n")
cat("Vidējā vērtība kolonnai λS2:", vid_s2, "\n\n")

cat("Mediāna kolonnai λS1:", med_s1, "\n")
cat("Mediāna kolonnai λS2:", med_s2, "\n\n")

cat("Iepriekšējo divu lielumu starpība kolonnā λS1:", starpiba_s1, "\n")
cat("Iepriekšējo divu lielumu starpība kolonnā λS2:", starpiba_s2, "\n\n")

cat("Standartnovirze kolonnai λS1:", sd_s1, "\n")
cat("Standartnovirze kolonnai λS2:", sd_s2, "\n")

# aprēķināt un izvadīt:
#    maksimālās vērtības katrai no kolonnām (rezultāts ir vektors)
#    minimālās vērtības katrai no kolonnām (rezultāts ir vektors)
#    decimālo logaritmu BLA vērtībai (rezultāts ir vektors; nepievērsiet uzmanību kļūdām, kas vēsta par NaN rašanās)
# TE JŪSU KODS

max_v <- apply(data, 2, max)

min_v <- apply(data, 2, min)

log_bla <- log10(data$BLA)

cat("Maksimālās vērtības katrai no kolonnām:\n")
print(max_v)
cat("\n")

cat("Minimālās vērtības katrai no kolonnām:\n")
print(min_v)
cat("\n")

cat("Decimālie logaritmi BLA vērtībai:\n")
print(log_bla)

# izvadīt vienu rakstzīmju virkni, kas sastāv no visām kolonnu nosaukumos ietvertajām  rakstzīmēm
# TE JŪSU KODS

kolonnu_virkne <- paste(names(data), collapse = "")
cat("Kolonnu nosaukumu virkne:", kolonnu_virkne, "\n")
