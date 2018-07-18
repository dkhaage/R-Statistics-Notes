TullySugar.ONI <- read.csv('TullySugar.ONI.csv', header = TRUE)

TullySugar.ONI$phase = with(TullySugar.ONI, cut(ONI.SON,
                                                breaks = c(-Inf,-.49, 0.49, Inf),
                                                labels=c("La.Nina", "Neutral", "El.Nino")))

with(TullySugar.ONI, table(phase))
with(TullySugar.ONI, barplot(table(phase), col = "slateblue", ylab= "# years",las=1,
ylim=c(0,20)))
box()

rm(list = ls())
