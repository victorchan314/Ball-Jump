--the screen is display.contentWidth = 480 x dislay.contentHeight = 320
--[[
A little bit about this game:
coding and music all by Victor Chan
gravity is set to 35200/243 m/s^2
the jump is set to a starting velocity of 8800/9 px/s
this ensures that the jump length is about .45 seconds or 450 milliseconds long
the gvvconstant and the display.contentHeight are used together to ensure that no matter what device is used to play this game, the gravity is optimal for playing (because the dimensions of the device affect the physics of the game)
]]--

local physics = require("physics")
physics.start( true )
gvvconstant = display.contentWidth / display.contentHeight * 2000
physics.setGravity( display.contentWidth * display.contentWidth, display.contentHeight * gvvconstant * 11 / 72900 )
setgravity = display.contentHeight * gvvconstant * 11 / 72900

print( physics.getGravity() )

levelinertiamusic = audio.loadSound("Game Song Level 1.mp3")
levelgravitymusic = audio.loadSound("Game Song Level 2.mp3")

regular = true
gravity = false


main = display.newGroup()

start = display.newRoundedRect( main, 0, 0, display.contentWidth / 3 * 2, display.contentHeight / 64 * 15, display.contentHeight / 64 )
start.xReference = 0
start.yReference = 0
start.x = display.contentWidth / 2
start.y = display.contentHeight / 32 * 7
start:setFillColor( 1, 1, 1 )

starttext = display.newText( main, "START", 0, 0, "Comic Sans Ms", display.contentHeight / 4 )
starttext.xReference = 0
starttext.yReference = 0
starttext.x = display.contentWidth / 2
starttext.y = display.contentHeight / 64 * 11
starttext:setFillColor( 0, 0, 0 )

instructionsbutton = display.newRoundedRect( main, 0, 0, display.contentWidth / 3 * 2, display.contentHeight / 64 * 15, display.contentHeight / 64 )
instructionsbutton.xReference = 0
instructionsbutton.yReference = 0
instructionsbutton.x = display.contentWidth / 2
instructionsbutton.y = display.contentHeight / 2
instructionsbutton:setFillColor( 1, 1, 1 )

instructionsbuttontext = display.newText( main, "How to Play", 0, 0, "Comic Sans Ms", display.contentHeight / 32 * 5 )
instructionsbuttontext.xReference = 0
instructionsbuttontext.yReference = 0
instructionsbuttontext.x = display.contentWidth / 2
instructionsbuttontext.y = display.contentHeight / 64 * 29
instructionsbuttontext:setFillColor( 0, 0, 0 )


levels = display.newGroup()
levels.isVisible = false

levelstomenu = display.newRoundedRect( levels, 0, 0, display.contentWidth / 4 * 3, display.contentHeight / 16 * 3, display.contentHeight / 64 )
levelstomenu.xReference = 0
levelstomenu.yReference = 0
levelstomenu.x = display.contentWidth / 2
levelstomenu.y = display.contentHeight / 6 * 5
levelstomenu:setFillColor( 1, 1, 1 )

levelstomenutext = display.newText( levels, "Back to Menu", 0, 0, "Comic Sans Ms", display.contentHeight / 32 * 5 )
levelstomenutext.xReference = 0
levelstomenutext.yReference = 0
levelstomenutext.x = display.contentWidth / 2
levelstomenutext.y = display.contentHeight / 5 * 4
levelstomenutext:setFillColor( 0, 0, 0 )

level1 = display.newRoundedRect( levels, 0, 0, display.contentWidth / 2, display.contentHeight / 7, display.contentHeight / 64 )
level1.xReference = 0
level1.yReference = 0
level1.x = display.contentWidth / 2
level1.y = display.contentHeight / 6
level1:setFillColor( 1, 1, 1 )

level1text = display.newText( levels, "Inertia", 0, 0, "Comic Sans Ms", display.contentHeight / 8 )
level1text.xReference = 0
level1text.yReference = 0
level1text.x = display.contentWidth / 2
level1text.y = display.contentHeight / 7
level1text:setFillColor( 0, 0, 0 )

level2 = display.newRoundedRect( levels, 0, 0, display.contentWidth / 2, display.contentHeight / 7, display.contentHeight / 64 )
level2.xReference = 0
level2.yReference = 0
level2.x = display.contentWidth / 2
level2.y = display.contentHeight / 3
level2:setFillColor( 1, 1, 1 )

level2text = display.newText( levels, "Gravity", 0, 0, "Comic Sans Ms", display.contentHeight / 8 )
level2text.xReference = 0
level2text.yReference = 0
level2text.x = display.contentWidth / 2
level2text.y = display.contentHeight / 3 - ( display.contentHeight / 42 )
level2text:setFillColor( 0, 0, 0 )


instructions = display.newGroup()
instructions.isVisible = false

instructions1 = display.newText( instructions, "Tap the pink circle to jump over", 0, 0, "Comic Sans Ms", display.contentWidth / 20 )
instructions1.xReference = 0
instructions1.yReference = 0
instructions1.x = display.contentWidth / 2
instructions1.y = display.contentHeight / 32 * 7
instructions2 = display.newText( instructions, "obstacles. Green circles are safe to", 0, 0, "Comic Sans Ms", display.contentWidth / 20 )
instructions2.xReference = 0
instructions2.yReference = 0
instructions2.x = display.contentWidth / 2
instructions2.y = display.contentHeight / 32 * 10
instructions3 = display.newText( instructions, "jump on top of. Red circles are not.", 0, 0, "Comic Sans Ms", display.contentWidth / 20 )
instructions3.xReference = 0
instructions3.yReference = 0
instructions3.x = display.contentWidth / 2
instructions3.y = display.contentHeight / 32 * 13
instructions4 = display.newText( instructions, "Colliding with a red circle or the side", 0, 0, "Comic Sans Ms", display.contentWidth / 20 )
instructions4.xReference = 0
instructions4.yReference = 0
instructions4.x = display.contentWidth / 2
instructions4.y = display.contentHeight / 32 * 16
instructions5 = display.newText( instructions, "of any obstacle will result in a loss.", 0, 0, "Comic Sans Ms", display.contentWidth / 20 )
instructions5.xReference = 0
instructions5.yReference = 0
instructions5.x = display.contentWidth / 2
instructions5.y = display.contentHeight / 32 * 19

instructionstomenu = display.newRoundedRect( instructions, 0, 0, display.contentWidth / 4 * 3, display.contentHeight / 16 * 3, display.contentHeight / 64 )
instructionstomenu.xReference = 0
instructionstomenu.yReference = 0
instructionstomenu.x = display.contentWidth / 2
instructionstomenu.y = display.contentHeight / 5 * 4
instructionstomenu:setFillColor( 1, 1, 1 )

instructionstomenutext = display.newText( instructions, "Back to Menu", 0, 0, "Comic Sans Ms", display.contentHeight / 32 * 5 )
instructionstomenutext.xReference = 0
instructionstomenutext.yReference = 0
instructionstomenutext.x = display.contentWidth / 2
instructionstomenutext.y = display.contentHeight / 4 * 3
instructionstomenutext:setFillColor( 0, 0, 0 )


game = display.newGroup()
game.isVisible = false

background = display.newRect( game, display.contentWidth / 2, display.contentHeight / 2, display.contentWidth, display.contentHeight )
background:setFillColor( 0, 0, 0 )

