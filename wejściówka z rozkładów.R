library(knitr)
library(rmarkdown)
load("dane do wejściówki z rozkładów.RData")

opisZmiennych = data.frame(
  zmienna = names(etykiety),
  opis = etykiety
)
poczatek1 = c("", "imię i nazwisko: ..................................", "", "---", "")
poczatek2 = c("",
              "### Przy każdym z poniższych rozkładów napisz:",
              "",
              "  * co to za typ rozkładu (brzegowy/skumulowany brzegowy/łączny/rodzina rozkładów warunkowych; liczebności/częstości)",
              "  * jakiej/jakich zmiennej/zmiennych",
              "     * używaj opisów znaczenia zmiennych, a nie liter oznaczających zmienne,",
              "     * w przypadku rodzin rozkładów warunkowych użyj sformułowania wskazującego zmienną *warunkującą*: *coś* ze względu na *coś innnego*.",
              "")

rozklady = list(brzegowyLiczebnosci = NULL, brzegowyCzestosci = NULL,
                skumulowanyLiczebnosci = NULL, skumulowanyCzestosci = NULL,
                lacznyLiczebnosci = NULL, lacznyCzestosci = NULL,
                rwrLiczebnosci = NULL, rwrCzestosci = NULL)

tresc = vector(mode = "character", length = 0)
for (i in 1:3) {
  zmienne = vector(mode = "numeric" , length = 0)
  # brzegowy liczebności
  j = sample(ncol(dane), 1)
  zmienne = c(zmienne, j)
  tab = table(dane[, j])
  tab = setNames(data.frame(w = c(names(tab), "suma"), n = c(tab, sum(tab))),
               c(paste0(tolower(names(etykiety)[j]), "_i"),
                 paste0("N(", names(etykiety)[j], " = ",
                        tolower(names(etykiety)[j]), "_i)")))
  rozklady$brzegowyLiczebnosci = kable(tab, row.names = FALSE,
                                       format.args = list(decimal.mark = ","))
  # brzegowy częstości
  j = sample(ncol(dane), 1)
  zmienne = c(zmienne, j)
  tab = round(prop.table(table(dane[, j])), 2)
  tab[1] = 1 - sum(tab[-1])
  tab = setNames(data.frame(w = c(names(tab), "suma"), n = c(tab, sum(tab))),
               c(paste0(tolower(names(etykiety)[j]), "_i"),
                 paste0("P(", names(etykiety)[j], " = ",
                        tolower(names(etykiety)[j]), "_i)")))
  rozklady$brzegowyCzestosci = kable(tab, row.names = FALSE,
                                     format.args = list(decimal.mark = ","))
  # skumulowany liczebności
  j = sample(ncol(dane), 1)
  zmienne = c(zmienne, j)
  tab = cumsum(table(dane[, j]))
  tab = setNames(data.frame(w = names(tab), n = tab),
                 c(paste0(tolower(names(etykiety)[j]), "_i"),
                   paste0("N(", names(etykiety)[j], " <= ",
                          tolower(names(etykiety)[j]), "_i)")))
  rozklady$skumulowanyLiczebnosci = kable(tab, row.names = FALSE,
                                          format.args = list(decimal.mark = ","))
  # skumulowany częstości
  j = sample(ncol(dane), 1)
  zmienne = c(zmienne, j)
  tab = round(cumsum(prop.table(table(dane[, j]))), 2)
  tab = setNames(data.frame(w = names(tab), n = tab),
                 c(paste0(tolower(names(etykiety)[j]), "_i"),
                   paste0("P(", names(etykiety)[j], " <= ",
                          tolower(names(etykiety)[j]), "_i)")))
  rozklady$skumulowanyCzestosci = kable(tab, row.names = FALSE,
                                        format.args = list(decimal.mark = ","))
  # łączny liczebności
  j = sample(1:4, 1)
  k = sample(5:11, 1)
  zmienne = c(zmienne, j, k)
  tab = addmargins(table(dane[, k], dane[, j]))
  rownames(tab) =  sub("^Sum$", "suma", rownames(tab))
  colnames(tab) =  sub("^Sum$", "suma", colnames(tab))
  rozklady$lacznyLiczebnosci =
    c(paste0("N(", names(etykiety)[k], " = ",
             tolower(names(etykiety)[k]), "_i ˄ ",
             names(etykiety)[j], " = ",
             tolower(names(etykiety)[j]), "_j)"),
      "", kable(tab, format.args = list(decimal.mark = ",")))
  # łączny czestosci
  j = sample(1:4, 1)
  k = sample(5:11, 1)
  zmienne = c(zmienne, j, k)
  tab = round(prop.table(table(dane[, k], dane[, j])), 3)
  tab[1, 1] = 1 - sum(as.vector(tab)[-1])
  tab = addmargins(tab)
  rownames(tab) =  sub("^Sum$", "suma", rownames(tab))
  colnames(tab) =  sub("^Sum$", "suma", colnames(tab))
  rozklady$lacznyCzestosci =
    c(paste0("P(", names(etykiety)[k], " = ",
             tolower(names(etykiety)[k]), "_i ˄ ",
             names(etykiety)[j], " = ",
             tolower(names(etykiety)[j]), "_j)"),
      "", kable(tab, format.args = list(decimal.mark = ",")))
  # warunkowy liczebności
  j = sample(1:4, 1)
  k = sample(5:11, 1)
  zmienne = c(zmienne, j, k)
  tab = addmargins(table(dane[, k], dane[, j]), 1)
  rownames(tab) =  sub("^Sum$", "suma", rownames(tab))
  rozklady$rwrLiczebnosci =
    c(paste0("N(", names(etykiety)[k], " = ",
             tolower(names(etykiety)[k]), "_i | ",
             names(etykiety)[j], " = ",
             tolower(names(etykiety)[j]), "_j)"),
      "", kable(tab, format.args = list(decimal.mark = ",")))
  # warunkowy czestosci
  j = sample(1:4, 1)
  k = sample(5:11, 1)
  zmienne = c(zmienne, j, k)
  tab = round(prop.table(table(dane[, k], dane[, j]), 2), 3)
  tab[1, ] = 1 - colSums(tab[-1, ])
  tab = addmargins(tab, 1)
  rownames(tab) =  sub("^Sum$", "suma", rownames(tab))
  rozklady$rwrCzestosci =
    c(paste0("P(", names(etykiety)[k], " = ",
             tolower(names(etykiety)[k]), "_i | ",
             names(etykiety)[j], " = ",
             tolower(names(etykiety)[j]), "_j)"),
      "", kable(tab, format.args = list(decimal.mark = ",")))
  # generowanie tekstu
  tresc = c(tresc, poczatek1,
            kable(opisZmiennych[sort(unique(zmienne)), ], row.names = FALSE),
            poczatek2, "", "---", "")
  kolejnosc = sample(length(rozklady), length(rozklady))
  for (i in kolejnosc) {
    tresc = c(tresc, "", paste0(rep(".", 458), collapse = ""), "",
              rozklady[[i]], "", "---")
  }
}

#tresc = c("---", "output: odt_document", "---", "", tresc)
writeLines(tresc, file("temp.Md", encoding = "UTF-8"))
render("temp.Md", "odt_document", encoding = "UTF-8")
