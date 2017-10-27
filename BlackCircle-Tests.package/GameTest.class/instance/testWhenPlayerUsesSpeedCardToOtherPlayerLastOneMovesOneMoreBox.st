tests
testWhenPlayerUsesSpeedCardToOtherPlayerLastOneMovesOneMoreBox
	| playerGuada board game playerFacu speedCard |
	playerGuada := self playerGuada.
	playerFacu := self playerFacu.
	board := Board with: 20 boxesGeneratingEffectsFrom: (FixedEffectSequence generating: {NoEffect new}).
	speedCard := SpeedCard new.
	game := Game
		withBoard: board
		requiredLapsToWin: 3
		involving:
			{playerGuada.
			playerFacu}
		generatingCardsFrom: (FixedCardSequence generating: {speedCard})
		withDices: {(Dice with: 6 facesGeneratingNumbersFrom: (FixedNumberSequence generating: #(4 2)))}.
	game player: playerGuada appliesCard: speedCard to: playerGuada.
	game playTurn: playerGuada.
	self assert: (board positionOf: playerGuada) currentBox equals: 5.
	self assert: (board positionOf: playerGuada) currentLap equals: 0.
	game playTurn: playerFacu.
	self assert: (board positionOf: playerFacu) currentBox equals: 2.
	self assert: (board positionOf: playerFacu) currentLap equals: 0.
	game player: playerGuada appliesCard: speedCard to: playerFacu.
	game playTurn: playerGuada.
	self assert: (board positionOf: playerGuada) currentBox equals: 10.
	self assert: (board positionOf: playerGuada) currentLap equals: 0.
	game player: playerFacu appliesCard: speedCard to: playerFacu.
	game playTurn: playerFacu.
	self assert: (board positionOf: playerFacu) currentBox equals: 6.
	self assert: (board positionOf: playerFacu) currentLap equals: 0