#Alksandra Malinowska 244925

#funkcja zwracająca wynik twierdzenia Kahana
# type - typ arytmetyki
function countKahan(type)
    base = one(type)    #liczba 1 w danym systemie
    return (3*base)*((4*base)/(3*base) - base) - base
end

#wyświetlanie wyników dla kolejnych arytmetyk
println(eps(Float16))
println(countKahan(Float16))
println(eps(Float32))
println(countKahan(Float32))
println(eps(Float64))
println(countKahan(Float64))