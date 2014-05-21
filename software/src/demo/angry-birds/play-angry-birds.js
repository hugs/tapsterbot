sleep = require('teddybear');

move = function(x, y, z) {
    go(x, y, z);
    sleep(1000);
}

play = function() {
    move(25,-10,-140);
    move(25,-10,-147);
    move(35,-15,-145);
    move(35,-15,-145);
    move(0,0,-130);
}


sleep = require('teddybear');

throw_bird = function() {
    go(7,33,-155);
    sleep(500);
    go(7,33,-160);
    sleep(500);
    go(14,50,-158);
    sleep(500);
    go(14,50,-158);
    sleep(500);
    go(0,0,-130);
}