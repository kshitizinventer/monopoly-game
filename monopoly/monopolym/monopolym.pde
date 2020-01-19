int dn;
player p;
void setup()
{
  p=new player(1,30,30);
  size(1200,900);
}

void draw()
{
  
  gameboarddraw();
  
  p.show();
  fill(255);
  textSize(50);
  text(dn,250,250);
  
  
  
  
  
}

void gameboarddraw()
{
    background(200);
  //rect();
  stroke(0);
  strokeWeight(3);
  for(int i=0;i<=8;i++)
  {
    stroke(0);
    line(150*i,0,150*i,height);
    line(0,150*i,width,150*i);
    
  }
  fill(220);
  strokeWeight(0);
  rect(153,153,894 ,594);
  
  textSize(50);
  fill(0, 102, 153);
  text("start", 25,85); 
}







void keyPressed(){
  if(key==ENTER)
   {
    dn=diceroll();
    p.move(dn);
   }
}
int diceroll()
{
  int diceno=int(random(6));
  return diceno;
}
