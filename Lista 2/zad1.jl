#Aleksandra Malinowska 244925

# kod z zadania 5 z listy 1
type = Float32  #typ arytmetyki
    #wektory po modyfikacji
x = type[2.718281828, -3.141592654, 1.414213562, 0.577215664, 0.301029995]
y = type[1486.2497, 878366.9879, -22.37492, 4773714.647, 0.000185049]
        
        
    #funkcje obliczające sumę   
    #metoda pierwsza ("w przód")
function forwardMethod() 
    sum = zero(type) #wynik dodawania
    for i = 1:5
        sum += x[i] * y[i]
    end
    return sum
end
    
    #metoda druga ("w tył")
function backwardMethod()
    sum = zero(type) #wynik dodawania
    i = 5 #zmienna sterująca pętlą
    while i >= 1
        sum += x[i] * y[i]
        i -= 1
    end
    return sum
end
    
    #metoda trzecia
function toSmallest()
    sorted = Array{type}(undef, 5)  #tablica z posortowanymi wartościami
    for i = 1:5
        sorted[i] = x[i] * y[i]
    end
    sorted = sort!(sorted, rev = true)
    i = 1
    while i <= 5 && sorted[i] >= 0
        i += 1
    end
    sumNeg = zero(type) #suma liczb ujemnych
    sumPos = zero(type) #suma liczb dodatnich
    for k = 1:(i - 1)
        sumPos += sorted[k]
    end
    k = 5
    while k >= i
        sumNeg += sorted[k] 
        k -= 1
    end
    return (sumNeg + sumPos)
end
    
    #metoda czwarta
function toBiggest()
    sorted = Array{type}(undef, 5)  #tablica z posortowanymi wartościami
    for i = 1:5
        sorted[i] = x[i] * y[i]
    end
    sorted = sort!(sorted)
    i = 1
    while i <= 5 && sorted[i] < 0
        i += 1
    end
    sumNeg = zero(type) #suma liczb ujemnych
    sumPos = zero(type) #suma liczb dodatnich
    j = i - 1
    while j >= 1
        sumNeg += sorted[j]
        j -= 1
    end
    for k = i:5
        sumPos += sorted[k] 
    end
    return (sumNeg + sumPos)
end
    
    #wyświetlenie wyników
println("Float32: ")
println("1: ", forwardMethod())
println("2: ", backwardMethod())
println("3: ", toSmallest())
println("4: ", toBiggest())
    
type = Float64
x = type[2.718281828, -3.141592654, 1.414213562, 0.577215664, 0.301029995]
y = type[1486.2497, 878366.9879, -22.37492, 4773714.647, 0.000185049]
println("Float64: ")
println("1: ", forwardMethod())
println("2: ", backwardMethod())
println("3: ", toSmallest())
println("4: ", toBiggest())

        