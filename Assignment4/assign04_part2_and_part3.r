# CSI 3120 Assignment 4 Solution
# Student Name: Elad Tzemach
# Student Number: 7505407
# Student Email: etzem012@uottawa.ca

year1 <- matrix(, nrow = 3, ncol = 12)
year2 <- matrix(, nrow = 3, ncol = 12)
year3 <- matrix(, nrow = 3, ncol = 12)

var <- 1

while (var < 4) {

ac_oct_may <- rpois(8, 5)
ac_vector <- c(ac_oct_may[1], ac_oct_may[2], ac_oct_may[3],ac_oct_may[4],ac_oct_may[5],30,45,50,30,ac_oct_may[6],ac_oct_may[7],ac_oct_may[8])


ha_vector <- as.integer(runif(12,10,40) ) 
 

toys_averages <- as.integer(rnorm(12, mean = 30, sd = 9))
nov_num <- as.integer(runif(1,100,200) ) 
dec_num <- as.integer(runif(1,300,400) ) 
toys_averages[11] <- toys_averages[11]+nov_num
toys_averages[12] <- toys_averages[12]+dec_num


# constructing sales matrix
M = matrix(c(ac_vector, ha_vector, toys_averages), nrow=3, ncol=12, byrow=TRUE)
colnames(M) <- c("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")
rownames(M) <- c("A/C", "Appliances", "Toys")






# constructing initial matrix
ac_initial <- c(10,10,10,10,10,30,50,50,30,10,10,10)
ha_initial <- c(40,40,40,40,40,40,40,40,40,40,40,40)
toys_initial <- c(40,40,40,40,40,40,40,40,40,40,400,400)
I = matrix(c(ac_initial, ha_initial, toys_initial), nrow=3, ncol=12, byrow=TRUE)
colnames(M) <- c("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")
rownames(M) <- c("A/C", "Appliances", "Toys")


index <- as.integer(1) 
res <- rep(0,36)
diff <- I-M


for (i in 1:nrow(diff))
{
  for (j in 1:ncol(diff))
{
    if (i == 1 && j == 12) {
       if (diff[1,12] > I[1,1]) { 
       res[index] <- 0
       index <- index + 1 } else {
       res[index] <- abs(diff[1,12] - I[1,1])
       index <- index + 1 }}
    else if (i == 2 && j == 12) {
       if (diff[2,12] > I[2,1]) {
       res[index] <- 0
       index <- index + 1 } else {
       res[index] <- abs(diff[2,12] - I[2,1])
       index <- index + 1 }}
    else if (i == 3 && j == 12) {
       if (diff[3,12] > I[3,1]) {
       res[index] <- 0
       index <- index + 1 } else {
       res[index] <- abs(diff[3,12] - I[3,1])
       index <- index + 1 }}
    else {
    res[index] <- I[i,j+1] - diff[i,j]
    index <- index + 1 }
}
}


final = matrix(res, nrow=3, ncol=12, byrow=TRUE)
colnames(final) <- c("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")
rownames(final) <- c("A/C", "Appliances", "Toys")

if (var == 1) {
    year1 <- final }
else if (var ==2) {
    year2 <- final }
else {
    year3 <- final }

var <- var + 1
} 
#end of while loop

print("Order Matrix: (Simulation for one year)")
print(diff)


cat_matrix <- cbind(year1,year2,year3)




#########   PART 3, SECTION 1   #########

print("The Simulation for 3 Years:")
print(cat_matrix)



avg_jan <- as.integer((cat_matrix[1,1] + cat_matrix[1,13] + cat_matrix[1,25]) / 3)
avg_feb <- as.integer((cat_matrix[1,2] + cat_matrix[1,14] + cat_matrix[1,26]) / 3)
avg_mar <- as.integer((cat_matrix[1,3] + cat_matrix[1,15] + cat_matrix[1,27]) / 3)
avg_apr <- as.integer((cat_matrix[1,4] + cat_matrix[1,16] + cat_matrix[1,28]) / 3)
avg_may <- as.integer((cat_matrix[1,5] + cat_matrix[1,17] + cat_matrix[1,29]) / 3)
avg_jun <- as.integer((cat_matrix[1,6] + cat_matrix[1,18] + cat_matrix[1,30]) / 3)
avg_jul <- as.integer((cat_matrix[1,7] + cat_matrix[1,19] + cat_matrix[1,31]) / 3)
avg_aug <- as.integer((cat_matrix[1,8] + cat_matrix[1,20] + cat_matrix[1,32]) / 3)
avg_sep <- as.integer((cat_matrix[1,9] + cat_matrix[1,21] + cat_matrix[1,33]) / 3)
avg_oct <- as.integer((cat_matrix[1,10] + cat_matrix[1,22] + cat_matrix[1,34]) / 3)
avg_nov <- as.integer((cat_matrix[1,11] + cat_matrix[1,23] + cat_matrix[1,35]) / 3)
avg_dec <- as.integer((cat_matrix[1,12] + cat_matrix[1,24] + cat_matrix[1,36]) / 3)