circlecollisionfilter = { categoryBits = 1, maskBits = 6 }
redcirclecollisionfilter = { categoryBits = 2, maskBits = 1 }
linefilter = { categoryBits = 4, maskBits = 1 }

blackline = display.newRect( game, 3 / 2 + display.contentWidth / 16 * 5 - display.contentHeight / 16 - display.contentWidth / 160 * 3, display.contentHeight / 2, 3, display.contentHeight )
blackline:setFillColor( 1, 0, 0, 0 )
physics.addBody( blackline, { density = 1.0, friction = 0, bounce = 0, filter = linefilter } )
blackline.bodyType = "static"

blacklineguard = display.newRect( game, 3 / 2 + display.contentWidth / 16 * 5 + display.contentHeight / 16, display.contentHeight + display.contentHeight * -1, 3, display.contentHeight * 2 )
blacklineguard:setFillColor( 0, 1, 0, 0 )
physics.addBody( blacklineguard, { density = 1.0, friction = 0, bounce = 0, filter = linefilter } )
blacklineguard.bodyType = "static"

redcircle = display.newCircle( game, display.contentWidth / 4 * 5, display.contentHeight / 16 * 11, display.contentHeight / 16 )
redcircle:setFillColor( 1, 0, 0 )
physics.addBody( redcircle, { density = 1.0, friction = 0, bounce = 0, radius = display.contentHeight / 16, filter = redcirclecollisionfilter } )
redcircle.bodyType = "static"

redcircledown1 = display.newCircle( game, display.contentWidth / 4 * 5 + display.contentHeight / 8, display.contentHeight / 16 * 11, display.contentHeight / 16 )
redcircledown1:setFillColor( 1, 0, 0 )
physics.addBody( redcircledown1, { density = 1.0, friction = 0, bounce = 0, radius = display.contentHeight / 16, filter = redcirclecollisionfilter } )
redcircledown1.bodyType = "static"

redcircledown2 = display.newCircle( game, display.contentWidth / 4 * 5 + display.contentHeight / 4, display.contentHeight / 16 * 11, display.contentHeight / 16 )
redcircledown2:setFillColor( 1, 0, 0 )
physics.addBody( redcircledown2, { density = 1.0, friction = 0, bounce = 0, radius = display.contentHeight / 16, filter = redcirclecollisionfilter } )
redcircledown2.bodyType = "static"

redcircledown3 = display.newCircle( game, display.contentWidth / 4 * 5 + display.contentHeight / 8 * 3, display.contentHeight / 16 * 11, display.contentHeight / 16 )
redcircledown3:setFillColor( 1, 0, 0 )
physics.addBody( redcircledown3, { density = 1.0, friction = 0, bounce = 0, radius = display.contentHeight / 16, filter = redcirclecollisionfilter } )
redcircledown3.bodyType = "static"

redcircleright1 = display.newCircle( game, display.contentWidth / 4 * 5, display.contentHeight / 16 * 9, display.contentHeight / 16 )
redcircleright1:setFillColor( 1, 0, 0 )
physics.addBody( redcircleright1, { density = 1.0, friction = 0, bounce = 0, radius = display.contentHeight / 16, filter = redcirclecollisionfilter } )
redcircleright1.bodyType = "static"

redcircleright2 = display.newCircle( game, display.contentWidth / 4 * 5, display.contentHeight / 16 * 7, display.contentHeight / 16 )
redcircleright2:setFillColor( 1, 0, 0 )
physics.addBody( redcircleright2, { density = 1.0, friction = 0, bounce = 0, radius = display.contentHeight / 16, filter = redcirclecollisionfilter } )
redcircleright2.bodyType = "static"

redcircleright3 = display.newCircle( game, display.contentWidth / 4 * 5, display.contentHeight / 16 * 5, display.contentHeight / 16 )
redcircleright3:setFillColor( 1, 0, 0 )
physics.addBody( redcircleright3, { density = 1.0, friction = 0, bounce = 0, radius = display.contentHeight / 16, filter = redcirclecollisionfilter } )
redcircleright3.bodyType = "static"

redcircleright4 = display.newCircle( game, display.contentWidth / 4 * 5, display.contentHeight / 16 * 3, display.contentHeight / 16 )
redcircleright4:setFillColor( 1, 0, 0 )
physics.addBody( redcircleright4, { density = 1.0, friction = 0, bounce = 0, radius = display.contentHeight / 16, filter = redcirclecollisionfilter } )
redcircleright4.bodyType = "static"

redcircledown1right1 = display.newCircle( game, display.contentWidth / 4 * 5 + display.contentHeight / 8, display.contentHeight / 16 * 9, display.contentHeight / 16 )
redcircledown1right1:setFillColor( 1, 0, 0 )
physics.addBody( redcircledown1right1, { density = 1.0, friction = 0, bounce = 0, radius = display.contentHeight / 16, filter = redcirclecollisionfilter } )
redcircledown1right1.bodyType = "static"

redcircledown1right2 = display.newCircle( game, display.contentWidth / 4 * 5 + display.contentHeight / 8, display.contentHeight / 16 * 7, display.contentHeight / 16 )
redcircledown1right2:setFillColor( 1, 0, 0 )
physics.addBody( redcircledown1right2, { density = 1.0, friction = 0, bounce = 0, radius = display.contentHeight / 16, filter = redcirclecollisionfilter } )
redcircledown1right2.bodyType = "static"

redcircledown1right3 = display.newCircle( game, display.contentWidth / 4 * 5 + display.contentHeight / 8, display.contentHeight / 16 * 5, display.contentHeight / 16 )
redcircledown1right3:setFillColor( 1, 0, 0 )
physics.addBody( redcircledown1right3, { density = 1.0, friction = 0, bounce = 0, radius = display.contentHeight / 16, filter = redcirclecollisionfilter } )
redcircledown1right3.bodyType = "static"

redcircledown1right4 = display.newCircle( game, display.contentWidth / 4 * 5 + display.contentHeight / 8, display.contentHeight / 16 * 3, display.contentHeight / 16 )
redcircledown1right4:setFillColor( 1, 0, 0 )
physics.addBody( redcircledown1right4, { density = 1.0, friction = 0, bounce = 0, radius = display.contentHeight / 16, filter = redcirclecollisionfilter } )
redcircledown1right4.bodyType = "static"

greencircle = display.newCircle( game, display.contentWidth / 4 * 5, display.contentHeight / 16 * 11, display.contentHeight / 16 )
greencircle:setFillColor( 0, 1, 0 )
physics.addBody( greencircle, { density = 1.0, friction = 0, bounce = 0, radius = display.contentHeight / 16, filter = redcirclecollisionfilter } )
greencircle.bodyType = "static"

greencircledown1 = display.newCircle( game, display.contentWidth / 4 * 5 + display.contentHeight / 8, display.contentHeight / 16 * 11, display.contentHeight / 16 )
greencircledown1:setFillColor( 0, 1, 0 )
physics.addBody( greencircledown1, { density = 1.0, friction = 0, bounce = 0, radius = display.contentHeight / 16, filter = redcirclecollisionfilter } )
greencircledown1.bodyType = "static"

