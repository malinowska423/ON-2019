# Aleksandra Malinowska 244925

include("blocksys.jl")
using .blocksys
include("matrixgen.jl")
using .matrixgen
using Plots


function makePlotTest()
    

    ns = [100, 500, 1000, 2000, 5000, 10000, 20000, 25000, 30000, 50000, 100000]
    _l = 4
    cond = one(Float64)

    czas_gauss = Vector{Float64}(undef, length(ns))
    czas_gauss_z_wyborem = Vector{Float64}(undef, length(ns))
    czas_lu = Vector{Float64}(undef, length(ns))
    czas_lu_z_wyborem = Vector{Float64}(undef, length(ns))
    czas_lu_rozwiaz = Vector{Float64}(undef, length(ns))
    czas_lu_rozwiaz_z_wyborem = Vector{Float64}(undef, length(ns))

    pamiec_gauss = Vector{Float64}(undef, length(ns))
    pamiec_gauss_z_wyborem = Vector{Float64}(undef, length(ns))
    pamiec_lu = Vector{Float64}(undef, length(ns))
    pamiec_lu_z_wyborem = Vector{Float64}(undef, length(ns))
    pamiec_lu_rozwiaz = Vector{Float64}(undef, length(ns))
    pamiec_lu_rozwiaz_z_wyborem = Vector{Float64}(undef, length(ns))


    for i = 1:length(ns)

        blockmat(ns[i], _l, cond, "test_matrix.txt")
        println("n: ", ns[i])
        println("l: ", _l)

        A, n, l = pobierzMacierz("test_matrix.txt")
        b = generujWektorB(A, n, l)

    #### Gauss
        wyniki = @timed rozwiazUkladGauss(A, b, n, l)
    
        czas_gauss[i] = wyniki[2] 
        pamiec_gauss[i] = wyniki[3]

        A, n, l = pobierzMacierz("test_matrix.txt")
        b = generujWektorB(A, n, l)

    #### Gauss z wyborem
        wyniki = @timed rozwiazUkladGaussZWyborem(A, b, n, l)
    
        czas_gauss_z_wyborem[i] = wyniki[2]
        pamiec_gauss_z_wyborem[i] = wyniki[3]

        A, n, l = pobierzMacierz("test_matrix.txt")
        b = generujWektorB(A, n, l)

    #### LU
        wyniki = @timed rozkladLU(A, b, n, l)
        data = wyniki[1]

        czas_lu[i] = wyniki[2]
        pamiec_lu[i] = wyniki[3]

        wyniki = @timed rozwiazUkladLU(data[1], data[2], n, l)
    
        czas_lu_rozwiaz[i] = wyniki[2] + czas_lu[i]
        pamiec_lu_rozwiaz[i] = wyniki[3] + pamiec_lu[i]

    #### LU z wyborem

        A, n, l = pobierzMacierz("test_matrix.txt")
        b = generujWektorB(A, n, l)

        wyniki = @timed rozkladLUZWyborem(A, b, n, l)
        data = wyniki[1]

        czas_lu_z_wyborem[i] = wyniki[2]
        pamiec_lu_z_wyborem[i] = wyniki[3]

        wyniki = @timed rozwiazUkladLUZWyborem(data[1], data[2], data[3], n, l)
    
        czas_lu_rozwiaz_z_wyborem[i] = wyniki[2] + czas_lu_z_wyborem[i]
        pamiec_lu_rozwiaz_z_wyborem[i] = wyniki[3] + pamiec_lu_z_wyborem[i]
    end

    function rysujWykres(args, series, labels, title) 
        markercolors = [:green :red :blue :purple]
        plot_title = title
        plot(args, series, label = labels, color = markercolors, linewidth = 1.0, title = plot_title)
        png(title)
    end

# Wykresy
# czas dzialania
    data = [czas_gauss czas_gauss_z_wyborem czas_lu_rozwiaz czas_lu_rozwiaz_z_wyborem]
    labels = ["Gauss" "Gauss z wyborem" "LU" "LU z wyborem"]
    rysujWykres(ns, data, labels, "_czas_dzialania")

# zuzyzcie pamieci
    data = [pamiec_gauss pamiec_gauss_z_wyborem pamiec_lu_rozwiaz pamiec_lu_rozwiaz_z_wyborem]
    rysujWykres(ns, data, labels, "_zuzycie_pamieci")

end

# Testy z pliku
# sciezki = ["testy/Dane16/", "testy/Dane10000/", "testy/Dane50000/"]
wielkosci_n = [1000, 2000, 5000, 10000, 20000, 25000, 30000, 50000]

