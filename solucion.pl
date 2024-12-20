% Aquí va el código.
%1%

persona(juan).
persona(nico).
persona(julian).
persona(vale).
persona(fer).
persona(felipe).
persona(rocio).
persona(alf).

barrio(flores).
barrio(alamgro).

viveEn(juan,almagro,casa(120)).
viveEn(nico,almagro,depa(3,2)).
viveEn(alf,almagro,depa(3,1)).
viveEn(julian,almagro,loft(2000)).
viveEn(vale,flores,depa(4,1)).
viveEn(fer,flores,casa(110)).

seQuiereMudar(rocio,casa(90)).

%2%

esCopada(casa(Metros)):-
    comparaMayor(Metros,100).

esCopada(depa(Ambientes,_)):-
    comparaMayor(Ambientes,3).

esCopada(depa(_,Banio)):-
    comparaMayor(Banio,1).

esCopada(loft(Anio)):-
    comparaMayor(Anio,2015).

comparaMayor(Num,Comp):-
    Num > Comp.

esCopadoBarrio(Barrio):-
    barrio(Barrio),
    viveEn(_,Barrio,Propiedad),
    esCopada(Propiedad).

%3%


esBarrioCaro(Barrio):-
    barrio(Barrio),
    viveEn(_,Barrio,Propiedad),
    not(esBarato(Propiedad)).

comparaMenor(Num,Comp):-
    Num < Comp.
esBarato(casa(Metros)):-
    comparaMenor(Metros,90).

esBarato(loft(Anio)):-
    comparaMenor(Anio,2005).

   

esBarato(depa(Ambiente)):-
    between(1,2,Ambiente).

%4%

%se puede usar%

sublista([],[]).
sublista([_,Cola],Sublista):- sublista(Cola,Sublista).
sublista([Cabeza|Cola],[Cabeza,Sublista]):-sublista(Cola,Sublista).

valorDeSuPropiedad(juan,150000).
valorDeSuPropiedad(nico,80000).
valorDeSuPropiedad(alf,75000).
valorDeSuPropiedad(julian,140000).
valorDeSuPropiedad(vale,95000).
valorDeSuPropiedad(fer,60000).

cuantasCasaPuedoComprar(Dinero,ListaDuenio,Lista):-
    sublista(ListaDuenio,Sublista),
    findall(Sublista, puedoComprarSublista(Dinero,Sublista), Lista).
     %no entiendo porque solo da lista vacia
            
    
    
    puedoComprarSublista(Dinero,[Cabeza|Cola]):-
        puedoComprarCasa(Dinero,Cabeza),
        valorDeSuPropiedad(Cabeza,Valor),
        cambiarDinero(Dinero,Valor),
        puedoComprarSublista(Dinero,Cola).
    puedoComprarSublista(_,[]).

        
    puedoComprarCasa(Dinero,Duenio):-
        persona(Duenio),
        valorDeSuPropiedad(Duenio,Valor),
        Dinero > Valor.
                cambiarDinero(Dinero,Valor):-
                    Dinero is Dinero - Valor.
            
            


