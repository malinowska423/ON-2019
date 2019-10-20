#Aleksandra Malinowska 244925

#funkcja znajdująca pierwszą liczbę z przedziału [1,2], która nie spełnia równania x * (1/x) = 1
# type - typ arytmetyki 
function findFake(type)
    x = one(type)   #potencjalna szukana
    x = nextfloat(x)
    count = x * (1 / x)
    while count < 2 && count == one(type)
        x = nextfloat(x)
        count = x * (1 / x)
    end
    return x
end

#funkcja znajdująca pierwszą liczbę z przedziału [1,2], która nie spełnia równania x * (1/x) = 1
# type - typ arytmetyki 
function findFakeInf(type)
    x = typemin(type)   #potencjalna szukana
    x = nextfloat(x)
    count = x * (1 / x)
    while count < typemax(type) && count == one(type)
        x = nextfloat(x)
    end
    return x
end


println(findFake(Float64))
println(findFakeInf(Float64))