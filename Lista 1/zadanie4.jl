#Aleksandra Malinowska 244925
function findFake(type)
    x = one(type)
    x = nextfloat(x)
    count = x * (1 / x)
    while count < 2 && count == one(type)
        x = nextfloat(x)
        count = x * (1 / x)
    end
    return x
end

println(findFake(Float64))