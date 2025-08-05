%%%%% Insira aqui os seus predicados.
%%%%% Use quantos predicados auxiliares julgar necess�rio

% Dica: inicie modificando os programas vistos em sala
%sentenca(...) --> ...
sentenca( _ ) --> [_|_].  % isso reconhece tudo! Mudar!!!



%%%%%%%% Fim dos predicados adicionados
%%%%%%%% Os testes come�am aqui.
%%%%%%%% Para executar os testes, use a consulta:   ?- run_tests.

%%%%%%%% Mais informacoes sobre testes podem ser encontradas em:
%%%%%%%%    https://www.swi-prolog.org/pldoc/package/plunit.html

%%%%%%%%% Help %%%%%%%%%
gramatical( S ) :-
    sentenca( A, S, [] ),
    imprime_arvore(A),
    !.  % evita warnings do tipo: Test succeeded with choicepoint

imprime_arvore( A ) :-
	imprime_arvore( A, 0 ).

imprime_arvore( A, N ) :-
    var( A ),
    tab( N ),
	write( A ),
	nl.
imprime_arvore( A, N ) :-
	A =.. [ X | As ],
	tab( N ),
	write( X ),
	nl,
	N1 is N+2,
	imprime_lista( As, N1 ).

imprime_lista( [], _ ).
imprime_lista( [ A | As ], N ) :-
	imprime_arvore( A, N ),
	imprime_lista( As, N ).



%%%%%%%%  Tests %%%%%%%%%%

:- begin_tests(sentencas).
test(gramatica1, true ) :-
    gramatical([as, mina, encaro, os, cara]).
test(gramatica2, true ) :-
    gramatical([o,cara,encaro,as,mina]).
test(gramatica2, true ) :-
    gramatical([o,cara,encaro,a,mina]).

test(rejeita1, fail ) :-
    gramatical([os,caras, encararam, as, minas]).
test(rejeita2, fail ) :-
    gramatical([os,mina, encaro, os, cara]).
test(rejeita3, fail ) :-
    gramatical([a,mina,encaro,as, cara]).

:- end_tests(sentencas).
