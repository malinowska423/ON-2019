#Aleksandra Malinowska 244925

type = Float64  #typ arytmetyki

#funkcja zwracająca wartość funkcji f(x)
# x - liczba rzeczywista należąca do dziedziny funkcji
function f(x)
    n_one= one(type)    #liczba 1 w danej arytmetyce
    return sqrt( (x^2) + n_one) - n_one
end

#funkcja zwracająca wartość funkcji g(x)
# x - liczba rzeczywista należąca do dziedziny funkcji
function g(x)
    n_one = one(type)   #liczba 1 w danej arytmetyce
    return (x^2) / (sqrt( (x^2) + n_one) + n_one)
end

#funkcja wyświetlająca wartości funkcji f(x) i g(x) dla kolejnych wartości x
function comparator()
    k = -1 #potęga x
    while k > -200
        x = 8.0^k   #wartość zmiennej x
        f_value = f(x)  #wartość funkcji f(x)
        g_value = g(x)  #wartość funkcji g(x)
        println("x = 8^", k, " f = ", f_value ," ? " , g_value , " = g")
        k -= 1
    end
end

comparator()