:- [board].
:- [moves].

:- use_module(library(lists)).
:- use_module(library(clpfd)).



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% PLAYERS CONFIG %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
deleteColor([H|T], Position, Index, NewColors):-
	Index = Position,
	Index2 is Index + 1,
	deleteColor(T, Position, Index2, NewColors).
deleteColor([H|T], Position, Index, NewColors):-
	append(NewColors, H, NewColors2),
	Index2 is Index + 1,
	deleteColor(T, Position, Index2, NewColors2).
	

randomColor(Colors, Color, NewColors):-
	length(Colors, Length),
	random(0, Length, Index),
	nth0(Index, Colors, Color),
	deleteColor(Colors, Index, 0, NewColors).


playersConfig(NoP, Index, Colors, Players):- % NoP - number of playersConfig
	Index =< NoP,
	write('Player '), write(Index+1), write('nickname: '),
	read(Name),
	NewColors is [],
	randomColor(Colors, Color, NewColors),
	append(Players, [Name, Color], NewPlayers),
	Index2 is Index + 1,
	playersConfig(NoP, Index2, NewColors, NewPlayers).
playersConfig(_, _, _, _).



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% COMPUTER CONFIG %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
comConfig(_).



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  MENUS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
printBanner(_):-
	write('======================================'), nl,
	write('==             MEERKATS             =='), nl,
	write('======================================'), nl,nl,nl.

gameModeMenu(_):-
	nl, nl, nl,
	write('1- Single Player'), nl,
	write('-- Multiplayer --'), nl,
	write('2- 2 Players'), nl,
	write('3- 3 Players'), nl,
	write('4- 4 Players'), nl,
	write('Choice: ').

gameMode(Choice, Colors):-
	Choice = 1,
	playersConfig(Choice, 0, [], Colors, Players),
	comConfig(_),
	launchGame(_).
gameMode(Choice, Colors):-
	playersConfig(Choice, 0, [], Colors, Players),
	launchGame(_).

menuStart(BoardState, Pieces, Colors, Players):-
	printBanner(_),
	gameModeMenu(_),
	readChar(Choice),
	Choice > 0, !,
	Choice < 5,
	gameMode(Choice, Colors, Players).
menuStart(BoardState, Pieces, Colors, Players):-
	menuStart(BoardState, Pieces, Colors, Players).





%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  GAMEPLAY %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
initializeStateOfGame(BoardState, Pieces, Colors, Players):-
	emptyBoard(BoardState),
	colorsList(Colors),
	initializePlayers(Players, PlayerActive),
	initializePieces(Pieces).


launchGame(_).


start(BoardState, Pieces, Colors, Players):-
    initializeStateOfGame(BoardState, Pieces, Colors, Players),
    %menuStart(BoardState, Pieces, Colors, Players).
    printBoard(BoardState).