greencircleright1 = display.newCircle( game, display.contentWidth / 4 * 5, display.contentHeight / 16 * 9, display.contentHeight / 16 )
greencircleright1:setFillColor( 0, 1, 0 )
physics.addBody( greencircleright1, { density = 1.0, friction = 0, bounce = 0, radius = display.contentHeight / 16, filter = redcirclecollisionfilter } )
greencircleright1.bodyType = "static"

greencircleright2 = display.newCircle( game, display.contentWidth / 4 * 5, display.contentHeight / 16 * 7, display.contentHeight / 16 )
greencircleright2:setFillColor( 0, 1, 0 )
physics.addBody( greencircleright2, { density = 1.0, friction = 0, bounce = 0, radius = display.contentHeight / 16, filter = redcirclecollisionfilter } )
greencircleright2.bodyType = "static"

greencircleright3 = display.newCircle( game, display.contentWidth / 4 * 5, display.contentHeight / 16 * 5, display.contentHeight / 16 )
greencircleright3:setFillColor( 0, 1, 0 )
physics.addBody( greencircleright3, { density = 1.0, friction = 0, bounce = 0, radius = display.contentHeight / 16, filter = redcirclecollisionfilter } )
greencircleright3.bodyType = "static"

greencircleright4 = display.newCircle( game, display.contentWidth / 4 * 5, display.contentHeight / 16 * 3, display.contentHeight / 16 )
greencircleright4:setFillColor( 0, 1, 0 )
physics.addBody( greencircleright4, { density = 1.0, friction = 0, bounce = 0, radius = display.contentHeight / 16, filter = redcirclecollisionfilter } )
greencircleright4.bodyType = "static"

circle = display.newCircle( game, display.contentWidth / 16 * 5, display.contentHeight / 16 * 11, display.contentHeight / 16 )
circle:setFillColor( 1, 1, 0 )
physics.addBody( circle, { density = 1.0, friction = 0, bounce = 0, radius = display.contentHeight / 16, filter = circlecollisionfilter } )
circle.bodyType = "dynamic"

line = display.newRect( game, display.contentWidth / 2, display.contentHeight / 4 * 3 - 1 + 3 / 2, display.contentWidth, 3 )
line:setFillColor( 1, 1, 1 )
physics.addBody( line, { density = 1.0, friction = 0, bounce = 0, filter = linefilter } )
line.bodyType = "static"

line2 = display.newRect( game, display.contentWidth / 2, display.contentHeight / 4 * 3 - 1 + 3 / 2, display.contentWidth, 3 )
line2:setFillColor( 1, 1, 1 )
physics.addBody( line2, { density = 1.0, friction = 0, bounce = 0, filter = linefilter } )
line2.bodyType = "static"
line2.isVisible = false

gravityinstructions = display.newText( game, "Tap the circle to switch gravity", 0, 0, "Comic Sans Ms", display.contentWidth / 20 )
gravityinstructions.alpha = 1
gravityinstructions.xReference = 0
gravityinstructions.yReference = 0
gravityinstructions.x = display.contentWidth / 2
gravityinstructions.y = display.contentHeight / 32 * 7
gravityinstructions.isVisible = false

jumper = display.newCircle( game, display.contentWidth / 12 * 11, display.contentHeight / 8 * 7, display.contentHeight / 32 * 3 )
jumper:setFillColor( 1, 0, 1 )

--whitelinelength_level
--length corresponds to display.contentWidth, which = 1
--blackline level is 0, then goes up to 1 like a ruler/number line
--fractions always words, never with symbols / or .

whiteline1_1 = display.newRect( game, display.contentWidth / 2 + display.contentWidth / 4 * 5, 3 / 2 + display.contentHeight / 8 * 5 - 1, display.contentWidth, 3 )
whiteline1_1:setFillColor( 1, 1, 1 )
whiteline1_1.xReference = -1 * display.contentWidth / 2
whiteline1_1.yReference = -1 * 3 / 2
physics.addBody( whiteline1_1, { density = 1.0, friction = 0, bounce = 0, filter = linefilter } )
whiteline1_1.bodyType = "static"

whitelinehalf_1 = display.newRect( game, display.contentWidth / 4 + display.contentWidth / 4 * 5, 3 / 2 + display.contentHeight / 8 * 5 - 1, display.contentWidth / 2, 3 )
whitelinehalf_1:setFillColor( 1, 1, 1 )
whitelinehalf_1.xReference = -1 * display.contentWidth / 4
whitelinehalf_1.yReference = -1 * 3 / 2
physics.addBody( whitelinehalf_1, { density = 1.0, friction = 0, bounce = 0, filter = linefilter } )
whitelinehalf_1.bodyType = "static"

whiteline1_2 = display.newRect( game, display.contentWidth / 2 + display.contentWidth / 4 * 5, 3 / 2 + display.contentHeight / 8 * 4 - 1, display.contentWidth, 3 )
whiteline1_2:setFillColor( 1, 1, 1 )
whiteline1_2.xReference = -1 * display.contentWidth / 2
whiteline1_2.yReference = -1 * 3 / 2
physics.addBody( whiteline1_2, { density = 1.0, friction = 0, bounce = 0, filter = linefilter } )
whiteline1_2.bodyType = "static"

whiteline1_3 = display.newRect( game, display.contentWidth / 2 + display.contentWidth / 4 * 5, 3 / 2 + display.contentHeight / 8 * 3 - 1, display.contentWidth, 3 )
whiteline1_3:setFillColor( 1, 1, 1 )
whiteline1_3.xReference = -1 * display.contentWidth / 2
whiteline1_3.yReference = -1 * 3 / 2
physics.addBody( whiteline1_3, { density = 1.0, friction = 0, bounce = 0, filter = linefilter } )
whiteline1_3.bodyType = "static"

whiteline1_4 = display.newRect( game, display.contentWidth / 2 + display.contentWidth / 4 * 5, 3 / 2 + display.contentHeight / 8 * 2 - 1, display.contentWidth, 3 )
whiteline1_4:setFillColor( 1, 1, 1 )
whiteline1_4.xReference = -1 * display.contentWidth / 2
whiteline1_4.yReference = -1 * 3 / 2
physics.addBody( whiteline1_4, { density = 1.0, friction = 0, bounce = 0, filter = linefilter } )
whiteline1_4.bodyType = "static"


lost = display.newGroup()
lost.isVisible = false

losttext = display.newText( lost, "Sorry, You Lost", 0, 0, "Comic Sans Ms", display.contentHeight / 32 * 5 )
losttext.xReference = 0
losttext.yReference = 0
losttext.x = display.contentWidth / 2
losttext.y = display.contentHeight / 5
losttext:setFillColor( 1, 1, 1 )

startoverbutton = display.newRoundedRect( lost, 0, 0, display.contentWidth / 3 * 2,display.contentHeight / 64 * 15,  display.contentHeight / 64 )
startoverbutton.xReference = 0
startoverbutton.yReference = 0
startoverbutton.x = display.contentWidth / 2
startoverbutton.y = display.contentHeight / 2
startoverbutton:setFillColor( 1, 1, 1 )

startoverbuttontext = display.newText( lost, "Start Over", 0, 0, "Comic Sans Ms", display.contentHeight / 32 * 5 )
startoverbuttontext.xReference = 0
startoverbuttontext.yReference = 0
startoverbuttontext.x = display.contentWidth / 2
startoverbuttontext.y = display.contentHeight / 64 * 29
startoverbuttontext:setFillColor( 0, 0, 0 )


