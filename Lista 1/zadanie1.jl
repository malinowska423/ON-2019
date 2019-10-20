#Aleksandra Malinowska 244925

#funkcja znajdująca epsilon maszynowy
# type - typ arytmetyki
function findMacheps(type)
    epsilon = one(type) #poszukiwany epsilon
    while (one(type) + epsilon > one(type))
        epsilon /= 2
    end
    epsilon *= 2
    return epsilon
end

#wyświetlanie wyników dla kolejnych arytmetyk
println("Epsilon (16,32,64): ")
println(eps(Float16))
println(findMacheps(Float16))
println(eps(Float32))
println(findMacheps(Float32))
println(eps(Float64))
println(findMacheps(Float64))


#funkcja znajdująca wartość liczby eta
# type - typ arytmetyki
function findEta(type)
    eta = one(type) #poszukiwana eta
    while (eta/2 > zero(type))
        eta /= 2
    end
    return eta
end

#wyświetlanie wyników dla kolejnych arytmetyk
println("Eta (16,32,64): ")
println(nextfloat(Float16(0.0)))
println(findEta(Float16))
println(nextfloat(Float32(0.0)))
println(findEta(Float32))
println(nextfloat(Float64(0.0)))
println(findEta(Float64))


#wyświetlanie wartości floatmin()
println("Min (32,64):")
println(floatmin(Float32))
println(floatmin(Float64))


#funkcja znajdująca największą liczbę danej arytmetyki
# type - typ arytmetyki
function findMax(type) 
    max_number = one(type)  #poszukiwany max
    counter = one(type) * 2     #zmienna pomocnicza (szukanie części całkowitej)
    while (!isinf(max_number + counter))
        max_number += counter
        counter *= 2
    end
    fraction = max_number / 2   #zmienna pomocnicza (szukanie części ułamkowej)
    while (!isinf(max_number + fraction))
        max_number += fraction
        fraction /= 2
    end
    return max_number
end

#wyświetlanie wyników dla kolejnych arytmetyk
println("Max (16,32,64): ")
println(findMax(Float16))
println(floatmax(Float16))
println(findMax(Float32))
println(floatmax(Float32))
println(findMax(Float64))
println(floatmax(Float64))