ac_total_avg <- c(avg_jan, avg_feb, avg_mar, avg_apr, avg_may, avg_jun, avg_jul, avg_aug, avg_sep, avg_oct, avg_nov, avg_dec)

hist(ac_total_avg,ylim = c(0,12),xlim=c(0,50), main="A/C Average")

avg_jan <- as.integer((cat_matrix[2,1] + cat_matrix[2,13] + cat_matrix[2,25]) / 3)
avg_feb <- as.integer((cat_matrix[2,2] + cat_matrix[2,14] + cat_matrix[2,26]) / 3)
avg_mar <- as.integer((cat_matrix[2,3] + cat_matrix[2,15] + cat_matrix[2,27]) / 3)
avg_apr <- as.integer((cat_matrix[2,4] + cat_matrix[2,16] + cat_matrix[2,28]) / 3)
avg_may <- as.integer((cat_matrix[2,5] + cat_matrix[2,17] + cat_matrix[2,29]) / 3)
avg_jun <- as.integer((cat_matrix[2,6] + cat_matrix[2,18] + cat_matrix[2,30]) / 3)
avg_jul <- as.integer((cat_matrix[2,7] + cat_matrix[2,19] + cat_matrix[2,31]) / 3)
avg_aug <- as.integer((cat_matrix[2,8] + cat_matrix[2,20] + cat_matrix[2,32]) / 3)
avg_sep <- as.integer((cat_matrix[2,9] + cat_matrix[2,21] + cat_matrix[2,33]) / 3)
avg_oct <- as.integer((cat_matrix[2,10] + cat_matrix[2,22] + cat_matrix[2,34]) / 3)
avg_nov <- as.integer((cat_matrix[2,11] + cat_matrix[2,23] + cat_matrix[2,35]) / 3)
avg_dec <- as.integer((cat_matrix[2,12] + cat_matrix[2,24] + cat_matrix[2,36]) / 3)

ha_total_avg <- c(avg_jan, avg_feb, avg_mar, avg_apr, avg_may, avg_jun, avg_jul, avg_aug, avg_sep, avg_oct, avg_nov, avg_dec)

dev.new()

hist(ha_total_avg,ylim = c(0,12),xlim=c(0,50), main="Appliances Average")

avg_jan <- as.integer((cat_matrix[3,1] + cat_matrix[3,13] + cat_matrix[3,25]) / 3)
avg_feb <- as.integer((cat_matrix[3,2] + cat_matrix[3,14] + cat_matrix[3,26]) / 3)
avg_mar <- as.integer((cat_matrix[3,3] + cat_matrix[3,15] + cat_matrix[3,27]) / 3)
avg_apr <- as.integer((cat_matrix[3,4] + cat_matrix[3,16] + cat_matrix[3,28]) / 3)
avg_may <- as.integer((cat_matrix[3,5] + cat_matrix[3,17] + cat_matrix[3,29]) / 3)
avg_jun <- as.integer((cat_matrix[3,6] + cat_matrix[3,18] + cat_matrix[3,30]) / 3)
avg_jul <- as.integer((cat_matrix[3,7] + cat_matrix[3,19] + cat_matrix[3,31]) / 3)
avg_aug <- as.integer((cat_matrix[3,8] + cat_matrix[3,20] + cat_matrix[3,32]) / 3)
avg_sep <- as.integer((cat_matrix[3,9] + cat_matrix[3,21] + cat_matrix[3,33]) / 3)
avg_oct <- as.integer((cat_matrix[3,10] + cat_matrix[3,22] + cat_matrix[3,34]) / 3)
avg_nov <- as.integer((cat_matrix[3,11] + cat_matrix[3,23] + cat_matrix[3,35]) / 3)
avg_dec <- as.integer((cat_matrix[3,12] + cat_matrix[3,24] + cat_matrix[3,36]) / 3)

toys_total_avg <- c(avg_jan, avg_feb, avg_mar, avg_apr, avg_may, avg_jun, avg_jul, avg_aug, avg_sep, avg_oct, avg_nov, avg_dec)

dev.new()

