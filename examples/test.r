vec <- rep(1L, 16)

"vec:"
vec
cat("vec", vec, "\n")
cat("typeof:", typeof(vec), "\n")
cat("mode:", mode(vec), "\n")
cat("class:", class(vec), "\n")
cat("dim: ", dim(vec), "\n\n")

dim(vec) <- c(4,4)

"vec:"
vec
cat("vec", vec, "\n")
cat("typeof:", typeof(vec), "\n")
cat("mode:", mode(vec), "\n")
cat("class:", class(vec), "\n")
cat("dim: ", dim(vec), "\n\n")

vec <- vector('numeric', 16)

"vec:"
vec
cat("vec", vec, "\n")
cat("typeof:", typeof(vec), "\n")
cat("mode:", mode(vec), "\n")
cat("class:", class(vec), "\n")
cat("dim: ", dim(vec), "\n\n")

vec <- list(2,4,6,8,0)

"vec:"
vec
cat("vec", paste(vec, collapse=""), "\n")
cat("typeof:", typeof(vec), "\n")
cat("mode:", mode(vec), "\n")
cat("class:", class(vec), "\n")
cat("dim: ", dim(vec), "\n\n")

my_vector <- c(1,4,5,2,0,9,5,7,3)

my_vector
mask <- c(TRUE, TRUE, FALSE, TRUE, FALSE)
mask
my_vector[mask]

