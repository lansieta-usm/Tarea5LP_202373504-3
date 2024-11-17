% Puentes presentes en el grafo
puente(p1, c, 4).
puente(p3, c, 2).
puente(p4, c, 3).
puente(p2, p1, 3).
puente(p5, p1, 7).
puente(p6, p2, 2).
puente(p7, p2, 3).
puente(p2, p3, 7).
puente(p8, p3, 8).
puente(p10, p3, 3).
puente(p1, p4, 1).
puente(p10, p4, 6).
puente(p11, p4, 7).
puente(p12, p5, 2).
puente(p7, p6, 4).
puente(p8, p9, 3).
puente(p9, p10, 10).
puente(p11, p12, 3).

% Predicado camino: Encuentra un camino desde el nodo inicial (Inicial), hasta el nodo final c.
camino(Inicial, [Inicial|Camino]) :-
    puente(Inicial, C, _),
    C = c,
    Camino = [c].
camino(Inicial, [Inicial|Camino]) :-
    puente(Inicial, Siguiente, _),
    camino(Siguiente, Camino).

% Predicado combustible: Calcula si es posible llegar al nodo c desde un nodo inicial, dado un valor inicial de combustible (CombustibleActual). También devuelve una lista que muestra cómo se va consumiendo el combustible en cada paso.
combustible(_, CombustibleActual, []) :-
    CombustibleActual < 0, !, fail.
combustible(Inicial, CombustibleActual, [[Inicial, CombustibleActual]|Camino]) :-
    puente(Inicial, C, Costo),
    C = c,
    CombustibleActual >= Costo,
    CombustibleRestante is CombustibleActual - Costo,
    Camino = [[c, CombustibleRestante]].
combustible(Inicial, CombustibleActual, [[Inicial, CombustibleActual]|Camino]) :-
    puente(Inicial, Siguiente, Costo),
    CombustibleActual >= Costo,
    CombustibleRestante is CombustibleActual - Costo,
    combustible(Siguiente, CombustibleRestante, Camino).