function start:tap( event )
	levels.isVisible = true
	main.isVisible = false
	game.isVisible = false
	lost.isVisible = false
end
start:addEventListener( "tap", start )


function levelstomenu:tap( event )
	levels.isVisible = false
	main.isVisible = true
	game.isVisible = false
	lost.isVisible = false
end
levelstomenu:addEventListener( "tap", levelstomenu )




function level1:tap( event )
	collision = false
	levels.isVisible = false
	game.isVisible = true
	main.isVisible = false
	lost.isVisible = false
	audio.play(levelinertiamusic)
	physics.setGravity( display.contentWidth * display.contentWidth, display.contentHeight * gvvconstant * 11 / 72900 )
	timer.performWithDelay( 0, regularswitch )
	timer.performWithDelay( 0, circlereset )
	timer.performWithDelay( 0, redcirclereset )
	timer.performWithDelay( 0, redcircledown1reset )
	timer.performWithDelay( 0, redcircledown2reset )
	timer.performWithDelay( 0, redcircledown3reset )
	timer.performWithDelay( 0, redcircleright1reset )
	timer.performWithDelay( 0, redcircleright2reset )
	timer.performWithDelay( 0, redcircleright3reset )
	timer.performWithDelay( 0, redcircleright4reset )
	timer.performWithDelay( 0, redcircledown1right1reset )
	timer.performWithDelay( 0, redcircledown1right2reset )
	timer.performWithDelay( 0, redcircledown1right3reset )
	timer.performWithDelay( 0, greencirclereset )
	timer.performWithDelay( 0, greencircledown1reset )
	timer.performWithDelay( 0, greencircleright1reset )
	timer.performWithDelay( 0, greencircleright2reset )
	timer.performWithDelay( 0, whiteline1_1reset )
	timer.performWithDelay( 0, whitelinehalf_1reset )
	timer.performWithDelay( 0, whiteline1_2reset )
	timer.performWithDelay( 0, whiteline1_3reset )
rctimes = { 1000, 3500, 13000, 16000, 22000, 25000, 30000, 36000, 40000, 44000, 49000, 53300, 56450, 60500, 65000, 72000, 74400, 76700, 79700, 83500, 86800 }
rcd1times = { 3500, 13000, 16000, 22350, 26000, 30500, 37000, 40000, 44500, 49350, 53300, 57000, 60850, 65000 + ( 1000 * 8 / 7 ) - ( 1000 * 1 / 21 ), 69250, 73700, 76700, 80200, 85650 }
rcd2times = { 9500, 14000, 17000, 22700, 30500, 37350, 41500, 44500, 49700, 53500, 59000, 62900 - ( 1000 * 4 / 21 ), 68150, 70700, 73000, 77000, 81600, 85950 }
rcd3times = { 9500, 15000, 19000, 23050, 37700, 41500, 45500, 50050, 53500, 59350, 64000, 68650, 72050, 74700, 77600, 82000, 86400 }
rcr1times = { 6500, 18000, 23850, 28250, 32500, 35500, 38500, 42500, 47000, 51350, 55000, 57500, 62250, 65500, 71400, 76150, 78700, 82900, 86800 }
rcr2times = { 24400, 31300, 35000, 43650, 47250, 52500, 57800, 65000 + ( 1000 * 8 / 7 ) + ( 1000 * 1 / 21 ), 67850, 78300, 86800 }
rcr3times = { 30850, 34000, 67350, 70000, 86800 }
rcd1r1times = { 31750, 40750, 48000, 51700, 56000, 58500, 65000 + ( 1000 * 8 / 7 ) + ( 1000 * 4 / 7 ), 76150, 81200, 86450 }
gctimes = { 9500, 20000, 23500, 28000, 34000, 39000, 43500, 46500, 51000, 53500, 56250, 62000, 70000, 73000, 76000, 81000, 85600 }
gcr1times = { 86000 }
gcr2times = { 86500 }
wl1_1times = { 23500, 31500, 51000, 65000 }
wlhalf_1times = { 30000, 51000 + ( 1000 * 8 / 7 ), 62900, 65000 + ( 1000 * 8 / 7 ) + ( 1000 * 2 / 21 ) }
wl1_2times = { 30500, 66850 }
	rctimescount = 1
	rcd1timescount = 1
	rcd2timescount = 1
	rcd3timescount = 1
	rcr1timescount = 1
	rcr2timescount = 1
	rcr3timescount = 1
	rcd1r1timescount = 1
	gctimescount = 1
	gcr1timescount = 1
	gcr2timescount = 1
	wl1_1timescount = 1
	wlhalf_1timescount = 1
	wl1_2timescount = 1
	repeat
		transition.to( redcircle, { time = 2000, x = display.contentWidth / 2 * -1, delay = rctimes[rctimescount] } )
		timer.performWithDelay( rctimes[rctimescount] + 2050, redcirclereset )
		rctimescount = rctimescount + 1
	until rctimescount > #rctimes
	repeat
		transition.to( redcircledown1, { time = 2000, x = display.contentWidth / 2 * -1 + display.contentHeight / 8, delay = rcd1times[rcd1timescount] } )
		timer.performWithDelay( rcd1times[rcd1timescount] + 2050, redcircledown1reset )
		rcd1timescount = rcd1timescount + 1
	until rcd1timescount > #rcd1times
	repeat
		transition.to( redcircledown2, { time = 2000, x = display.contentWidth / 2 * -1 + display.contentHeight / 4, delay = rcd2times[rcd2timescount] } )
		timer.performWithDelay( rcd2times[rcd2timescount] + 2050, redcircledown2reset )
		rcd2timescount = rcd2timescount + 1
	until rcd2timescount > #rcd2times
	repeat
		transition.to( redcircledown3, { time = 2000, x = display.contentWidth / 2 * -1 + display.contentHeight / 8 * 3, delay = rcd3times[rcd3timescount] } )
		timer.performWithDelay( rcd3times[rcd3timescount] + 2050, redcircledown3reset )
		rcd3timescount = rcd3timescount + 1
	until rcd3timescount > #rcd3times
	repeat
		transition.to( redcircleright1, { time = 2000, x = display.contentWidth / 2 * -1, delay = rcr1times[rcr1timescount] } )
		timer.performWithDelay( rcr1times[rcr1timescount] + 2050, redcircleright1reset )
		rcr1timescount = rcr1timescount + 1
	until rcr1timescount > #rcr1times
	repeat
		transition.to( redcircleright2, { time = 2000, x = display.contentWidth / 2 * -1, delay = rcr2times[rcr2timescount] } )
		timer.performWithDelay( rcr2times[rcr2timescount] + 2050, redcircleright2reset )
		rcr2timescount = rcr2timescount + 1
	until rcr2timescount > #rcr2times
	repeat
		transition.to( redcircleright3, { time = 2000, x = display.contentWidth / 2 * -1, delay = rcr3times[rcr3timescount] } )
		timer.performWithDelay( rcr3times[rcr3timescount] + 2050, redcircleright3reset )
		rcr3timescount = rcr3timescount + 1
	until rcr3timescount > #rcr3times
	repeat
		transition.to( redcircledown1right1, { time = 2000, x = display.contentWidth / 2 * -1 + display.contentHeight / 8, delay = rcd1r1times[rcd1r1timescount] } )
		timer.performWithDelay( rcd1r1times[rcd1r1timescount] + 2050, redcircledown1right1reset )
		rcd1r1timescount = rcd1r1timescount + 1
	until rcd1r1timescount > #rcd1r1times
	repeat
		transition.to( greencircle, { time = 2000, x = display.contentWidth / 2 * -1, delay = gctimes[gctimescount] } )
		timer.performWithDelay( gctimes[gctimescount] + 2050, greencirclereset )
		gctimescount = gctimescount + 1
	until gctimescount > #gctimes
	repeat
		transition.to( greencircleright1, { time = 2000, x = display.contentWidth / 2 * -1, delay = gcr1times[gcr1timescount] } )
		timer.performWithDelay( gcr1times[gcr1timescount] + 2050, greencircleright1reset )
		gcr1timescount = gcr1timescount + 1
	until gcr1timescount > #gcr1times
	repeat
		transition.to( greencircleright2, { time = 2000, x = display.contentWidth / 2 * -1, delay = gcr2times[gcr2timescount] } )
		timer.performWithDelay( gcr2times[gcr2timescount] + 2050, greencircleright2reset )
		gcr2timescount = gcr2timescount + 1
	until gcr2timescount > #gcr2times
	repeat
		transition.to( whiteline1_1, { time = 20000 / 7, x = display.contentWidth / 2 + display.contentWidth / 4 * 5 * -1, delay = wl1_1times[wl1_1timescount] } )
		timer.performWithDelay( wl1_1times[wl1_1timescount] + ( 20000 / 7 ) + 50, whiteline1_1reset )
	wl1_1timescount = wl1_1timescount + 1
	until wl1_1timescount > #wl1_1times
	repeat
		transition.to( whitelinehalf_1, { time = 15000 / 7, x = display.contentWidth / 4 + display.contentWidth / 4 * 5 * -1 / 2, delay = wlhalf_1times[wlhalf_1timescount] } )
		timer.performWithDelay( wlhalf_1times[wlhalf_1timescount] + ( 15000 / 7 ) + 50, whitelinehalf_1reset )
		wlhalf_1timescount = wlhalf_1timescount + 1
	until wlhalf_1timescount > #wlhalf_1times
	repeat
		transition.to( whiteline1_2, { time = 20000 / 7, x = display.contentWidth / 2 + display.contentWidth / 4 * 5 * -1, delay = wl1_2times[wl1_2timescount] } )
		timer.performWithDelay( wl1_2times[wl1_2timescount] + ( 20000 / 7 ) + 50, whiteline1_2reset )
		wl1_2timescount = wl1_2timescount + 1
	until wl1_2timescount > #wl1_2times
	gravityswitchgravity = timer.performWithDelay( 90000, placeholderfunction )
