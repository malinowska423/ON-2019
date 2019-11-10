#Aleksandra Malinowska 244925

using LinearAlgebra

#funkcje z plików matcond.jl oraz hilb.jl

function matcond(n::Int, c::Float64)
# Function generates a random square matrix A of size n with
# a given condition number c.
# Inputs:
#	n: size of matrix A, n>1
#	c: condition of matrix A, c>= 1.0
#
# Usage: matcond(10, 100.0)
#
# Pawel Zielinski
    if n < 2
        error("size n should be > 1")
    end
    if c < 1.0
        error("condition number  c of a matrix  should be >= 1.0")
    end
    (U, S, V) = svd(rand(n, n))
    return U * diagm(0 => [LinRange(1.0, c, n);]) * V'
end

function hilb(n::Int)
    # Function generates the Hilbert matrix  A of size n,
    #  A (i, j) = 1 / (i + j - 1)
    # Inputs:
    #	n: size of matrix A, n>=1
    #
    #
    # Usage: hilb(10)
    #
    # Pawel Zielinski
    if n < 1
        error("size n should be >= 1")
    end
    return [1 / (i + j - 1) for i in 1:n, j in 1:n]
end

    #funkcja rozwiązująca równanie metodą Gaussa
    # A - macierz współczynników
    # b - wektor prawych stron
function countGauss(A, b)
    return A \ b;
end
    #funkcja rozwiązująca równanie zgodnie ze wzorem x = A^(-1) * b (metoda (2))
    # A - macierz współczynników
    # b - wektor prawych stron
function countInv(A, b) 
    return inv(A) * b 
end

    #funkcja przeprowadzająca eksperyment z macierzą Hilberta
    # finish - maksymalny rząd macierzy Hilberta
function countHilbert(finish)
    println("\nHilbert\n\n")
    println("n\tGauss\tInv\tcond(a)")
    for i in 2:finish
        print(i)
        A = hilb(i)
        x = ones(Float64, i)
        b = A * x
        xG = countGauss(A, b)
        xInv = countInv(A, b)
        #obliczanie błędu względnego metody Gaussa
        err = norm(xG - x) / norm(x)
        print("\t", err)
        #obliczanie błędu względnego metody (2)
        err = norm(xInv - x) / norm(x)
        print("\t", err)
        #wyświetlanie współczynnika uwarunkowania macierzy
        println("\t", cond(A))
    end
    println("======================\n")
end


    #funkcja przeprowadzająca eksperyment z losową macierzą
function countRandom()
    println("\nRandom\n\n")
    println("n\tc\tGauss\tInv")
    for n in [5, 10, 20]
        for p in [0, 1, 3, 7, 12, 16]
            c::Float64 = 10^p
            print(n, "\t", c)
            A = matcond(n, c)
            x = ones(Float64, n)
            b = A * x
            xG = countGauss(A, b)
            xInv = countInv(A, b)
            #obliczanie błędu względnego metody Gaussa
            err = norm(xG - x) / norm(x)
            print("\t", err)
            #obliczanie błędu względnego metody (2)
            err = norm(xInv - x) / norm(x)
            println("\t", err)
        end
    end
    println("======================\n")
end


countHilbert(20)
countRandom()
