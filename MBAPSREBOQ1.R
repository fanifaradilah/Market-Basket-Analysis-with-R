library(arules)

transaksi_tabular <- read.transactions(file="D:/Backup Fani Sales/2021/5. ANALISA POWER BI ALL 2021/MBAPSREBOQ1.csv", format="single", sep=",", cols=c(1,2), skip=1)

rules <- apriori(transaksi_tabular, parameter = list(supp=10/length(transaksi_tabular), conf=0.5, minlen=2, maxlen=4))

apriori_rules <- c(head(sort(rules, by="lift"), n=100))

inspect(apriori_rules)

top20 <- itemFrequency(transaksi_tabular,type='absolute')
top20 <- sort(top20, decreasing=TRUE)
top20 <- top20[1:20]
top20 <- data.frame("Nama.Produk"=names(top20), "Jumlah"=top20, row.names=NULL)
top20