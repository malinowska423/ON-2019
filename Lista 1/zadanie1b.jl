#Aleksandra Malinowska 244925
function findEta(type)
    test = one(type)
    while (test/2 > zero(type))
        test /= 2
    end
    return test
end
println(nextfloat(Float16(0.0)))
println(findEta(Float16))
println(nextfloat(Float32(0.0)))
println(findEta(Float32))
println(nextfloat(Float64(0.0)))
println(findEta(Float64))