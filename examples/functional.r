ve <- c(1,2,3)
ve

# Assigning inside of a lambda does not work
Map(function (x) {ve[1] <- 4}, ve)

# ve[1] <- 4

ve