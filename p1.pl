% Predicado lista_inversa: Toma una lista e invierte sus elementos... Un símil del .reverse() de Python
lista_inversa([], []).
lista_inversa([Car | Cdr], Invertida) :- 
    lista_inversa(Cdr, CDRInvertido),
    append(CDRInvertido, [Car], Invertida).

% Predicado sublista: Dada una lista, un inicio y un final, saca la sublista correspondiente entre Inicio y Fin.
sublista(Lista, Inicio, Fin, Sublista) :-
    sublista(Lista, Inicio, Fin, 1, [], Sublista).
sublista(_, _, Fin, IndiceActual, Acumulador, Acumulador) :-
    IndiceActual > Fin, !.
sublista([Car | Cdr], Inicio, Fin, IndiceActual, Acumulador, Sublista) :-
    IndiceActual >= Inicio,
    IndiceActual =< Fin,
    NuevoIndice is IndiceActual + 1,
    append(Acumulador, [Car], NuevoAcumulador),
    sublista(Cdr, Inicio, Fin, NuevoIndice, NuevoAcumulador, Sublista).
sublista([_ | Cdr], Inicio, Fin, IndiceActual, Acumulador, Sublista) :-
    IndiceActual < Inicio,
    NuevoIndice is IndiceActual + 1,
    sublista(Cdr, Inicio, Fin, NuevoIndice, Acumulador, Sublista).

% Predicado palindromaAux: Auxiliar del predicado principal, esPalindroma
palindromaAux(Lista, Inicio, Fin) :-
    Inicio =< Fin,
    sublista(Lista, Inicio, Fin, Sublista),
    lista_inversa(Sublista, SublistaInvertida),
    Sublista = SublistaInvertida.
palindromaAux(_, Inicio, Fin) :-
    Inicio > Fin, !, fail.

% Predicado esPalindroma: Predicado principal, determina si el segmento [I, F] de la lista Lista es o no palíndromo
esPalindroma(Lista, [I, F]) :-
    palindromaAux(Lista, I, F).