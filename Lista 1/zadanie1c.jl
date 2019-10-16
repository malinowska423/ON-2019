#Aleksandra Malinowska 244925
function findMax(type) 
    counter = one(type) * 2 
    number = one(type)
    while (!isinf(number + counter))
        number += counter
        counter *= 2
    end
    fraction = number / 2
    while (!isinf(number + fraction))
        number += fraction
        fraction /= 2
    end
    return number
end


println(findMax(Float16))
println(floatmax(Float16))
println(findMax(Float32))
println(floatmax(Float32))
println(findMax(Float64))
println(floatmax(Float64))