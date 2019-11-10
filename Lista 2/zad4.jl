# Aleksandra Malinowska 244925

using Polynomials


    #funkcja przeprowadzająca eksperyment Wilkinsona
    #coeff - macierz współczynników wielomianu
function wilkinsonExperiment(coeff)
    println("Wilkinson")
    coeffRev = coeff[end:-1:1]
    poly_P = Poly(coeffRev) #wielomian P(x)
    roots_z_k = roots(poly_P)   #pierwiastki wielomianu

    roots_k = zeros(20) #dokładne pierwiastki wielomianu
    for i in 1:20
        roots_k[i] = Float64(i)
    end
    #wypisanie wielomianu
    println("P(x)= ", poly_P)
    
    P = zeros(20) #wartości wielomianu P(x)
    p = zeros(20)   #wartości wielomianu p(x)
    diff = zeros(20)    #wartości różnicy z_k - k
    roots_k = roots_k[end:-1:1]
    for i in 1:20
        prev = 1
        for j in roots_k
            p[i] = prev * (roots_z_k[i] - j)
            prev  = p[i]
        end
        p[i] = abs(p[i])
    end
    for k in 1:20
        P[k] = abs(polyval(poly_P, roots_z_k[k]))
        diff[k] = abs(roots_z_k[k] - roots_k[k])
    end

    #wypisanie danych
    println("\n\nk\tz_k\t|z_k-k|\t|P(z_k)|\t|p(z_k)|")
    i = 20
    while(i >= 1)
        print(roots_k[i])
        print("\t", roots_z_k[i])
        print("\t", diff[i])
        print("\t", P[i])
        println("\t", p[i])
        i = i - 1
    end
    println("=========================\n")
end


#funkcja przeprowadzająca eksperyment Wilkinsona ze zmieonym współczynnikiem
#coeff - macierz współczynników wielomianu
function modifiedWilkinsonEx(coeff)
    println("Wilkinson modified")
    coeffRev = coeff[end:-1:1]
    poly_P = Poly(coeffRev) #wielomian P(x)
    roots_z_k = roots(poly_P)#pierwiastki wielomianu
    #wypisanie wielomianu
    println("P(x)=", poly_P)
    
    roots_k = zeros(20) #dokładne pierwiastki wielomianu
    for i in 1:20
        roots_k[i] = Float64(i)
    end
    roots_k = roots_k[end:-1:1]
    
    P = zeros(20) #wartości wielomianu P(x)
    diff = zeros(20)    #wartości różnicy z_k - k
    for k in 1:20
        P[k] = abs(polyval(poly_P, roots_z_k[k]))
        diff[k] = abs(roots_z_k[k] - roots_k[k])
    end
    
    #wypisanie danych
    println("\n\nk\tz_k\t|z_k-k|\t|P(z_k)|")
    i = 20
    while(i >= 1)
        print(roots_k[i])
        print("\t", roots_z_k[i])
        print("\t", diff[i])
        println("\t", P[i])
        i = i - 1
    end
    println("=========================\n")
end

# współczyniiki wielomianu Wilkinsona z pliku wielomian.jl
coeffWilkinson = [1, -210.0, 20615.0,-1256850.0,
53327946.0,-1672280820.0, 40171771630.0, -756111184500.0,          
11310276995381.0, -135585182899530.0,
1307535010540395.0,     -10142299865511450.0,
63030812099294896.0,     -311333643161390640.0,
1206647803780373360.0,     -3599979517947607200.0,
8037811822645051776.0,      -12870931245150988800.0,
13803759753640704000.0,      -8752948036761600000.0,
      2432902008176640000.0]

# współczynniki po modyfikacji
coeffNew = copy(coeffWilkinson)
coeffNew[2] = -210.0 - 2.0^(-23)

wilkinsonExperiment(coeffWilkinson)
modifiedWilkinsonEx(coeffNew)
