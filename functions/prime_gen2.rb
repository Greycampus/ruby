#!/usr/bin/ruby -w

# seive of erathosthenes to generate primes
def soe(n , prime)
	p = 2
	while p * p <= n
		if prime[p] 
			i = p * 2
			while i <= n
				prime[i] = false
				i = i + p
			end
		end
		p = p + 1
	end
	return prime
end

# checking whether the prime meets required condition
def mp(n)
	# initilising an array
	prime = Array.new(n+1,true)
	prime = soe(n,prime)
	k = 2
	while (1<<k)-1 <= n
		# 1<<k generates powers of 2
		num = (1<<k)-1
		if prime[num] 
			puts num
		end
		num1 = (1<<k) + 1
		if prime[num1]
			puts num1
		end
		k = k + 1
	end
end

# storing the console message in variable
msg = "Enter the number"
# printing the msg to the console
puts msg
# reading the input from the console
n = gets.chomp.to_i
puts "Primes less than #{n} are"
# calling the function
mp(n)