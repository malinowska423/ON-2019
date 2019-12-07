# Aleksandra Malinowska 244925

#funkcja obliczajaca wspolczynniki postaci naturalnej wielomianu Newtona
# x - wektor zawieracy wezly
# fx - wektor zawieracy ilorazy roznicowe
function naturalna(x::Vector{Float64}, fx::Vector{Float64})
    n = length(x)   #dluglosc wektora
    a = Vector{Float64}(undef, n)   #wektor zawieracy wspolczynniki postaci naturalnej
    a[n] = fx[n]

    for i = n - 1:-1:1
        a[i] = fx[i] - a[i + 1] * x[i]

        for j = i + 1:n - 1
            a[j] = a[j] - a[j + 1] * x[i]
        end
    end

    return a
end