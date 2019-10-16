#Aleksandra Malinowska 244925
type = Float64
function f(x)
    n_one= one(type)
    return sqrt( (x^2) + n_one) - n_one
end

function g(x)
    n_one = one(type)
    return (x^2) / (sqrt( (x^2) + n_one) + n_one)
end

function comparator()
    k = -1
    while k > -20
        x = 8.0^k
        f_value = f(x)
        g_value = g(x)
        println("f = ", f_value ," ? " , g_value , " = g")
        k -= 1
    end
end

comparator()