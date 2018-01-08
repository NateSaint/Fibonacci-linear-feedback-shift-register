# Author: Nathen St. Germain
# Fibonacci Linear Feedback Shift Registers implementation

# Generate 7 bit lsfr function
genSevenBitLFSR <- function () {
	# Doesn't matter what the starting bit is
	bits <- c(1,0,1,0,1,1,0)

	function (n) {
		# Declare vector to add outputted pRNG values to
		rands <- c()

		for (i in 1:n) {
			# sequentially xor the bits
			newBit <- xor(bits[7], bits[6])

			# shift in the new bit
			bits <<- rightShift(newBit, bits)

			# convert bits to decimal number and add to return vector
			rands[length(rands) + 1] <- convertBits(bits)
		}
		rands
	}
}

# Generate 14 bit lsfr function
genFourteenBitLFSR <- function () {
	# Doesn't matter what the starting bit is
	bits <- c(0,1,0,1,1,0,1,1,0,1,0,1,0,1)

	function (n) {
		# Declare vector to add outputted pRNG values to
		rands <- c()

		for (i in 1:n) {
			# sequentially xor the bits
			newBit <- xor(bits[2], xor(bits[12], xor(bits[13], bits[14])))

			# shift in the new bit
			bits <<- rightShift(newBit, bits)

			# convert bits to decimal number and add to return vector
			rands[length(rands) + 1] <- convertBits(bits)
		}
		rands
	}
}

# convert a vector with n bits to a decimal number
convertBits <- function (bits) {
	i <- length(bits)
	power <- 0
	converted <- 0

	while (i > 0) {
		# multiply by 2^n based on position in array and add it to total
		converted <- converted + (('^'(2,power)) * bits[i])
		power <- power + 1
		i <- i - 1
	}

	converted
}

# shift the bits to the right and enter the new bit to the left
rightShift <- function (newBit, bits) {
	newBits <- c()
	i <- length(bits)

	# Shift all bits to the right, kicking out the right-most digit
	while (i > 1) {
		newBits[i] <- bits[i - 1]
		i <- i - 1
	}

	#Put new first bit in then output the new bits
	newBits[1] <- newBit
	newBits
}