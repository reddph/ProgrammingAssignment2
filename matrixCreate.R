# Create multiple instances of invertible matrices
# Ref: https://matthewhr.wordpress.com/2013/09/01/how-to-construct-an-invertible-matrix-just-choose-large-diagonals/

# matrix[10,10]
mat1 <- matrix(rep(1,100),nrow=10,ncol=10)
for (i in 1:10) {
        for (j in 1:10) {
                if(i == j) {
                        mat1[i,j] <- i
                }
        }
}

# matrix[100,100]
mat2 <- matrix(rep(1,10000),nrow=100,ncol=100)
for (i in 1:100) {
        for (j in 1:100) {
                if(i == j) {
                        mat2[i,j] <- i
                }
        }
}

# matrix[25,25]
mat3 <- matrix(rep(1,625),nrow=25,ncol=25)
for (i in 1:100) {
        for (j in 1:25) {
                if(i == j) {
                        mat3[i,j] <- i
                }
        }
}