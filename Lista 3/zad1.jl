# Aleksandra Malinowska 244925

#funkcja obliczająca pierwiastek równania metodą bisekcji
function mbisekcji(f, a::Float64, b::Float64, delta::Float64, epsilon::Float64) 
    r = Float64(0.0) #przybliżona wartość pierwiastka
    v = Float64(0.0)    #wartość f(r)
    it = 0 #liczba iteracji
    err = 0 #kod błędu

    fa = f(a)
    fb = f(b)

    if signbit(fa) == signbit(fb)
        err = 1
        return (r, v, it, err)
    end

    # długość przedziału
    length = b - a

    while length > epsilon
        it += 1

        length /= 2.0
        r = a + length
        v = f(r)

        if abs(length) < delta || abs(v) < epsilon
            return (r, v, it, err)
        end

        if signbit(v) != signbit(fa)
            b = r
            fb = v
        else
            a = r
            fa = v
        end
    end
end