function testujGaussa(zWyborem::Bool)
    for i = 1:length(sciezki)
        A, b, n, l = pobierzMacierzIWektor(string(sciezki[i], "A.txt"), string(sciezki[i], "b.txt"))
        x = Vector{Float64}(undef, n)
        if (zWyborem)
            x = rozwiazUkladGaussZWyborem(A, b, n, l)
        else
            x = rozwiazUkladGauss(A, b, n, l)
        end
        zapiszDoPliku(string(sciezki[i], zWyborem ? "z_" : "bez_", "wynik.txt"), x, n, false)
    end
end

folder = "wyniki/"

sciezki = ["testy/Dane16/"]

function testujGaussa(zWyborem::Bool, l::Int64, cond::Float64)
    for i = 1:length(wielkosci_n)
        A, b, n, l = pobierzMacierzIWektor(string(folder, wielkosci_n[i], "_macierz.txt"), wielkosci_n[i], l, cond)
        A1, b1 = eliminacjaGaussa(A, b, n, l, zWyborem)
        x = rozwiazUkladGauss(A1, b1, n, l)
        zapiszDoPliku(string(folder, wielkosci_n[i], "_wynik.txt"), x, n, true)
    end    
end

function testujLU(zWyborem::Bool)
    for i = 1:length(sciezki)
        A, b, n, l = pobierzMacierzIWektor(string(sciezki[i], "A.txt"), string(sciezki[i], "b.txt"))
        x = Vector{Float64}(undef, n)
        if (zWyborem) 
            A1, perm, b1 = rozkladLUZWyborem(A, b, n, l)
            x = rozwiazUkladLUZWyborem(A1, perm, b1, n, l)
        else 
            A1, b1 = rozkladLU(A, b, n, l)
            x = rozwiazUkladLU(A1, b1, n, l)
        end
        zapiszDoPliku(string(sciezki[i], zWyborem ? "z_" : "bez_", "LU_wynik.txt"), x, n, false)
    end
end

function testujLU(zWyborem::Bool, l::Int64, cond::Float64)
    for i = 1:length(wielkosci_n)
        A, b, n, l = pobierzMacierzIWektor(string(folder, "LU_", wielkosci_n[i], "_macierz.txt"), wielkosci_n[i], l, cond)
        x = Vector{Float64}(undef, n)
        if (zWyborem)
            A1, b1 = rozkladLUZWyborem(A, b, n, l)
            x = rozwiazUkladLU(A1, b1, n, l)
        else 
            A1, b1 = rozkladLU(A, b, n, l)
            x = rozwiazUkladLU(A1, b1, n, l)
        end
        zapiszDoPliku(string(folder, "LU_", wielkosci_n[i], "_wynik.txt"), x, n, true)
    end    
end

# testujGaussa(true)
# testujGaussa(false)
# testujGaussa(true, 4, one(Float64))
# testujGaussa(false, 4, one(Float64))
# testujLU(true)
# testujLU(false)
# testujLU(true, 4, one(Float64))
# testujLU(false, 4, one(Float64))
# makePlotTest()


sciezki = ["testy/Dane50000/"]

function labTest() 
    A, n, l = pobierzMacierz(string(sciezki[1], "A.txt") )
    b = generujWektorB(A, n, l)
    x = rozwiazUkladGaussZWyborem(A, b, n, l)
    zapiszDoPliku("wyniki/gauss_wybor_50000.txt", x, n, true)

    A, n, l = pobierzMacierz(string(sciezki[1], "A.txt") )
    b = generujWektorB(A, n, l)
    x = rozwiazUkladGauss(A, b, n, l)
    zapiszDoPliku("wyniki/gauss_50000.txt", x, n, true)

    A, n, l = pobierzMacierz(string(sciezki[1], "A.txt") )
    b = generujWektorB(A, n, l)
    A1, b1 = rozkladLU(A, b, n, l)
    x = rozwiazUkladLU(A1, b1, n, l)
    zapiszDoPliku("wyniki/lu_50000.txt", x, n, true)

    A, n, l = pobierzMacierz(string(sciezki[1], "A.txt") )
    b = generujWektorB(A, n, l)
    A1, perm, b1 = rozkladLUZWyborem(A, b, n, l)
    x = rozwiazUkladLUZWyborem(A1, perm, b1, n, l)
    zapiszDoPliku("wyniki/lu_wybor_50000.txt", x, n, true)
end

labTest()