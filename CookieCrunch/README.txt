Tutorial can be found here: https://www.raywenderlich.com/125311/make-game-like-candy-crush-spritekit-swift-part-1

Things to do now:
Special cookies when the player matches a certain shape. For example, Candy Crush Saga gives you a cookie that can clear an entire row when you match a 4-in-a-row chain.
Detection of special chains, such as L- or T-shapes, that reward the player with bonus points or special power-ups.
Boosts, or power-ups the player can use any time they want. For example, one boost might remove all the cookies of one type from the screen at once.
Jelly levels: On these levels, some tiles are covered in jelly. You have X moves to remove all the jelly. This is where the Tile class comes in handy. You can give it a Bool jelly property and if the player matches a cookie on this tile, set the jelly property to false to remove the jelly.
Hints: If the player doesn’t make a move for two seconds, light up a pair of cookies that make a valid swap.
Shuffle the cookies automatically if there are no possible moves.
