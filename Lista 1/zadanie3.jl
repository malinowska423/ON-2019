#Aleksandra Malinowska 244925
function printNumbers(a)
    delta = 2^(-52 + floor(log(2,a)))
    for i = 0:10
        println(bitstring(a + i*delta))
    end
end


printNumbers(4.0)
println("")
printNumbers(99.0)

#to be finished