hist(toys_total_avg,ylim = c(0,12),xlim=c(0,400), main="Toys Average")


#########   PART 3, SECTION 3   #########

###create the pie for January###
x <- c(cat_matrix[1,13], cat_matrix[2,13], cat_matrix[3,13])
labels <- c("A/C", "Appliances", "Toys")
piepercent <- round(100*x/sum(x), 1)
pie(x,labels = piepercent, main="Year 2, January", col=rainbow(length(x)))
legend("topright", c("A/C", "Appliances", "Toys"), cex=0.8, fill = rainbow(length(x)))
dev.new()

###create the pie for February###
x <- c(cat_matrix[1,14], cat_matrix[2,14], cat_matrix[3,14])
labels <- c("A/C", "Appliances", "Toys")
piepercent <- round(100*x/sum(x), 1)
pie(x,labels = piepercent, main="Year 2, February", col=rainbow(length(x)))
legend("topright", c("A/C", "Appliances", "Toys"), cex=0.8, fill = rainbow(length(x)))
dev.new()

###create the pie for March###
x <- c(cat_matrix[1,15], cat_matrix[2,15], cat_matrix[3,15])
labels <- c("A/C", "Appliances", "Toys")
piepercent <- round(100*x/sum(x), 1)
pie(x,labels = piepercent, main="Year 2, March", col=rainbow(length(x)))
legend("topright", c("A/C", "Appliances", "Toys"), cex=0.8, fill = rainbow(length(x)))
dev.new()

###create the pie for April###
x <- c(cat_matrix[1,16], cat_matrix[2,16], cat_matrix[3,16])
labels <- c("A/C", "Appliances", "Toys")
piepercent <- round(100*x/sum(x), 1)
pie(x,labels = piepercent, main="Year 2, April", col=rainbow(length(x)))
legend("topright", c("A/C", "Appliances", "Toys"), cex=0.8, fill = rainbow(length(x)))
dev.new()

###create the pie for May###
x <- c(cat_matrix[1,17], cat_matrix[2,17], cat_matrix[3,17])
labels <- c("A/C", "Appliances", "Toys")
piepercent <- round(100*x/sum(x), 1)
pie(x,labels = piepercent, main="Year 2, May", col=rainbow(length(x)))
legend("topright", c("A/C", "Appliances", "Toys"), cex=0.8, fill = rainbow(length(x)))
dev.new()

###create the pie for June###
x <- c(cat_matrix[1,18], cat_matrix[2,18], cat_matrix[3,18])
labels <- c("A/C", "Appliances", "Toys")
piepercent <- round(100*x/sum(x), 1)
pie(x,labels = piepercent, main="Year 2, June", col=rainbow(length(x)))
legend("topright", c("A/C", "Appliances", "Toys"), cex=0.8, fill = rainbow(length(x)))
dev.new()

###create the pie for July###
x <- c(cat_matrix[1,19], cat_matrix[2,19], cat_matrix[3,19])
labels <- c("A/C", "Appliances", "Toys")
piepercent <- round(100*x/sum(x), 1)
pie(x,labels = piepercent, main="Year 2, July", col=rainbow(length(x)))
legend("topright", c("A/C", "Appliances", "Toys"), cex=0.8, fill = rainbow(length(x)))
dev.new()

###create the pie for August###
x <- c(cat_matrix[1,20], cat_matrix[2,20], cat_matrix[3,20])
labels <- c("A/C", "Appliances", "Toys")
piepercent <- round(100*x/sum(x), 1)
pie(x,labels = piepercent, main="Year 2, August", col=rainbow(length(x)))
legend("topright", c("A/C", "Appliances", "Toys"), cex=0.8, fill = rainbow(length(x)))
dev.new()

###create the pie for September###
x <- c(cat_matrix[1,21], cat_matrix[2,21], cat_matrix[3,21])
labels <- c("A/C", "Appliances", "Toys")
piepercent <- round(100*x/sum(x), 1)
pie(x,labels = piepercent, main="Year 2, September", col=rainbow(length(x)))
legend("topright", c("A/C", "Appliances", "Toys"), cex=0.8, fill = rainbow(length(x)))
dev.new()

###create the pie for October###
x <- c(cat_matrix[1,22], cat_matrix[2,22], cat_matrix[3,22])
labels <- c("A/C", "Appliances", "Toys")
piepercent <- round(100*x/sum(x), 1)
pie(x,labels = piepercent, main="Year 2, October", col=rainbow(length(x)))
legend("topright", c("A/C", "Appliances", "Toys"), cex=0.8, fill = rainbow(length(x)))
dev.new()

