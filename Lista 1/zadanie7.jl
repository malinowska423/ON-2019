#Aleksandra Malinowska 244925
function f(x)
    return sin(x) + cos(3.0 * x)
end
function f_d(x)
    return cos(x) - 3.0*sin(3.0*x)
end

function f_d_tilda(x0, h)
    return (f(x0 + h) - f(x0)) / h
end

function showLoop(n)
    f_d_real = f_d(1.0)
    for i = 0:n
        h = 2.0^(-i)
        f_tilda = f_d_tilda(1.0,h)
        error = abs(f_d_real - f_tilda)
        println("i = ", i, " ~f(1) = ", f_tilda, " err = ", error)
    end
end

showLoop(54)