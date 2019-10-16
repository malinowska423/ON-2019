#Aleksandra Malinowska 244925
function findMacheps(type)
    test = one(type)
    while (one(type) + test > one(type))
        test /= 2
    end
    test *= 2
    return test
end

println(eps(Float16))
println(findMacheps(Float16))
println(eps(Float32))
println(findMacheps(Float32))
println(eps(Float64))
println(findMacheps(Float64))