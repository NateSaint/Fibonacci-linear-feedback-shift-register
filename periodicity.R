# Nathen St. Germain
# Find the periodicity
periodicity <- function(my.rand) {
	rand_nums <- c()

	# Current position in vector (rand_nums)
	i <- 1

	while (TRUE) {
		rand_nums <- c(rand_nums, my.rand(1))

		# Lead in sequence counter (number of rands before loop)
		leadIn <- 1

		# Check for duplicate whenever a new rand number is produced
		while (leadIn < length(rand_nums)) {
			if (rand_nums[leadIn] == rand_nums[i]) {
				if (leadIn != 1)
					return (c(i,i - leadIn,leadIn))
				else
					return (c(i - 1, i - leadIn, leadIn - 1))
			}
			leadIn <- leadIn + 1
		}

		i <- i + 1
	}
}