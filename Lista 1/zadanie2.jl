#Alksandra Malinowska 244925

function countKahan(type)
    base = one(type)
    return (3*base)*((4*base)/(3*base) - base) - base
end


println(eps(Float16))
println(countKahan(Float16))
println(eps(Float32))
println(countKahan(Float32))
println(eps(Float64))
println(countKahan(Float64))