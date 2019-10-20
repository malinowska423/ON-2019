#Aleksandra Malinowska 244925

#funkcja wypisująca 10 pierwszych liczb z przedziału
# a - początek przedziału
function printNumbers(a)
    delta = 2^(-52 + floor(log(2,a)))   #odstęp między kolejnymi liczbami
    for i = 0:10
        println(bitstring(a + i*delta))
    end
end

printNumbers(0.5)
println("-----")
printNumbers(1.0)
println("-----")
printNumbers(2.0)