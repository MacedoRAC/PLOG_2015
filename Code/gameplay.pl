
:- [utils].
:- [board].
:- [moves].

:- use_module(library(lists)).
:- use_module(library(clpfd)).
:- use_module(library(random)).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% PLAYERS CONFIG %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
deleteColor([H|T], Position, Index, NewColors):-
	Index = Position,
	Index2 is Index + 1,
	deleteColor(T, Position, Index2, NewColors).
deleteColor([H|T], Position, Index, NewColors):-
	append(NewColors, [H], NewColors2),
	Index2 is Index + 1,
	deleteColor(T, Position, Index2, NewColors2).
deleteColor([], Position, Index, NewColors).

randomColor(Colors, Color, NewColors):-
	length(Colors, Length),
	random(0, Length, Index),
	nth0(Index, Colors, Color),
	deleteColor(Colors, Index, 0, NewColors).

playersConfig(NoP, Index, Colors, Players):- % NoP - number of playersConfig
	Index < NoP,
	PlayerNumb is Index + 1,
	write('Player '), write(PlayerNumb), write(' nickname: '),
	read(Name),
	createEmptyList(NewColors),
	randomColor(Colors, Color, NewColors),
	append(Players, [[Name, Color]], NewPlayers),
	Index2 is Index + 1,
	playersConfig(NoP, Index2, NewColors, NewPlayers).
playersConfig(NoP, Index, Colors, Players).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% COMPUTER CONFIG %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
comConfig(Players, NewPlayers):-
	createEmptyList(NewColors),
	randomColor(Colors, Color, NewColors),
	append(Players, ['Computer', Color], NewPlayers).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  MENUS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
printBanner(Choice):-
	nl,
	write('======================================'), nl,
	write('==             MEERKATS             =='), nl,
	write('======================================'), nl,nl,nl.

gameModeMenu(Choice):-
	nl, nl,
	write('1- Single Player'), nl,
	write('-- Multiplayer --'), nl,
	write('2- 2 Players'), nl,
	write('3- 3 Players'), nl,
	write('4- 4 Players'), nl,
	write('Choice: ').

gameMode(BoardState, Choice, Colors, Players, PlayerActive, Pieces):-
	Choice = 1,
	playersConfig(Choice, 0, Colors, Players),
	comConfig(Players, NewPlayers),
	playing(BoardState, Colors, Players, PlayerActive, Pieces).
gameMode(BoardState, Choice, Colors, PLayers, PlayerActive, Pieces):-
	playersConfig(Choice, 0, Colors, Players),
	playing(BoardState, Colors, Players, PlayerActive, Pieces).

menuStart(BoardState, Pieces, Colors, Players, PlayerActive, Pieces):-
	printBanner(Choice),
	gameModeMenu(Choice),
	read(Choice),
	skip_line,
	write('OK'),nl,
	Choice > 0,
	Choice < 5,
	gameMode(BoardState, Choice, Colors, Players, PlayerActive, Pieces).
menuStart(BoardState, Pieces, Colors, Players, PlayerActive, Pieces):-
	menuStart(BoardState, Pieces, Colors, Players, PlayerActive, Pieces).


printActualPlayer(Players, PlayerActive):-
	getPlayerName(Players, 0, PlayerActive, Name),
	nl, write(Name), write(' is your turn!'), nl, nl.


addPieceMenu(BoardState, Color, Row, Column, Pieces):-
	nl, write('ADD A PIECE TO BOARD'), nl,
	write('Color (R, G, B or Y): '),
	read(Color),
	checkColorAvailability(Pieces, Color),
	write('Row: '),
	read(Row),
	write('Column: '),
	read(Column),
	tryToAddPieceToBoard(BoardState, Color, Row, Column),
	updateColorQuantity(Pieces, Color).
addPieceMenu(BoardState, Color, Row, Column, Pieces):-
	addPieceMenu(BoardState, Color, Row, Column, Pieces).


movePieceMenu(BoardState, RowSource, ColumnSource, NumbOfSpaces, Orientation):-
	nl, write('MOVE A PIECE'), nl,
	write('Choose source piece:'),
	write('Row: '),
	read(RowSource),
	write('Column: '),
	read(ColumnSource),
	write('Choose Orientation:'), nl,
	write('1- Top Left'), nl,
	write('2- Top Right'), nl,
	write('3- Right'), nl,
	write('4- Bottom Right'), nl,
	write('5- Bottom Left'), nl,
	write('6- Left'), nl,
	write('Choice: '),
	read(Orientation),
	write('Choose number of spaces to move: '),
	read(NumbOfSpaces),
	tryToMovePiece(BoardState, RowSource, ColumnSource, NumbOfSpaces, Orientation).
movePieceMenu(BoardState, RowSource, ColumnSource, NumbOfSpaces, Orientation):-
	movePieceMenu(BoardState, RowSource, ColumnSource, NumbOfSpaces, Orientation).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  GAMEPLAY %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
nextPlayer(BoardState, Colors, PLayers, PlayerActive):-
	PlayerActive2 is PlayerActive + 1,
	length(Players, Length),
	PlayerActive2 = Length,
	PlayerActive is 0,
	playing(BoardState, Colors, Players, PlayerActive).
nextPlayer(BoardState, Colors, PLayers, PlayerActive):-
	PlayerActive is PlayerActive + 1,
	playing(BoardState, Colors, Players, PlayerActive).


initializeStateOfGame(BoardState, Pieces, Colors, Players):-
	emptyBoard(BoardState),
	colorsList(Colors),
	initializePlayers(Players, PlayerActive),
	initializePieces(Pieces).


playing(BoardState, Colors, Players, PlayerActive, Pieces):-
	printActualPlayer(Players, PlayerActive),
	printBoard(BoardState),
	addPieceMenu(BoardState, Color, Row, Column),
	printBoard(BoardState),
	movePieceMenu(BoardState, RowSource, ColumnSource, NumbOfSpaces, Orientation),
	printBoard(BoardState),
	nextPlayer(BoardState, Colors, Players, PlayerActive).


start(BoardState, Pieces, Colors, Players):-
    initializeStateOfGame(BoardState, Pieces, Colors, Players),
    menuStart(BoardState, Pieces, Colors, Players, PlayerActive, Pieces),
    printBoard(BoardState).