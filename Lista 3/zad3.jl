# Aleksandra Malinowska 244925

#funkcja obliczająca pierwiastek równania metodą siecznych
function msiecznych(f, x0::Float64, x1::Float64, delta::Float64, epsilon::Float64, maxit::Int)
    r = Float64(0.0) #przybliżenie pierwiastka równania
    v = Float64(0.0)    #wartość f(r)
    it = 0  #liczba iteracji
    err = 0 #kod błędu

    f_x0 = f(x0)
    f_x1 = f(x1)

    for it in 1:maxit
        if abs(f_x0) > abs(f_x1)
            x0, x1 = x1, x0
            f_x0, f_x1 = f_x1, f_x0
        end

        s = (x1 - x0) / (f_x1 - f_x0)
        x1 = x0
        f_x1 = f_x0
        x0 -= f_x0 * s 
        f_x0 = f(x0)

        if abs(x1 - x0) < delta || abs(f_x0) < epsilon
            r = x0
            v = f_x0
            return(r, v, it, err)
        end
    end

    err = 1
    r = x0
    v = f_x0
    return(r, v, it, err)
end