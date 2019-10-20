#Aleksandra Malinowska 244925

#funkcja zwracająca wartość funkcji f(x)
# x - liczba rzeczywista należąca do dziedziny funkcji
function f(x)
    return sin(x) + cos(3.0 * x)
end

#funkcja zwracająca rzeczywistą wartość pochodnej funkcji f(x)
# x - liczba rzeczywista należąca do dziedziny funkcji
function f_d(x)
    return cos(x) - 3.0*sin(3.0*x)
end

#funkcja zwracająca przybliżoną wartość pochodnej funkcji f(x)
# x - liczba rzeczywista należąca do dziedziny funkcji
# h - otoczenie x
function f_d_tilda(x0, h)
    return (f(x0 + h) - f(x0)) / h
end

#funkcja wyświetlająca kolejne wartości przybliżonej pochodnej oraz błędu bezwzględego
# n - ilość iteracji; ostatnia przeciwna potęga h
function showLoop(n)
    f_d_real = f_d(1.0) #rzeczywista wartość pochodnej w punkcie x0 = 1.0 
    println(f_d_real)
    for i = 0:n
        h = 2.0^(-i)    #wartość h
        f_tilda = f_d_tilda(1.0,h)  #przybliżona wartość pochodnej
        error = abs(f_d_real - f_tilda) #błąd bezwzględny
        println("i = ", i, " ~f(1) = ", f_tilda, " err = ", error)
    end
end

#funkcja wyświetlająca kolejne wartości (h+1)
# n - ilość iteracji; ostatnia przeciwna potęga h
function showLoopH(n)
    for i = 0:n
        h = 2.0^(-i)
        println("i = ", i , " h = ", h, " h+1 = ", h+1)
    end
end

showLoop(54)
println("----")
showLoopH(54)