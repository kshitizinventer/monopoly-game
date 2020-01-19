class roulette
{
  int slider_p_of_betting_money;
  int slider_p_of_roullete_no;
  float bettingmoney;
  float velocity;
  float acceleration;
  float a;
  float radius;
  int available;
  float winningmoney;
  float loosingmoney;
  int f;
  roulette(int sp,float bm)
  {
    slider_p_of_betting_money=sp;
    bettingmoney=bm;
    velocity=0;
    acceleration=-0.005;
    a=-PI/2;
    radius=220;
    available=1;
    winningmoney=0;
    loosingmoney=0;
    slider_p_of_roullete_no=220;
    f=0;
  }
  
  void rollball(float v)
  {
    velocity=v;
  }
  void rollballupdate()
  {  
      a+=velocity;
      velocity+=acceleration;
      //if(velocity==0)
      //  e=4;
      
  }
  
  void showroulette()
{
  
  fill(200);
  rect(150,150,600,600);
  image(img,150,150,600,600);
  fill(200);
  ellipse(448,450,350,350);
  
  translate(448,450);
  //rotate(r.a);
  noStroke();
  fill(255,255,0);
  ellipse(radius*cos(a),radius*sin(a),20,20);
  if(velocity>=0)
  {
   rollballupdate();

  }
  if(velocity<0 && f==1)
  {
     e=5;
     calculateprize();
  }
  //rotate(-r.a);
  translate(-448,-450);
  roulettebutton();
  rouletteslide();
  //noFill();
  //ellipse(350,350,350,350); 
 
}

void roulettebutton()
{
  noFill();
  stroke(5);
  rect(800,380,125,50);
  fill(0);
  text("BET",810,420);
}

void rouletteslide()
{
  stroke(0);
  strokeWeight(5);
  line(800,200,1000,200);
  fill(255,0,0);
  rect(slider_p_of_betting_money,185,10,30);
  
  text(bettingmoney+"M",800,280);
  
}

void popupbox()
{
  fill(0,0,255,63);
  rect(150,150,900,600);

 
 //the following code is for drawing the upper half of popupbox
 //when the user presses on bet button of roullete
 //----------------------------------------------------------------------------------------------------------------------------------------------------
  fill(0);
  textSize(32);
  text("placing bet on any no here will quadruple  your money",180,250);
  stroke(0);
  strokeWeight(5);
  //length of line = 222
  line(220,320,442,320);
  fill(255,0,0);
  rect(slider_p_of_roullete_no,305,10,30);
  fill(0);
  text((slider_p_of_roullete_no-220)/6,320,390);
 //play button for betting on a particular no
  noFill();
  rect(600,290,100,50);
  text("PLAY",610,325);
//-----------------------------------------------------------------------------------------------------------------------------------------------------  

//the following code is for the lower half of popupbox  
//the following code is for the lower half of popupbox  
//------------------------------------------------------------------------------------------------------------------------------------------------------  
  text("placing your bet here will double your money",180,450);
  rect(220,510,125,50); 
  text("BLACK",230,545);
  rect(370,510,125,50); 
  text("RED",398,545);
  //play button for black and red color picking
  rect(600,510,100,50);
  text("PLAY",610,545);
  
 //------------------------------------------------------------------------------------------------------------------------------------------------------
 
}//end of popupbox function

//calculate money gained or loosed by player
//--------------------------------------------------------------------------------------------------------------------------------------------------------
void calculateprize()
{
  float theta=0;
  theta=a;
  while(theta>0)
   theta=theta-2*PI;
   theta=theta+PI/2;
   
  if(theta>0 && theta<PI)
    winningmoney= bettingmoney*2;   
  else 
   winningmoney=-bettingmoney;   
   println(theta);
   //println(a);
   println(PI/2);
}
//--------------------------------------------------------------------------------------------------------------------------------------------------------

void showrewardmoneybox()
{
  fill(240,240,240,240);
  rect(200,210,700,600);
  fill(0);

  if(winningmoney>0)
  { 
    String m=nf(winningmoney,2,2)+'M';
    textSize(50);
    text("CONGRATULATIONS",300,270);
    textSize(40);
    text("You won ",430,370);
    text(m,420,440);
  }
  else
   {
     String m=nf(winningmoney,2,2)+'M';
     textSize(50);
     text("OOPS",450,280);
     textSize(40);
     text("You Lost",435,370);
     text(m,430,430);
   }
   
   noFill();
   rect(450,600,160,50);
   fill(0);
   textSize(40);
   text("ACCEPT",455,640);
}

  
}//end of roullete class
