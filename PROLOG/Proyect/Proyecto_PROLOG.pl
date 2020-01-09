/*
 *  F1 drivers guessing game. Think of a driver from the current 2019 season and
 *  Copyright (C) 2019 Alfonso Diaz Infante
 *
 *  This program is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program.  If not, see <https://www.gnu.org/licenses/>.
 *
 * Alfonso Diaz-Infante
 * A01350809
 * start the game with ?- start. statement
*/

start :- % This is where the game starts, these are a set of rules that must be completed
      write('Think of an F1 driver from the current 2019 season.'),
      nl, % New line
      write('Please answer yes or no to the following questions so that I can tell you what racing driver you are thinking of:'),
      nl, nl,
      guess(Driver), %Driver is the variable that will be replaced
      write('The driver is '),
      write(Driver),
      nl.

%guess will replace Driver with a name if the rules are met.
guess(sebastian_vettel)    :- vettel .
guess(lewis_hamilton)     :- lewis .
guess(valtteri_bottas)  :- valtteri .
guess(george_russell)   :- russell .
guess(kimi_raikkonnen):- raikkonnen .
guess(sergio_perez)     :- perez .
guess(pierre_gasly)     :- gasly .
guess(romain_grosjean)  :- grosjean .
guess(lando_norris)    :- norris .
guess(charles_leclerc)   :- leclerc .
guess(robert_kubica)    :- kubica .
guess(max_verstappen):- verstappen .
guess(alex_albon)     :- albon .
guess(daniil_kvyat)     :- kvyat .
guess(kevin_magnussen) :- magnussen .
guess(nico_hulkenberg):- hulkenberg .
guess(daniel_ricciardo) :- ricciardo .
guess(carlos_sainz_jr)     :- sainz .
guess(lance_stroll)    :- stroll .
guess(antonio_giovanazzi):- giovanazzi .

guess(not_currently_in_the_racing_grid).

/* Driver identification rules */
vettel :- multiple, % Driver can be vettel if he is a multiple world champion and he is German
    	  german,
        write('Did you know: This driver holds the record for the youngest Pole Position.'),
        nl.

leclerc :-winner, % Driver can be vettel if he is a race winner,young, more than one season and he is monegasque
    	  young,
    	  veteran,
    	  not(champ),
    	  monegasque,
        write('Did you know: This driver holds the record for the second youngest Ferrarri driver, mexican driver Ricardo Rodriguez still holds that record ;).'),
        nl.

lewis :- multiple,
   		 british,
       write('Did you know: This driver is the second driver with the most championships ever, behind only Michael Schumacher.'),
       nl.

raikkonnen :- champ,
    		  veteran,
   			  old,
    		  finnish,
          write('Did you know: This driver is the oldest on the grid, he is 40 years old!.'),
          nl.

valtteri :-winner,
   		   not(champ),
    	   old,
    	   finnish,
    	   veteran,
         write('Did you know: This driver holds the record for the unofficial Formula One record speed of 378 km/h.'),
         nl.

norris :- not(podium),
    	  rookie,
          british,
		  verify(mcLaren_driver),
      write('Did you know: This driver is the youngest driver on the grid? only 20 years old'),
      nl.

russell :-not(podium),
          rookie,
          british,
    	  verify(a_williams_driver).

perez:- podium,
        veteran,
   		not(winner),
        not(european),
    	old,
    	verify(mexican),
      write('Did you know: This driver holds the record for the mexican with most Podiums.'),
      nl.

gasly:- podium,
   		not(winner),
    	young,
    	veteran,
    	french,
      write('Did you know: This driver started racing for Red Bull at the begginning of the season but got demoted to Toro Rosso.'),
      nl.

kvyat:- podium,
   		not(winner),
    	young,
      veteran,
    	russian,
      write('Did you know: This driver was fired from the Red Bull team two years ago, but his talent brought him back!.'),
      nl.

magnussen:-podium,
   		   not(winner),
    	   old,
    	   veteran,
    	   danish,
         write('Did you know: This driver stood on the podium on his first race.'),
         nl.

grosjean:-podium,
   		  not(winner),
          veteran,
          french,
    	  old,
        write('Did you know: This driver starred in David Guettas music video for the song: "Dangerous".'),
        nl.

verstappen:- winner,
    		 not(champ),
    	     young,
    		 dutch,
    	     veteran,
           write('Did you know: This driver started racing in F1 when he was 17 years old!.'),
           nl.

kubica:- winner,
    	 old,
   		 not(champ),
    	 polish,
       write('Did you know: This driver was going to race for Ferrari before he had a life threatening accident.'),
       nl,
       write('After 9 years of rehabilitation and dedication, he returned to F1.'),
       nl.

albon:- rookie,
     		not(podium),
      	not(european),
      	verify(thai),
        write('Did you know: This driver is the first Thai driver since the prince of Thailand last raced in 1954!.'),
        nl.

hulkenberg:- veteran,
             old,
             not(podium),
             german,
             write('Did you know: This driver has a pole position but has never been on the podium.'),
             nl.

ricciardo:-winner,
           old,
           not(champ),
           not(european),
           verify(australian).

sainz:- podium,
      	young,
   		  not(winner),
        veteran,
        spanish,
        write('Did you know: This driver is the son of two time rally world champion driver Carlos Sainz.'),
        nl.

giovanazzi:-not(podium),
            rookie,
            italian.

stroll:- podium,
   		   not(winner),
    	   veteran,
         young,
         not(european),
    	   verify(canadian),
         write('Did you know: This drivers dad is also the team owner.'),
         nl.


/* Rules */
podium   :- verify(a_podium_winner) . % A driver can be a podium winner
winner   :- podium, verify(a_race_winner) . % A driver cannot be a race winner if he is not a podium winner
champ    :- winner,verify(a_world_champion) . % A driver cannot be a world champion if he is not a race winner
multiple :- champ, verify(a_multiple_world_champion) . % A driver cannot be a multiple wolrd champion if he has never been a world champion

young   :- not(champ),verify(younger_than_26) .
rookie  :- young,verify(in_his_first_season) .

old     :- not(young) .
veteran :- not(rookie) .

european :- verify(european) .
french   :- european, verify(french) .
german   :- european, verify(german) .
finnish  :- european, verify(finnish) .
british  :- european, verify(british) .
polish   :- european, verify(polish) .
russian  :- european, verify(russian) .
danish   :- european, verify(danish) .
monegasque:- european,verify(monegasque) .
spanish  :- european, verify(spanish) .
italian  :- european, verify(italian) .
dutch    :- european, verify(dutch) .

/* How to verify if the answer introduced by the user is true something */
verify(Q) :- %S is a variable that will initially be what we want to check, ex. french, we will pass it down to the ask function to ask the user and make him change the state to true or false
   (yes(Q) -> true ;
    (no(Q) -> fail ;
     ask(Q))).

ask(Question) :-
    write('Is the driver '), %This will be printed on screen
    write(Question),
    write('?'),
    read(Response), %reads user input
    nl, %new line
    ( (Response == yes ; Response == y ; Response == ye) -> assert(yes(Question)) ; %If user types y, ye or yes then verify will be yes and that will mean that the statement will be introduced to the database as true
      assert(no(Question)), fail). %anything not yes, ye or y will be a no

:- dynamic yes/1,no/1. %Informs the interpreter that the definition of the predicates may change during execution


undo :- retractall(yes(_)),fail. %retractall makes all facts or clauses in the database for which the head unifies with Head are removed.
undo :- retractall(no(_)),fail. %fail makes the predicate to always fail and continue on to the next one.
undo.
