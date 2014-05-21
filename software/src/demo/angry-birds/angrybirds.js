move = function(x,y,z, when) {
  setTimeout(function(){ go(x,y,z);}, when);
}

play = function(){
    move(-10,-20,-140,0);
    move(-10,-20,-149,200);
    move(-25,-28,-148,500);
    move(-25,-28,-140,800);
    move(0,0,-120,1200);

    move(34,-36,-140, 4000);
    move(34,-36,-150, 4500);
    move(34,-36,-140, 5000);    

    move(4,-32,-140,0+8000);
    move(4,-32,-149,300+8000);
    move(4,-32,-140,600+8000);
    move(0,0,-120,900+8000);
}


repeat = function(){
   move(4,-32,-140,0);
   move(4,-32,-149,300);
   move(4,-32,-140,600);
   move(0,0,-120,900);
}


play_forever = function(){
    console.log("Now playing forever...")
    play();
    interval = setInterval(play,13000);
    return interval;
}