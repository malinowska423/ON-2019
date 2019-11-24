# Aleksandra Malinowska 244925

#funkcja obliczająca pierwiastek równania metodą Newtona (stycznych)
function mstycznych(f, df, x0::Float64, delta::Float64, epsilon::Float64, maxit::Int)
    r = Float64(0.0) #przybliżona wartość pierwiastka
    v = Float64(0.0)    #wartość f(r)
    it = 0  #liczba itracji
    err = 0 #kod błędu

    r = x0
    v = f(r)

    if abs(df(r)) < epsilon 
        err = 2
        return (r, v, it, err)
    end

    for it in 1:maxit
        x1 = r - v / df(r)
        v = f(x1)
        if abs(x1 - r) < delta || abs(v) < epsilon 
            r = x1
            return (r, v, it, err)
        end
        r = x1
    end
    
    err = 1

    return (r, v, it, err)
end