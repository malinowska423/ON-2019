#Aleksandra Malinowska 244925
type = Float64
x = type[2.718281828, -3.141592654, 1.414213562, 0.5772156649, 0.3010299957]
y = type[1486.2497, 878366.9879, -22.37492, 4773714.647, 0.000185049]
function forwardMethod() 
    scalar = zero(type)
    for i = 1:5
        scalar += x[i] * y[i]
    end
    return scalar
end

function backwardMethod()
    scalar = zero(type)
    i=5
    while i >= 1
        scalar += x[i] * y[i]
        i -= 1
    end
    return scalar
end

function toSmallest()
    sorted = Array{type}(undef, 5)
    for i = 1:5
        sorted[i] = x[i] * y[i]
    end
    sorted = sort!(sorted, rev=true)
    i = 1
    while i <= 5 && sorted[i] >= 0
        i += 1
    end
    sumNeg = zero(type)
    sumPos = zero(type)
    for k = 1:(i-1)
        sumPos += sorted[k]
    end
    k =5
    while k >= i
        sumNeg += sorted[k] 
        k -= 1
    end
    return (sumNeg + sumPos)
end

function toBiggest()
    sorted = Array{type}(undef, 5)
    for i = 1:5
        sorted[i] = x[i] * y[i]
    end
    sorted = sort!(sorted)
    i = 1
    while i <= 5 && sorted[i] < 0
        i += 1
    end
    sumNeg = zero(type)
    sumPos = zero(type)
    j = i - 1
    while j >= 1
        # println(sorted[j])
        sumNeg += sorted[j]
        j -= 1
    end
    for k = i:5
        # println(sorted[k])
        sumPos += sorted[k] 
    end
    return (sumNeg + sumPos)
end

println(forwardMethod())
println(backwardMethod())
println(toSmallest())
println(toBiggest())
