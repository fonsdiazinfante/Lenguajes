/* Alfonso Díaz-Infante
 * A01350809
 * My Reference for this problem is       https://www.cs.unm.edu/~luger/ai-final/code/PROLOG.depth.html
 *-------------QuickSort-----------------*/


 /*quick_sort creates 2 lists and sorts them using a pivot, this is then done recursively until it hits the base case so when the lists
 start getting together again, the final list is sorted*/
 quick_sort([],[]). %Base case
 quick_sort([H|T],Sorted):-
     pivoting(H,T,L1,L2),quick_sort(L1,Sorted1),quick_sort(L2,Sorted2),
     append(Sorted1,[H|Sorted2],Sorted).

 /*Pivoting pretty much decides to what list each value is going based on the pivot, if it is less or equal it goes to the L list, else it goes to the G list*/
 pivoting(_,[],[],[]).
 pivoting(H,[X|T],[X|L],G):-X=<H,pivoting(H,T,L,G).
 pivoting(H,[X|T],L,[X|G]):-X>H,pivoting(H,T,L,G).

/*-------------Test_Cases-----------------
*?- quick_sort([1, 6, 2, 7], X).
*?- quick_sort([1, 6, 2, 7], X).
*?- quick_sort([13, 46, 25, 12, 27, 1],  X).
*/