end
level1:addEventListener( "tap", level1 )



function level2:tap( event )
	collision = false
	levels.isVisible = false
	game.isVisible = true
	main.isVisible = false
	lost.isVisible = false
	audio.play(levelgravitymusic)
	physics.setGravity( display.contentWidth * display.contentWidth, display.contentHeight * gvvconstant * 11 / 72900 )
	timer.performWithDelay( 0, regularswitch )
	timer.performWithDelay( 0, circlereset )
	timer.performWithDelay( 0, redcirclereset )
	timer.performWithDelay( 0, redcircledown1reset )
	timer.performWithDelay( 0, redcircledown2reset )
	timer.performWithDelay( 0, redcircledown3reset )
	timer.performWithDelay( 0, redcircleright1reset )
	timer.performWithDelay( 0, redcircleright2reset )
	timer.performWithDelay( 0, redcircleright3reset )
	timer.performWithDelay( 0, redcircleright4reset )
	timer.performWithDelay( 0, redcircledown1right1reset )
	timer.performWithDelay( 0, redcircledown1right2reset )
	timer.performWithDelay( 0, redcircledown1right3reset )
	timer.performWithDelay( 0, redcircledown1right4reset )
	timer.performWithDelay( 0, greencirclereset )
	timer.performWithDelay( 0, greendown1circlereset )
	timer.performWithDelay( 0, greencircleright1reset )
	timer.performWithDelay( 0, greencircleright2reset )
	timer.performWithDelay( 0, greencircleright3reset )
	timer.performWithDelay( 0, greencircleright4reset )
	timer.performWithDelay( 0, whiteline1_1reset )
	timer.performWithDelay( 0, whitelinehalf_1reset )
	timer.performWithDelay( 0, whiteline1_2reset )
	timer.performWithDelay( 0, whiteline1_3reset )
	timer.performWithDelay( 0, whiteline1_4reset )
