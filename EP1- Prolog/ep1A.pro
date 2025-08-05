%%%%% Insira aqui os seus predicados.
%%%%% Use quantos predicados auxiliares julgar necess�rio

% Exercício 1:

lista_para_conjunto(Lista, Conjunto) :-
    lista_para_conjunto_aux(Lista, [], Conjunto).

lista_para_conjunto_aux([], _, []).
lista_para_conjunto_aux([X|Xs], Vistos, [X|Ys]) :-
    \+ member(X, Vistos),
    lista_para_conjunto_aux(Xs, [X|Vistos], Ys).
lista_para_conjunto_aux([X|Xs], Vistos, Ys) :-
    member(X, Vistos),
    lista_para_conjunto_aux(Xs, Vistos, Ys).

% Exercício 2:

mesmo_conjunto([], []).
mesmo_conjunto(L1, [H|T]) :-
    retira_elemento(H, L1, Resto), 
    mesmo_conjunto(Resto, T).

retira_elemento(X, [A|B], Resto) :-
    retira_elemento_4(B, A, X, Resto).

retira_elemento_4(B, A, A, B).
retira_elemento_4([A2|B], A, X, [A|Resto]) :-
retira_elemento_4(B, A2, X, Resto).

% Exercício 3:

uniao_conjunto([], L, L).
uniao_conjunto([H|T], L, R) :-
    member(H, L),
    uniao_conjunto(T, L, R).
uniao_conjunto([H|T], L, [H|R]) :-
    \+ member(H, L),
    uniao_conjunto(T, L, R).

% Exercício 4:

inter_conjunto([], L, []). 
inter_conjunto([H|T], L, R) :-
    \+ member(H, L), 
    inter_conjunto(T, L, R). 
inter_conjunto([H|T], L, [H|R]) :-
    member(H, L),
    inter_conjunto(T, L, R). 

% Exercício 5:

diferenca_conjunto([], _, []).
diferenca_conjunto([X|Xs], Ys, Zs) :-
    member(X,Ys),
    diferenca_conjunto(Xs, Ys, Zs).
diferenca_conjunto([X|Xs], Ys, [X|Zs]) :-
    not( member(X,Ys)),
    diferenca_conjunto(Xs, Ys, Zs).


%%%%%%%% Fim dos predicados adicionados
%%%%%%%% Os testes come�am aqui.
%%%%%%%% Para executar os testes, use a consulta:   ?- run_tests.

%%%%%%%% Mais informacoes sobre testes podem ser encontradas em:
%%%%%%%%    https://www.swi-prolog.org/pldoc/package/plunit.html



:- begin_tests(conjuntos).

test(lista_para_conjunto, all(Xs=[[1,a,3,4]]) ) :-
     lista_para_conjunto([1,a,3,3,a,1,4], Xs).
test(lista_para_conjunto2,fail) :-
    lista_para_conjunto([1,a,3,3,a,1,4], [a,1,3,4]).

test(mesmo_conjunto, set(Xs=[[1,a,3],[1,3,a],[a,1,3],[a,3,1],[3,a,1],[3,1,a]])) :-
    mesmo_conjunto([1,a,3], Xs).
test(uniao_conjunto2,fail) :-
    mesmo_conjunto([1,a,3,4], [1,3,4]).

test(uniao_conjunto, set(Ys==[[1,a,3],[1,3,a],[a,1,3],[a,3,1],[3,a,1],[3,1,a]])) :-
    uniao_conjunto([1,a], [a,3], Xs),
    mesmo_conjunto(Xs,Ys).
test(uniao_conjunto2,fail) :-
    uniao_conjunto([1,a,3,4], [1,2,3,4], [1,1,a,2,3,3,4,4]).

test(inter_conjunto, all(Xs==[[1,3,4]])) :-
    inter_conjunto([1,a,3,4], [1,2,3,4], Xs).
test(inter_conjunto2,fail) :-
    inter_conjunto([1,a,3,4], [1,2,3,4], [1,1,3,3,4,4]).

test(diferenca_conjunto, all(Xs==[[2]])) :-
    diferenca_conjunto([1,2,3], [3,a,1], Xs).
 test(diferenca_conjunto2,fail) :-
     diferenca_conjunto([1,3,4], [1,2,3,4], [_|_]).

:- end_tests(conjuntos).