###create the pie for November###
x <- c(cat_matrix[1,23], cat_matrix[2,23], cat_matrix[3,23])
labels <- c("A/C", "Appliances", "Toys")
piepercent <- round(100*x/sum(x), 1)
pie(x,labels = piepercent, main="Year 2, November", col=rainbow(length(x)))
legend("topright", c("A/C", "Appliances", "Toys"), cex=0.8, fill = rainbow(length(x)))
dev.new()

###create the pie for December###
x <- c(cat_matrix[1,24], cat_matrix[2,24], cat_matrix[3,24])
labels <- c("A/C", "Appliances", "Toys")
piepercent <- round(100*x/sum(x), 1)
pie(x,labels = piepercent, main="Year 2, December", col=rainbow(length(x)))
legend("topright", c("A/C", "Appliances", "Toys"), cex=0.8, fill = rainbow(length(x)))
dev.new()


#########   PART 3, SECTION 4   #########

months <- c("Jan", "Jan", "Jan", "Feb", "Feb", "Feb", "Mar", "Mar", "Mar", "Apr", "Apr", "Apr",
"May", "May", "May", "Jun", "Jun", "Jun", "Jul", "Jul", "Jul", "Aug", "Aug", "Aug",
"Sep", "Sep", "Sep", "Oct", "Oct", "Oct", "Nov", "Nov", "Nov", "Dec", "Dec", "Dec")

barplot(matrix(c(cat_matrix[1,1], cat_matrix[1,13],cat_matrix[1,25],
                 cat_matrix[1,2], cat_matrix[1,14],cat_matrix[1,26],
                 cat_matrix[1,3], cat_matrix[1,15],cat_matrix[1,27],
                 cat_matrix[1,4], cat_matrix[1,16],cat_matrix[1,28],
                 cat_matrix[1,5], cat_matrix[1,17],cat_matrix[1,29],
                 cat_matrix[1,6], cat_matrix[1,18],cat_matrix[1,30],
                 cat_matrix[1,7], cat_matrix[1,19],cat_matrix[1,31],
                 cat_matrix[1,8], cat_matrix[1,20],cat_matrix[1,32],
                 cat_matrix[1,9], cat_matrix[1,21],cat_matrix[1,33],
                 cat_matrix[1,10], cat_matrix[1,22],cat_matrix[1,34],
                 cat_matrix[1,11], cat_matrix[1,23],cat_matrix[1,35],
                 cat_matrix[1,12], cat_matrix[1,24],cat_matrix[1,36]

                   ),nr=12), beside=T, 
        col=c("aquamarine3","coral","cyan1"), 
        names.arg=months, las="2")
legend("topleft", c("Year1","Year2","Year3"), pch=15, 
       col=c("aquamarine3","coral","cyan1"), 
       bty="n")



##### Write an R script that answers the following questions when executed: #####

##### Question 1 #####

print(M)
appliance_min <- 0
appliance_min_month <- ""

for (i in 1:ncol(M)){
  if (M[2,i] > appliance_min) {
     appliance_min <- M[2,i] 
     appliance_min_month <- colnames(M)[i]}}
  print(paste0("Greatest number of home appliances sold is ", appliance_min))
  print(paste0("In the month of ", appliance_min_month))



##### Question 2 #####

print(M)

nom <- 0
sum <- 0
m_vector <- c()

for (i in 1:ncol(M)){
  if (M[3,i] > 50) {
       sum <- sum + M[3,i]
       nom <- nom + 1
       m_vector <- append(m_vector, colnames(M)[i])
       }}
  print(paste0("More than 50 toys were sold in ", nom, " months"))
  paste(c("The months are: ", m_vector), collapse=" ")
  print(paste0("A total of ", sum, " toys were sold"))


##### Question 3 #####

H <- c(M[1,1], M[1,2], M[1,3], M[1,4], M[1,5], M[1,6], M[1,7], M[1,8], M[1,9], M[1,10], M[1,11], M[1,12])
avg <- as.integer(sum(H) / 12)
print(avg)
J <- c(M[1,1] - avg, M[1,2] - avg, M[1,3] - avg, M[1,4] - avg, M[1,5] - avg, M[1,6] - avg, M[1,7] - avg, M[1,8] - avg, M[1,9] - avg, M[1,10] - avg, M[1,11] - avg, M[1,12] - avg)

barplot(J, names.arg=c("Jan","Feb","Mar","Apr","May","Jun","Jul", "Aug", "Sep", "Oct", "Nov", "Dec"))

dev.new()