rctimes = { 1000, 4500, 6900, 10900, 14350, 21000, 24000, 28500, 35000, 39100, 42500, 48400, 53000, 55250, 59000, 63500, 67100 }
rcd1times = { 1000, 5500, 9700, 12000, 15500, 21000, 25500, 29925, 36000, 44800, 48400, 51700, 55000, 58300, 60550, 63850, 66600 }
rcd2times = { 2000, 5500, 9700, 12000, 15500, 21900, 25500, 30500, 37750, 43500, 50350, 53200, 58300, 60550, 64500, 67100 }
rcd3times = { 2000, 6500, 10100, 14700, 21900, 26000, 30500, 39300, 51300, 54300, 60900, 64500, 67100 }
rcr1times = { 3000, 9300, 12600, 16300, 21700, 24750, 37000, 41450, 46200, 49500, 54100, 57000, 60200, 65200 }
rcr2times = { 4720, 8300, 14250, 18200, 22600, 24750, 38000, 40700, 44800, 49850, 57000, 62950 }
rcr3times = { 8800, 17750, 24750, 27300, 37500, 41000, 44200, 46500, 50750, 57800, 62450 }
rcr4times = { 10100, 19300, 35500, 39300, 43000, 50300 }
rcd1r1times = { 3400, 9300, 13000, 16600, 23600, 29800, 40400, 46800, 51700, 56400, 59150, 61550, 66000 }
rcd1r2times = { 28800, 38500, 41000, 44350, 49100, 55400, 59150 }
rcd1r3times = { 28000, 38400, 41700, 44200, 48900, 57800 }
rcd1r4times = { 36500, 39800, 44000, 49550 }
gctimes = { 3175, 13550, 16300, 21850, 27300, 46000, 53900, 56200, 62200, 64500 }
gcd1times = { 28000, 54300, 65700 }
gcr1times = { 4500, 8000, 17450, 23500, 29600, 47100, 59000, 62200, 67100 }
gcr2times = { 9900, 18600, 24500, 57600 }
gcr3times = { 47100, 51500 }
gcr4times = { 46000, 49480 }
wl1_1times = { 6900, 16300, 24000, 46000, 56200 }
wlhalf_1times = { 9100, 13550, 22200, 28500, 55250 }
wl1_2times = { 8000, 17450, 47100, 57000, 62200 }
wl1_3times = { 18600, 47100 }
wl1_4times = { 46000 }
	rctimescount = 1
	rcd1timescount = 1
	rcd2timescount = 1
	rcd3timescount = 1
	rcr1timescount = 1
	rcr2timescount = 1
	rcr3timescount = 1
	rcr4timescount = 1
	rcd1r1timescount = 1
	rcd1r2timescount = 1
	rcd1r3timescount = 1
	rcd1r4timescount = 1
	gctimescount = 1
	gcd1timescount = 1
	gcr1timescount = 1
	gcr2timescount = 1
	gcr3timescount = 1
	gcr4timescount = 1
	wl1_1timescount = 1
	wlhalf_1timescount = 1
	wl1_2timescount = 1
	wl1_3timescount = 1
	wl1_4timescount = 1
	repeat
		transition.to( redcircle, { time = 2000, x = display.contentWidth / 2 * -1, delay = rctimes[rctimescount] } )
		timer.performWithDelay( rctimes[rctimescount] + 2050, redcirclereset )
		rctimescount = rctimescount + 1
	until rctimescount > #rctimes
	repeat
		transition.to( redcircledown1, { time = 2000, x = display.contentWidth / 2 * -1 + display.contentHeight / 8, delay = rcd1times[rcd1timescount] } )
		timer.performWithDelay( rcd1times[rcd1timescount] + 2050, redcircledown1reset )
		rcd1timescount = rcd1timescount + 1
	until rcd1timescount > #rcd1times
	repeat
		transition.to( redcircledown2, { time = 2000, x = display.contentWidth / 2 * -1 + display.contentHeight / 4, delay = rcd2times[rcd2timescount] } )
		timer.performWithDelay( rcd2times[rcd2timescount] + 2050, redcircledown2reset )
		rcd2timescount = rcd2timescount + 1
	until rcd2timescount > #rcd2times
	repeat
		transition.to( redcircledown3, { time = 2000, x = display.contentWidth / 2 * -1 + display.contentHeight / 8 * 3, delay = rcd3times[rcd3timescount] } )
		timer.performWithDelay( rcd3times[rcd3timescount] + 2050, redcircledown3reset )
		rcd3timescount = rcd3timescount + 1
	until rcd3timescount > #rcd3times
	repeat
		transition.to( redcircleright1, { time = 2000, x = display.contentWidth / 2 * -1, delay = rcr1times[rcr1timescount] } )
		timer.performWithDelay( rcr1times[rcr1timescount] + 2050, redcircleright1reset )
		rcr1timescount = rcr1timescount + 1
	until rcr1timescount > #rcr1times
	repeat
		transition.to( redcircleright2, { time = 2000, x = display.contentWidth / 2 * -1, delay = rcr2times[rcr2timescount] } )
		timer.performWithDelay( rcr2times[rcr2timescount] + 2050, redcircleright2reset )
		rcr2timescount = rcr2timescount + 1
	until rcr2timescount > #rcr2times
	repeat
		transition.to( redcircleright3, { time = 2000, x = display.contentWidth / 2 * -1, delay = rcr3times[rcr3timescount] } )
		timer.performWithDelay( rcr3times[rcr3timescount] + 2050, redcircleright3reset )
		rcr3timescount = rcr3timescount + 1
	until rcr3timescount > #rcr3times
	repeat
		transition.to( redcircleright4, { time = 2000, x = display.contentWidth / 2 * -1, delay = rcr4times[rcr4timescount] } )
		timer.performWithDelay( rcr4times[rcr4timescount] + 2050, redcircleright4reset )
		rcr4timescount = rcr4timescount + 1
	until rcr4timescount > #rcr4times
	repeat
		transition.to( redcircledown1right1, { time = 2000, x = display.contentWidth / 2 * -1 + display.contentHeight / 8, delay = rcd1r1times[rcd1r1timescount] } )
		timer.performWithDelay( rcd1r1times[rcd1r1timescount] + 2050, redcircledown1right1reset )
		rcd1r1timescount = rcd1r1timescount + 1
	until rcd1r1timescount > #rcd1r1times
	repeat
		transition.to( redcircledown1right2, { time = 2000, x = display.contentWidth / 2 * -1 + display.contentHeight / 8, delay = rcd1r2times[rcd1r2timescount] } )
		timer.performWithDelay( rcd1r2times[rcd1r2timescount] + 2050, redcircledown1right2reset )
		rcd1r2timescount = rcd1r2timescount + 1
	until rcd1r2timescount > #rcd1r2times
	repeat
		transition.to( redcircledown1right3, { time = 2000, x = display.contentWidth / 2 * -1 + display.contentHeight / 8, delay = rcd1r3times[rcd1r3timescount] } )
		timer.performWithDelay( rcd1r3times[rcd1r3timescount] + 2050, redcircledown1right3reset )
		rcd1r3timescount = rcd1r3timescount + 1
	until rcd1r3timescount > #rcd1r3times
	repeat
		transition.to( redcircledown1right4, { time = 2000, x = display.contentWidth / 2 * -1 + display.contentHeight / 8, delay = rcd1r4times[rcd1r4timescount] } )
		timer.performWithDelay( rcd1r4times[rcd1r4timescount] + 2050, redcircledown1right4reset )
		rcd1r4timescount = rcd1r4timescount + 1
	until rcd1r4timescount > #rcd1r4times
	repeat
		transition.to( greencircle, { time = 2000, x = display.contentWidth / 2 * -1, delay = gctimes[gctimescount] } )
		timer.performWithDelay( gctimes[gctimescount] + 2050, greencirclereset )
		gctimescount = gctimescount + 1
	until gctimescount > #gctimes
	repeat
		transition.to( greencircledown1, { time = 2000, x = display.contentWidth / 2 * -1 + display.contentHeight / 8, delay = gcd1times[gcd1timescount] } )
		timer.performWithDelay( gcd1times[gcd1timescount] + 2050, greencircledown1reset )
		gcd1timescount = gcd1timescount + 1
	until gcd1timescount > #gcd1times
	repeat
		transition.to( greencircleright1, { time = 2000, x = display.contentWidth / 2 * -1, delay = gcr1times[gcr1timescount] } )
		timer.performWithDelay( gcr1times[gcr1timescount] + 2050, greencircleright1reset )
		gcr1timescount = gcr1timescount + 1
	until gcr1timescount > #gcr1times
	repeat
		transition.to( greencircleright2, { time = 2000, x = display.contentWidth / 2 * -1, delay = gcr2times[gcr2timescount] } )
		timer.performWithDelay( gcr2times[gcr2timescount] + 2050, greencircleright2reset )
		gcr2timescount = gcr2timescount + 1
	until gcr2timescount > #gcr2times
	repeat
		transition.to( greencircleright3, { time = 2000, x = display.contentWidth / 2 * -1, delay = gcr3times[gcr3timescount] } )
		timer.performWithDelay( gcr3times[gcr3timescount] + 2050, greencircleright3reset )
		gcr3timescount = gcr3timescount + 1
	until gcr3timescount > #gcr3times
	repeat
		transition.to( greencircleright4, { time = 2000, x = display.contentWidth / 2 * -1, delay = gcr4times[gcr4timescount] } )
		timer.performWithDelay( gcr4times[gcr4timescount] + 2050, greencircleright4reset )
		gcr4timescount = gcr4timescount + 1
	until gcr4timescount > #gcr4times
	repeat
		transition.to( whiteline1_1, { time = 20000 / 7, x = display.contentWidth / 2 + display.contentWidth / 4 * 5 * -1, delay = wl1_1times[wl1_1timescount] } )
		timer.performWithDelay( wl1_1times[wl1_1timescount] + ( 20000 / 7 ) + 50, whiteline1_1reset )
	wl1_1timescount = wl1_1timescount + 1
	until wl1_1timescount > #wl1_1times
	repeat
		transition.to( whitelinehalf_1, { time = 15000 / 7, x = display.contentWidth / 4 + display.contentWidth / 4 * 5 * -1 / 2, delay = wlhalf_1times[wlhalf_1timescount] } )
		timer.performWithDelay( wlhalf_1times[wlhalf_1timescount] + ( 15000 / 7 ) + 50, whitelinehalf_1reset )
		wlhalf_1timescount = wlhalf_1timescount + 1
	until wlhalf_1timescount > #wlhalf_1times
	repeat
		transition.to( whiteline1_2, { time = 20000 / 7, x = display.contentWidth / 2 + display.contentWidth / 4 * 5 * -1, delay = wl1_2times[wl1_2timescount] } )
		timer.performWithDelay( wl1_2times[wl1_2timescount] + ( 20000 / 7 ) + 50, whiteline1_2reset )
		wl1_2timescount = wl1_2timescount + 1
	until wl1_2timescount > #wl1_2times
	repeat
		transition.to( whiteline1_3, { time = 20000 / 7, x = display.contentWidth / 2 + display.contentWidth / 4 * 5 * -1, delay = wl1_3times[wl1_3timescount] } )
		timer.performWithDelay( wl1_3times[wl1_3timescount] + ( 20000 / 7 ) + 50, whiteline1_3reset )
		wl1_3timescount = wl1_3timescount + 1
	until wl1_3timescount > #wl1_3times
	repeat
		transition.to( whiteline1_4, { time = 20000 / 7, x = display.contentWidth / 2 + display.contentWidth / 4 * 5 * -1, delay = wl1_4times[wl1_4timescount] } )
		timer.performWithDelay( wl1_4times[wl1_4timescount] + ( 20000 / 7 ) + 50, whiteline1_4reset )
		wl1_4timescount = wl1_4timescount + 1
	until wl1_4timescount > #wl1_4times
	gravityswitchgravity = timer.performWithDelay( 31740, gravityswitch )
	gravityswitchregular = timer.performWithDelay( 53000, regularswitch )
