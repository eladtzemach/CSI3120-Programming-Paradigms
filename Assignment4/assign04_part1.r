# CSI 3120 Assignment 4 Solution
# Student Name: Elad Tzemach
# Student Number: 7505407
# Student Email: etzem012@uottawa.ca


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

print(final)
