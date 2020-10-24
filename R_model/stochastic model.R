#install.packages("tseries")
library("tseries")
#install.packages("stats")
library("stats")
#install.packages("forecast")
library("forecast")
#plot orignal data
t1<-seq(0,36000,302)
length(t1)
#y<-c(read.table('D:/Desktop/data.txt',header=TRUE,as.is = T))
y<-c(0.958778135,0.918014312,0.897420147,0.896864488,0.940071942,1.074885935,1.090294488,1.097196942,1.03926097,1.038508113,1.054370352,1.060434939,1.069789675,1.08723226,1.094783335,1.105102281,1.116946779,1.136820229,1.157015335,1.192672069,1.213712024,1.233490566,1.258035207,1.287240022,1.314219423,1.335781402,1.37793378,1.408850658,1.442042225,1.469200916,1.536678032,1.553023168,1.599962332,1.63537178,1.659661257,1.695337141,1.731019702,1.755931933,1.790633184,1.81013031,1.844665048,1.857661732,1.885865309,1.899099775,1.907778909,1.920875613,1.936616176,1.94718536,1.95122449,1.962104238,1.939786832,1.938289044,1.92991755,1.914232991,1.896944529,1.903527196,1.894937719,1.90741296,1.87545218,1.853853582,1.85038252,1.843336018,1.823975519,1.825821452,1.806351457,1.802020631,1.786347056,1.778739536,1.76308931,1.772597154,1.750039442,1.742781097,1.738544978,1.716775442,1.723439394,1.70781365,1.705896116,1.702750347,1.689082554,1.695213595,1.671684185,1.682715087,1.660554483,1.665112428,1.671165079,1.672518142,1.675750333,1.696371383,1.704230802,1.722790347,1.731846526,1.765128667,1.784817132,1.82170715,1.867158186,1.905779413,1.96625661,2.050332236,2.153994589,2.251886962,2.377573646,2.607781951,2.714009115,2.892166503,3.074921956,3.227361484,3.254385207,3.402875979,3.399315838,3.392872711,3.345964037,3.150891158,3.014572482,2.87085044,2.548429771,2.259144052,1.890045092,2.548429771,2.259144052,1.890045092)
length(y)
options(scipen=200)
plot(t1,y,xlab= 'time', ylab = 'Concentration',"l",xaxt = "n", yaxt ="n")
axis(1,seq(0,36000,302),seq(0,36000,302))
axis(2,seq(0,36000,302), seq(0,36000,302), las = 1, mgp = c(1, 1, 0))
#log e
lncon<-log(y)
length(lncon)
plot(t1,lncon,type='l',xlab='time',ylab='LNConcentration',xaxt = "n")
axis(1,at=seq(0,36000,302),seq(0,36000,302))
#difference
diff.lncon<-diff(lncon)
length(diff.lncon)
t2<-seq(0,36000,305)
length(t2)
plot(t2,diff.lncon,xlab='time',ylab='Diff.Lncon',type='l')
library(tseries)
adf.test(diff.lncon)#root test
diff.lncon2<-diff(diff.lncon)
length(diff.lncon2)
par(mfrow = c(1,2))#graph
acf(diff.lncon2, main='')#autocorrelation function to see MA and AR
pacf(diff.lncon2, main='')#particial autocorrelation function to determine modelMA AR
#From ACF PACF picture:MA=2,AR=2 Try ARIMA model, Find the smallest AIC model
#arima package
require(forecast)
ARIMAfit = auto.arima(diff.lngdp2, approximation=FALSE,trace=FALSE)
summary(ARIMAfit)
#test £ºuse arima to decide which MA and AR suitable
#m1=arima(lngdp, order=c(2,2,1));m1
#m2=arima(lngdp, order=c(2,2,2));m2
m3=Arima(lncon, order=c(0,0,3));m3
#n1=arima(lngdp, order=c(1,2,1));n1
#n2=arima(lngdp, order=c(1,2,2));n2
#n3=arima(lngdp, order=c(1,2,3));n3
#s1=arima(lngdp, order=c(3,2,1));s1
#s2=arima(lngdp, order=c(3,2,2));s2
#s3=arima(lngdp, order=c(3,2,3));s3
#Fit ARIMA model(1,2,1)(2,2,3)

#hist(n1$residuals)
#qqnorm(n1$residuals)
#tsdiag(n1)
#acf(n1$residuals)
#pacf(n1$residuals)
par(mfrow=c(2,1))
#hist(m3$residuals)
#qqnorm(m3$residuals)
#tsdiag(m3)
#acf(m3$residuals)
#pacf(m3$residuals)
#choose ARIMA model (2,2,3) to forecast
par(mfrow=c(1,1))#graph
#library(stats)
library(forecast)#prediction
pred = predict(m3, n.ahead = 10)
pred
options(scipen=200)#
length(t1)
length(y)
plot(t1,y,xlab= 'time', ylab = 'Caffine',"l",xaxt = "n", yaxt ="n")
axis(1,seq(0,36000,302),seq(0,36000,302))
axis(2,seq(0,36000,302), seq(0,36000,302), las = 1, mgp = c(1, 1, 0))
lines(10^(pred$pred),col='blue')
lines(10^(pred$pred+2*pred$se),col='orange')
lines(10^(pred$pred-2*pred$se),col='orange')
library(forecast)
futurVal <- forecast(m3,h=10, level=c(95))
autoplot(forecast(futurVal), xlab= 'Time/10h', ylab = 'Caffine/uM')