end
level2:addEventListener( "tap", level2 )




--the speed of the balls is 7/4/2 = ⅞ display.contentWidth per second = 21 / 16 display.contentHeight per second




function placeholderfunction( event )
end


function circlereset( event )
	transition.to( circle, { time = 0, x = display.contentWidth / 16 * 5, y = display.contentHeight / 16 * 11 } )
	circle:setLinearVelocity( 0, 0 )
end


function redcirclereset( event )
	transition.to( redcircle, { time = 0, x = display.contentWidth / 4 * 5 } )
	redcircle:setLinearVelocity( 0, 0 )
end


function redcircledown1reset( event )
	transition.to( redcircledown1, { time = 0, x = display.contentWidth / 4 * 5 + display.contentHeight / 8 } )
	redcircledown1:setLinearVelocity( 0, 0 )
end


function redcircledown2reset( event )
	transition.to( redcircledown2, { time = 0, x = display.contentWidth / 4 * 5 + display.contentHeight / 4 } )
	redcircledown2:setLinearVelocity( 0, 0 )
end


function redcircledown3reset( event )
	transition.to( redcircledown3, { time = 0, x = display.contentWidth / 4 * 5 + display.contentHeight / 8 * 3 } )
	redcircledown3:setLinearVelocity( 0, 0 )
end


function redcircleright1reset( event )
	transition.to( redcircleright1, { time = 0, x = display.contentWidth / 4 * 5 } )
	redcircleright1:setLinearVelocity( 0, 0 )
end


function redcircleright2reset ( event )
	transition.to( redcircleright2, { time = 0, x = display.contentWidth / 4 * 5 } )
	redcircleright2:setLinearVelocity( 0, 0 )
end


function redcircleright3reset ( event )
	transition.to( redcircleright3, { time = 0, x = display.contentWidth / 4 * 5 } )
	redcircleright3:setLinearVelocity( 0, 0 )
end


function redcircleright4reset ( event )
	transition.to( redcircleright4, { time = 0, x = display.contentWidth / 4 * 5 } )
	redcircleright4:setLinearVelocity( 0, 0 )
end


function redcircledown1right1reset ( event )
	transition.to( redcircledown1right1, { time = 0, x = display.contentWidth / 4 * 5 + display.contentHeight / 8 } )
	redcircledown1right1:setLinearVelocity( 0, 0 )
end


function redcircledown1right2reset ( event )
	transition.to( redcircledown1right2, { time = 0, x = display.contentWidth / 4 * 5 + display.contentHeight / 8 } )
	redcircledown1right2:setLinearVelocity( 0, 0 )
end


function redcircledown1right3reset ( event )
	transition.to( redcircledown1right3, { time = 0, x = display.contentWidth / 4 * 5 + display.contentHeight / 8 } )
	redcircledown1right3:setLinearVelocity( 0, 0 )
end


function redcircledown1right4reset ( event )
	transition.to( redcircledown1right4, { time = 0, x = display.contentWidth / 4 * 5 + display.contentHeight / 8 } )
	redcircledown1right4:setLinearVelocity( 0, 0 )
end


function greencirclereset( event )
	transition.to( greencircle, { time = 0, x = display.contentWidth / 4 * 5 } )
	greencircle:setLinearVelocity( 0, 0 )
end


function greencircledown1reset( event )
	transition.to( greencircledown1, { time = 0, x = display.contentWidth / 4 * 5 + display.contentHeight / 8 } )
	greencircledown1:setLinearVelocity( 0, 0 )
end


function greencircleright1reset( event )
	transition.to( greencircleright1, { time = 0, x = display.contentWidth / 4 * 5 } )
	greencircleright1:setLinearVelocity( 0, 0 )
end


function greencircleright2reset( event )
	transition.to( greencircleright2, { time = 0, x = display.contentWidth / 4 * 5 } )
	greencircleright2:setLinearVelocity( 0, 0 )
end


function greencircleright3reset( event )
	transition.to( greencircleright3, { time = 0, x = display.contentWidth / 4 * 5 } )
	greencircleright3:setLinearVelocity( 0, 0 )
end


function greencircleright4reset( event )
	transition.to( greencircleright4, { time = 0, x = display.contentWidth / 4 * 5 } )
	greencircleright4:setLinearVelocity( 0, 0 )
end


function whiteline1_1reset( event )
	transition.to( whiteline1_1, { time = 0, x = display.contentWidth / 2 + display.contentWidth / 4 * 5 } )
	whiteline1_1:setLinearVelocity( 0, 0 )
end


function whitelinehalf_1reset( event )
	transition.to( whitelinehalf_1, { time = 0, x = display.contentWidth / 4 + display.contentWidth / 4 * 5 } )
	whitelinehalf_1:setLinearVelocity( 0, 0 )
end


function whiteline1_2reset( event )
	transition.to( whiteline1_2, { time = 0, x = display.contentWidth / 2 + display.contentWidth / 4 * 5 } )
	whiteline1_2:setLinearVelocity( 0, 0 )
end


function whiteline1_3reset( event )
	transition.to( whiteline1_3, { time = 0, x = display.contentWidth / 2 + display.contentWidth / 4 * 5 } )
	whiteline1_3:setLinearVelocity( 0, 0 )
end


function whiteline1_4reset( event )
	transition.to( whiteline1_4, { time = 0, x = display.contentWidth / 2 + display.contentWidth / 4 * 5 } )
	whiteline1_4:setLinearVelocity( 0, 0 )
end


function instructionsbutton:tap( event )
	main.isVisible = false
	instructions.isVisible = true
end
instructionsbutton:addEventListener( "tap", instructionsbutton )


function instructionstomenu:tap( event )
	main.isVisible = true
	instructions.isVisible = false
end
instructionstomenu:addEventListener( "tap", instructionstomenu )


function startoverbutton:tap( event )
	levels.isVisible = true
	lost.isVisible = false
	main.isVisible = false
	game.isVisible = false
end
startoverbutton:addEventListener( "tap", startoverbutton )


function regularswitch( event )
regular = true
gravity = false
line2.y = display.contentHeight / 4 * 3 - 1 + 3 / 2
line2.isVisible = false
gravityinstructions.alpha = 1
gravityinstructions.isVisible = false
physics.setGravity( display.contentWidth * display.contentWidth, display.contentHeight * gvvconstant * 11 / 72900 )
end


function gravityswitch( event )
gravity = true
regular = false
line2.y = display.contentHeight / 8 - 1 + 3 / 2
line2.isVisible = true
gravityinstructions.isVisible = true
transition.to( gravityinstructions, { time = 10000, delay = 3000, alpha = 0 } )
jumper.isVisible = true
end


function jumper:touch( event )
jumper.isVisible = false
if (regular == true and gravity == false) then
	circle:setLinearVelocity( 0, display.contentHeight * gvvconstant * 11 / 10800 * -1 )
--[[	background:setFillColor( math.random(0, 200) / 255, math.random(), math.random() )
	circle:setFillColor( math.random(), math.random(), math.random() )
	line:setFillColor( math.random(), math.random(), math.random() )
	jumper:setFillColor( math.random(), math.random(), math.random() )]]--
elseif (gravity == true and regular == false) then
	setgravity = setgravity * -1
	physics.setGravity( display.contentWidth * display.contentWidth, setgravity )
	circle:applyLinearImpulse( 0, setgravity / math.abs(setgravity) )
--[[	background:setFillColor( math.random(0, 200) / 255, math.random(), math.random() )
	circle:setFillColor( math.random(), math.random(), math.random() )
	line:setFillColor( math.random(), math.random(), math.random() )
	line2:setFillColor( math.random(), math.random(), math.random() )
	jumper:setFillColor( math.random(), math.random(), math.random() )]]--
else
	print("Error in jumper function")
end
end
jumper:addEventListener( "touch", jumper )


gravityswitchgravity = timer.performWithDelay( 0, placeholderfunction )
gravityswitchregular = timer.performWithDelay( 0, placeholderfunction )


function reappear( event )
	if ( event.phase == "began" ) then
	jumper.isVisible = true
	end
end
Runtime:addEventListener( "collision", reappear )


function gameover( event )
	collision = true
	lost.isVisible = true
	game.isVisible = false
	main.isVisible = false
	levels.isVisible = false
	audio.stop()
	transition.cancel()
	physics.setGravity( display.contentWidth * display.contentWidth, display.contentHeight * gvvconstant * 11 / 72900 )
	timer.cancel( gravityswitchgravity )
	timer.cancel( gravityswitchregular )
	timer.performWithDelay( 0, regularswitch )
	timer.performWithDelay( 0, circlereset )
	timer.performWithDelay( 0, redcirclereset )
	timer.performWithDelay( 0, redcircledown1reset )
	timer.performWithDelay( 0, redcircledown2reset )
	timer.performWithDelay( 0, redcircledown3reset )
	timer.performWithDelay( 0, redcircleright1reset )
	timer.performWithDelay( 0, redcircleright2reset )
	timer.performWithDelay( 0, redcircleright3reset )
	timer.performWithDelay( 0, redcircleright4reset )
	timer.performWithDelay( 0, redcircledown1right1reset )
	timer.performWithDelay( 0, redcircledown1right2reset )
	timer.performWithDelay( 0, redcircledown1right3reset )
	timer.performWithDelay( 0, redcircledown1right4reset )
	timer.performWithDelay( 0, greencirclereset )
	timer.performWithDelay( 0, greencircledown1reset )
	timer.performWithDelay( 0, greencircleright1reset )
	timer.performWithDelay( 0, greencircleright2reset )
	timer.performWithDelay( 0, greencircleright3reset )
	timer.performWithDelay( 0, greencircleright4reset )
	timer.performWithDelay( 0, whiteline1_1reset )
	timer.performWithDelay( 0, whitelinehalf_1reset )
	timer.performWithDelay( 0, whiteline1_2reset )
	timer.performWithDelay( 0, whiteline1_3reset )
	timer.performWithDelay( 0, whiteline1_4reset )
end

--[[
function blackline:collision( event )
	timer.performWithDelay( 0, gameover )
end
blackline:addEventListener( "collision", blackline )


function redcircle:collision( event )
	timer.performWithDelay( 0, gameover )
end
redcircle:addEventListener( "collision", redcircle )


function redcircledown1:collision( event )
	timer.performWithDelay( 0, gameover )
end
redcircledown1:addEventListener( "collision", redcircledown1 )


function redcircledown2:collision( event )
	timer.performWithDelay( 0, gameover )
end
redcircledown2:addEventListener( "collision", redcircledown2 )


function redcircledown3:collision( event )
	timer.performWithDelay( 0, gameover )
end
redcircledown3:addEventListener( "collision", redcircledown3 )


function redcircleright1:collision( event )
	timer.performWithDelay( 0, gameover )
end
redcircleright1:addEventListener( "collision", redcircleright1 )


function redcircleright2:collision( event )
	timer.performWithDelay( 0, gameover )
end
redcircleright2:addEventListener( "collision", redcircleright2 )


function redcircleright3:collision( event )
	timer.performWithDelay( 0, gameover )
end
redcircleright3:addEventListener( "collision", redcircleright3 )


function redcircleright4:collision( event )
	timer.performWithDelay( 0, gameover )
end
redcircleright4:addEventListener( "collision", redcircleright4 )


function redcircledown1right1:collision( event )
	timer.performWithDelay( 0, gameover )
end
redcircledown1right1:addEventListener( "collision", redcircledown1right1 )


function redcircledown1right2:collision( event )
	timer.performWithDelay( 0, gameover )
end
redcircledown1right2:addEventListener( "collision", redcircledown1right2 )


function redcircledown1right3:collision( event )
	timer.performWithDelay( 0, gameover )
end
redcircledown1right3:addEventListener( "collision", redcircledown1right3 )


function redcircledown1right4:collision( event )
	timer.performWithDelay( 0, gameover )
end
redcircledown1right4:addEventListener( "collision", redcircledown1right4 )
]]--

--[[]]--
resetter = display.newRect( 450, 10, 20, 20 )
resetter:setFillColor( 1, 1, 1 )
function resetter:touch( event )
	timer.performWithDelay( 0, gameover )
end
resetter:addEventListener( "touch", resetter )
--[[]]--











