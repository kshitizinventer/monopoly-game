


// the following information about the value of e 
// tells the control of program

// e=0 means user needs to press the end turn button
// e=1 means user user needs to roll the dice
// e=2 means user needs to pay rent
// e=3 means needs has landed on roulette
// e=4 means user has to fill popupbox

PImage img;
int dn;
int c=0;
int e=1;
int rentpaid=0;
int ppos;
int prev_value_of_e=21;
property pr[] = new property[24];
player p[]=new player[4];
roulette r;
bank b;
popupbox popupbox;
int propertyowner[] = new int[24];
StringList propertyname;
void setup()
{
  img=loadImage("roulletenew.png");
  p[0]=new player(1,30,30,30);
  p[1]=new player(2,40,35,30);
  p[2]=new player(3,50,30,30);
  p[3]=new player(4,30,50,30);
 
  r=new roulette(820,1);
  b=new bank(300);
  popupbox=new popupbox();
  
  propertyname = new StringList();
  propertyname.append("Start");
  propertyname.append("Delhi");
  propertyname.append("Terminal 3");
  propertyname.append("Bombay");
  propertyname.append("Casino 1");
  propertyname.append("Jaipur");
  propertyname.append("Udaipur");
  propertyname.append("unknown");
  propertyname.append("Chest");
  propertyname.append("Haryana");
  propertyname.append("Chennai");
  propertyname.append("Ajmer");
  propertyname.append("unknown");
  propertyname.append("Kashmir");
  propertyname.append("Jammu");
  propertyname.append("Casino 2");
  propertyname.append("Manali");
  propertyname.append("Chaihal");
  propertyname.append("Shimla");
  propertyname.append("unknown");
  propertyname.append("unknown");
  propertyname.append("Chest");
  propertyname.append("Assam");
  propertyname.append("Ladakh");
  
  for(int i=0;i<24;i++)
  {
    float r=random(1,10); 
    pr[i]= new property(r,1,r*0.4,i+1);
    propertyowner[i]=-1;
  }
  pr[0].available=2;//start
  pr[0].is_for_sale=0;
  
  pr[4].available=5;//roulette
  pr[4].is_for_sale=0;
  
  pr[7].available=13;//unassigned
  pr[7].is_for_sale=0;
  
  pr[8].available=7;//chest
  pr[8].is_for_sale=0;
  
  pr[12].available=13;//unassigned
  pr[12].is_for_sale=0;
  
  pr[15].available=5;//roulette
  pr[15].is_for_sale=0;
  
  pr[19].available=13;//unassigned
  pr[19].is_for_sale=0;
  
  pr[20].available=13;//unassigned
  pr[20].is_for_sale=0;
  
  pr[21].available=7;//chest
  pr[21].is_for_sale=0;
  size(1600,900);
}

void draw()
{
  translate(0,0);
  rotate(0);
  background(200);
  //paint_properties();
  propertyownerindicator();  
  gameboarddraw();
  
  p[0].show();
  p[1].show();
  p[2].show();
  p[3].show();
  fill(255);
  textSize(50);
  fill(0);
  
   if(e!=4 && e!=20 && e!=3 && e!=5 && e!=8 && e!=9 && e!=10 && e!=12 && e!=11 && e!=13 && e!=14 && e!=15 && e!=16)
  {
   text(dn,250,250);
   dicebutton();
  }
  
  if(e==20)
  {
    popupbox.message(popupbox.store);
  }
  else if(e==4)
   r.popupbox();
  
  else if(e==3 || e==5)
  {
   r.showroulette();
  }
  else if(e==6)
   pr[ppos-1].property_onclick_popupbox();
  else if(e==7)
   pr[ppos-1].tradingbox();
  else if(e==8)
   pr[ppos-1].show_detailedstocks();
  else if(e==9)
   b.showbankloan_popupbox();
  else if(e==10)
   b.showbank();
  else if(e==12)
   b.showbankreject_yourloan_box();
  else if(e==11)
   b.loanacceptedbox();
  else if(e==13)
   b.depositmoneybox();
  else if(e==14)
   pr[ppos-1].tradestockbox();
  else if(e==15)
   b.paybankloanbox();
  else if(e==16)
   b.withdrawmoney();
   
  //if(e!=4 && e!=20 && e!=3 && e!=5)
  //{
  // text(dn,250,250);
  // dicebutton();
  //}
  
  //property box
  if(e!=4 && e!=20 && e!=6 && e!=7 && e!=8 && e!=9 && e!=10 && e!=12 && e!=11 && e!=13 && e!=14 && e!=15 && e!=16)
  {
   fill(200);
   rect(750,450,300,300);
   propertyshow(c);
  }
  if(e==5)
   r.showrewardmoneybox();
 
 //player box
 if(e==0 || e==1 || e==2)
 {
  fill(200);
  rect(750,150,300,300);
   playershow(c);
 } 
 //println(p[2].position);
 
  
 
 fill(0,0,255);
 noStroke();
 ellipse(mouseX,mouseY,10,10);
 
  
}

//FUNCTION 1
void gameboarddraw()
{
    //background(200);
  //rect();
  
  // drawing grid lines
  stroke(0);
  strokeWeight(3);
  for(int i=0;i<=8;i++)
  {
    stroke(0);
    line(150*i,0,150*i,height);
    line(0,150*i,1200,150*i);
    
  }
 
  //painting property colors
  paint_properties();
  
 // drawing hotels for each property 
  for(int i=0;i<24;i++)
   pr[i].draw_hotels();
  
  fill(180);
  strokeWeight(0);
  rect(153,153,894 ,594);
  
  textSize(40);
  fill(0, 102, 153);
  text("start", 25,85);
  
  textSize(26);
  strokeWeight(3);
  line(150,130,1050,130);
  line(150,770,1050,770);
  line(130,150,130,750);
  line(1070,150,1070,750);
  
  fill(0,0,255);
  rect(150,130,150,20);
  rect(450,130,150,20);
  fill(0);
  text("DELHI",180,100);
  text("BOMBAY",470,100);
  
  text("TERMINAL3",305,100);
  text("ROULETTE",610,100);

  fill(255,255,0);
  rect(750,130,150,20);
  rect(900,130,150,20);
  fill(0);
  text("JAIPUR",780,100);
  text("UDAIPUR",915,100);
  text("GOA",1100,100);
  
  fill(255,192,203);
  rect(1050,300,20,150);
  rect(1050,450,20,150);
  rect(1050,600,20,150);
  fill(0);
  textSize(26);
  text("HARYANA",1073,370);
  text("CHENNAI",1080,520);
  text("AJMER",1090,670);
  
  text("CHEST",1090,220);
  
  fill(0,255,0);
  rect(150,750,150,20);
  rect(300,750,150,20);
  rect(450,750,150,20);
  fill(0);
  text("SHIMLA",170,810);
  text("CHAIHAL",320,810);
  text("MANALI",470,810);
  
  text("ROULETTE",610,810);  
  
  fill(255,69,0);
  rect(750,750,150,20);
  rect(900,750,150,20);
  fill(0);
  text("JAMMU",780,810);
  text("KASHMIR",920,810);
  //text("AJMER",1090,670);
  
  fill(165,42,42);
  rect(130,150,20,150);
  rect(130,300,20,150);
  fill(0);
  text("LADAKH",15,230);
  text("ASSAM",20,380);
  //text("AJMER",1090,670);
    
   text("CHEST",20,530);
   //text("");
  
}//end of gameboarddraw function.


//FUNCTION 2
void propertyownerindicator()
{
  textSize(32);
  fill(0,0,255,40);
  rect(1200,0,400,height);

 // code for player 1
   if(c+1==1) 
    fill(255,0,0,63);
   else 
   noFill();
    rect(1200,0,400,200);
   fill(0);
   text("Net Worth: "+nf(p[0].networth,1,2)+"M",1220,40);
   text("Player1 (cash):",1220,80);
   String temp = nf(p[0].money,1,1)+"M$";
   //fill(0,50,0);
   text(temp,1450,80);
   textSize(32);
   text("Money in bank :"+p[c].depositmoney+"M",1220,120);
   
  if(p[0].bankloan!=0)
   text("Bank Loan "+p[0].bankloan+"M",1220,160);
   //textSize(40);
   
   stroke(0);
   strokeWeight(5);
   line(1200,200,1600,200);
   
 // code for player 2  
   if(c+1==2)
    fill(0,100,0,63);
   else
    noFill();
   rect(1200,200,400,200);
   fill(0);
   text("Net Worth: "+nf(p[1].networth,1,2)+"M",1220,240);
   text("Player 2",1220,280);
   temp = nf(p[1].money,1,1)+"M$";
   fill(0);
   text(temp,1400,280);
    //textSize(34);
   text("Money in bank: "+p[1].depositmoney+"M",1220,320); 
     if(p[1].bankloan!=0)
   text("Bank Loan "+p[1].bankloan+"M",1220,360);
   //textSize(40);
   
   stroke(0);
   strokeWeight(5);
   line(1200,400,1600,400);
   
   
 // code for palyer 3  
    if(c+1==3)
    fill(0,0,255,63);
   else
    noFill();
   rect(1200,400,400,200);
   fill(0);
   text("Net Worth: "+nf(p[2].networth,1,2)+"M",1220,440);
   text("Player 3",1220,480);
   temp = nf(p[2].money,1,1)+"M$";
   fill(0);
   text(temp,1400,480);
   text("Money in bank: "+p[2].depositmoney+"M",1220,520);  
    //textSize(34);
     if(p[2].bankloan!=0)
   text("Bank Loan "+p[2].bankloan+"M",1220,560);
   //textSize(40);
   
   stroke(0);
   strokeWeight(5);
   line(1200,600,1600,600);
   
  
 // code for player 4   
   if(c+1==4)
    fill(255,255,0,63);
   else
    noFill();
   rect(1200,600,400,200);
   fill(0);
   text("Net Worth: "+nf(p[3].networth,1,2)+"M",1220,640);
   text("Player 4",1220,680);
   temp = nf(p[3].money,1,1)+"M$";
   fill(0);
   text(temp,1400,680);
   text("Money in bank: "+p[3].depositmoney+"M",1220,720);
    //textSize(34);
     if(p[3].bankloan!=0)
   text("Bank Loan "+p[3].bankloan+"M",1220,760);
   //textSize(40);
   
 //code for bank  
   stroke(0);
   strokeWeight(5);
   line(1200,800,1600,800);
   
   text("Bank       "+b.money+"M",1220,870);
   
   
 
  
  //the following code is another way to go at it
  //********************************************************************************************
  // int n=50;
  //fill(0);
  //text("Player1",1250,100);
  // String temp = nf(p[0].money,2,1)+"M$";
  // fill(0,75,0);
  // textSize(35);
  //text(temp,1400,100);
  //for(int i=0;i<24;i++)
  //{
  // if(propertyowner[i]==1)
  // { 
  //   fill(0,0,255);
  //   textSize(26);
  //   text(propertyname.get(i),1260,100+n);
  //   //text("Property",1260,100+n);
  //   //text(i+1,1370,100+n);
  //   n=n+50;
  // }      
  //}
  // textSize(40);
  // fill(0);
   
   
  // text("Player2",1250,100+n);
  //  temp = nf(p[1].money,2,1)+"M$";
  // fill(0,75,0);
  // textSize(35);
  //text(temp,1400,100+n);
  // n=n+50;
  //  for(int i=0;i<24;i++)
  //{
  // if(propertyowner[i]==2)
  // { 
  //   fill(0,0,255);
  //   textSize(26);
  //   text(propertyname.get(i),1260,100+n);
  //   //text("Property",1260,100+n);
  //   //text(i+1,1370,100+n);
  //   n=n+50;
  // }      
  //}
  // textSize(40);
  // fill(0);
   
   
  // text("Player3",1250,100+n);
  //  temp = nf(p[2].money,2,1)+"M$";
  // fill(0,75,0);
  // textSize(35);
  //text(temp,1400,100+n);
  // n=n+50;
  //  for(int i=0;i<24;i++)
  //{
  // if(propertyowner[i]==3)
  // {
  //   fill(0,0,255);
  //   textSize(26);
  //   text(propertyname.get(i),1260,100+n);
  //   //text("Property",1260,100+n);
  //   //text(i+1,1370,100+n);
  //   n=n+50;
  // }      
  //}
  // textSize(40);
  // fill(0);
   
  // text("Player4",1250,100+n);
  //  temp = nf(p[3].money,2,1)+"M$";
  // fill(0,75,0);
  // textSize(35);
  //text(temp,1400,100+n);
  // n=n+50;
  //  for(int i=0;i<24;i++)
  //{
  // if(propertyowner[i]==4)
  // { 
  //   fill(0,0,255);
  //   textSize(26);
  //   text(propertyname.get(i),1260,100+n);
  //   //text("Property",1260,100+n);
  //   //text(i+1,1370,100+n);
  //   n=n+50;
  // }      
  //}
}
//---------------------------------------------------------------------------------------------------------------------------------------------------
// end of property indicator function

//void paint(int i)
//{
//  if(i==1)
//  {
//    rect(0,0,150,150);
//  }
  
//}
//FUNCTION 3
void dicebutton()
{
  textSize(36);
  if(e==0)
   noFill();
  else
   fill(0,100,0,120);
  rect(210,300,150,50);
  fill(0);
  text("ROLL",235,335);
}



//void keyPressed(){
//  if(key==ENTER)
//   {
    
//    dn=diceroll();
//    if(c==0)
//     p[0].move(dn);
//    if(c==1)
//     p[1].move(dn);
//    if(c==2)
//     p[2].move(dn);
//    if(c==3)
//     p[3].move(dn);
     
//     c++;
//     if(c>3)
//       c=0;
//   }
//}

//FUNCTION 4
int diceroll()
{
  int diceno=int(random(1,6));
  return diceno;
}

//--------------------------------------------------------------------------------------------------------------------------------------------------------------
//FUNCTION 5
void propertyshow(int c)
{
  int pos=0;
  textSize(50);
 fill(0); 
  switch(c)
  {
    case 0:
     pos=p[0].position;
     break;
    case 1:
     pos=p[1].position;
     break;
    case 2:
     pos=p[2].position;
     break;
    case 3:
     pos=p[3].position;
    //default:
    //  pos=1;
    //  break;
  }
  
  if(pr[pos-1].available==1 || pr[pos-1].available==0)
 {
   text("Property",760,520);
   text(pos,1000,520);
   text("value",760,600);
   text(pr[pos-1].value,890,600);
  
   // the following code is when property is available
  
   if(pr[pos-1].available==1)
   {
     noFill();
     rect(800,650,100,50);
     textSize(32);
     text("BUY",820,685);
   }
   else
   {
     fill(200);
     noStroke();
     rect(800,650,100,50);
     fill(0);
     text("SOLD",820,685);
   }
 }//end of if available = 0 or 1.
 
 if(pr[pos-1].available==2)
    text("START",800,600);
    
 //what to show when a player lands on roullete   
  if(pr[pos-1].available==5)
    {
    
      if(r.available==0)
      {
        fill(0);
        text("ROULETTE",770,600);
        noStroke();
        fill(200);
        rect(800,650,100,50);
      }else{
         fill(0);
        text("ROULETTE",770,600);
       noFill();
       rect(800,650,100,50);
       textSize(32);
       text("BUY",820,685);
      }  
   }
   
}
//end of propertyshow function
//---------------------------------------------------------------------------------------------------------------------------------------------------------
//FUNCTION 6
void playershow(int c)
{
  if(e==1 || e==0)
  {
   textSize(32);
   fill(0); 
   text("Player",780,200);
  
   text(c+1,910,200);
   text("Money",760,300);
   String temp = nf(p[c].money,2,2)+'M';
   text(temp,870,300);
  
   if(e==1)
   noFill();
   else if(e==0)
   fill(0,100,0,120);
   rect(800,350,200,50);
   fill(0);
   text("End Turn",820,390);
  }
  if(e==2)
  {
   showpayrentbutton(pr[p[c].position-1].currentrent);
   //println("yo sucker");
  }
}

//FUNCTION 7
void mousePressed()
{ 
 
  //for buy button
  //--------------------------------------------------------------------------------------------------------------------------------------------------------
  int pos1=p[c].position-1;
  
   if((mouseX>800 && mouseX<900) && (mouseY>650 && mouseY<700))
   {
     
     if(pr[pos1].available==1) //checking is property is a normal sellable property
     {
      if(p[c].money>pr[pos1].value)
      {
        p[c].money = p[c].money-pr[pos1].value;
        //p[c].properties[pos1-1]=1; 
        propertyowner[pos1]=c+1; // declaring the owner of this property as current player.
        pr[pos1].stockownedbyplayer[c]=100; // giving 100 percent stock of this property to the current player.
        pr[pos1].stockownedbyplayer[4]=0;   // snatching 100 percent stock of this property from bank.
        pr[pos1].value*=3; // as soon as the property is sold its value is immediately tripled.
       if(pr[pos1].is_for_sale==1)
         pr[pos1].available=0;
       
       pr[pos1].updatepropertyvalue();// updating the property value
       p[c].updatenetworth();// updating networth of the player
       p[c].updatecreditlimit();// updating the creditlimit of the player
      }else
        println("not enough balance left");
     }
     
    //if user lands on roullete then if he clicks on the buy button
     if(pr[pos1].available==5)
      {
         if(p[c].money>pr[pos1].value)
         {
          p[c].money = p[c].money-15;
          //p[c].properties[pos1-1]=1;
          propertyowner[pos1]=c+1;
          b.money+=15;
          r.available=0;
          e=0;
         }
      }
     
   }
  //else
  //{
  //  println("property not available");
  //  println(c);
  //}
 //-----------------------------------------------------------------------------------------------------------------------------------------------------------
  
  //dice roll code below
  //dice roll code below
  //dice roll code below
  if(e==1)
  {
   if((mouseX>210 && mouseX<360) && (mouseY>300 && mouseY<350))
   {
     e=0;
      
      dn=diceroll();
      
        p[c].move(dn);
       
      
       //code for rent deduction if player lands on
       //another player property
       int rent_receiver=propertyowner[p[c].position-1];
       if(rent_receiver!=-1)
       if(c!=rent_receiver-1) 
           e=2;          
       
       //code for roulette i.e (changing the value of e to 3)
       if(p[c].position==5 || p[c].position==16)
        {
       
           e=3;
        }      
      //if(c>3)aqq
      //  c=0; 
      
   }//end of roll button
  }//end of if e=1 
  
  
  //end turn button code
  //end turn button code
  //end turn button code
  if(e==0)
  {
   if((mouseX>850 && mouseX<1050) && (mouseY>350 && mouseY<400))
     {
         // adding simple interest to player loan after every round
        p[c].loanupdate();
        
      // updating the curernt value of property after each dice roll
        for(int i=0;i<24;i++)
         pr[i].updatepropertyvalue();
       
       //updating stock of each property
        for(int i=0;i<24;i++)
         pr[i].stock_update();
         
      // update credit value of player after every dice roll
        p[c].updatecreditlimit();
        
       // updating player networth after every dice roll'
        p[c].updatenetworth();
       
       e=1;
       if(c<4)
         c++;
       if(c>3)
        c=0;     
        
       println("end turn pressed");
     }
  }
 
    
   //pay rent button
    if(e==2)
    {
     if((mouseX>850 && mouseX<950) && (mouseY>350 && mouseY<400))
     {
       pr[p[c].position-1].rentfrequency++;
       rentbox(c,p[c].position);     
       rentpaid=1;
       e=0;
     }
    }
    
    //sliderbutton for betting money
    if((mouseX>800 && mouseX<1000) && (mouseY>190 && mouseY<210))
     {
       r.slider_p_of_betting_money=mouseX;
       r.bettingmoney= 0.25*(r.slider_p_of_betting_money-800);
     }
    
    //bet button  of roullete
    if(e==3)
    if((mouseX>800 && mouseX<925) && (mouseY>380 && mouseY<430))
    {
      if(propertyowner[4]!=c+1)
      {
       //r.rollball(-random(1,2));  
       //println("ball rolled");
       //println(r.velocity);
       e=4;
      }
      else
       popupbox.message("its your own property you cant play here",e,0);
    }
    
    //sliderbutton for choosing roulette no
    if((mouseX>220 && mouseX<442) && (mouseY>305 && mouseY<335))
     {
       r.slider_p_of_roullete_no=mouseX;
     }
     
     //when user has already pressed bet buttonand roullete popupbox for choosing a no or color is open
     if(e==4)
     {
       //play button for roullete when no is choosed
      if((mouseX>600 && mouseX<700) && (mouseY>290 && mouseY<340))
      {
        r.rollball(random(1,2));  
        e=3;
        r.f=1;
      }
      
     // play button for roullete when color is choosed 
      if((mouseX>600 && mouseX<700) && (mouseY>510 && mouseY<560))
      {
        r.rollball(-random(1,2));  
        e=3;
      }
      
     }
     
    //ok button of roullete popupbox telling the owner of roullete cannot bet on the roullete
    if((mouseX>880 && mouseX<990) && (mouseY>670 && mouseY<720))
     {
       if(e==20)
         e=popupbox.view;
     }
   
     //accept reward button after the outcome of roullete
     if(e==5)
      if((mouseX>450 && mouseX<610) && (mouseY>600 && mouseY<650))
       {
         p[c].money+=r.winningmoney;
         r.winningmoney=0;
         r.f=0;
         e=0; //taking the game control to end turn
       }
       
 
  // basically this is to open property onclick popupbox when user clicks on any property
   if(e==1 || e==0 || e==6)
   if(!((mouseX>150 && mouseX<1050) && (mouseY>150 && mouseY<750)) && mouseX<1200)
   {
     
       ppos = propertyposition(mouseX,mouseY);
     
      if(ppos!=25)
      if(e!=6) // ensuring that previous value of e does not become e=6 otherwise go back button wont work
       prev_value_of_e=e;
        e=6;
   }
   
   
   //go back button of property onclick popupbox
   if(e==6)
   if((mouseX>800 && mouseX<950) && (mouseY>400 && mouseY<450))
   {
     e=prev_value_of_e;
   }
   
   //trade button of property onclick popupbox
   if(e==6)
   if((mouseX>800 && mouseX<950) && (mouseY>200 && mouseY<250))
   {
     e=7;
   }
   
   if(e==6)
   if((mouseX>800 && mouseX<950) && (mouseY>300 && mouseY<350))
    e=14;
  
  // money offering slider for trading a property box when trading is possible at normal times
   if(e==7)
   if((mouseX>250 && mouseX<530) && (mouseY>435 && mouseY<465)) 
     pr[ppos-1].money_offering_slider=mouseX;
   
   // offer button 
    if(e==7)
    if((mouseX>330 && mouseX<430) && (mouseY>500 && mouseY<550))
       pr[ppos-1].offer_button_pressed=1;
    
   // accept button
    if(e==7) 
    if((mouseX>630 && mouseX<760) && (mouseY>500 && mouseY<550))
    if(pr[ppos-1].offer_button_pressed==1)
    {
      pr[ppos-1].offer_button_pressed=0;
      p[propertyowner[ppos-1]-1].money+=pr[ppos-1].offeramount;
      println("accept button pressed");
      p[c].money-=pr[ppos-1].offeramount;
      propertyowner[ppos-1]=c+1;
      e=6;  
    }
    
   //reject button 
   if(e==7) 
   if((mouseX>820 && mouseX<950) && (mouseY>500 && mouseY<550))
   if(pr[ppos-1].offer_button_pressed==1)
   {
     pr[ppos-1].offer_button_pressed=0;
     e=6;
   }
   
  // - button for subtrating hotels and homes on a property
   if(e==6)
   if((mouseX>230 && mouseX<260) && (mouseY>175 && mouseY<205))
   {
     println(propertyowner[ppos-1]);
    if(propertyowner[ppos-1]==c+1) 
    {
      p[c].updatenetworth();
      p[c].updatecreditlimit();
      pr[ppos-1].sub_hotel();
    }
   }
   
  // + button for adding hotels and homes on a property
  if(e==6)
  if((mouseX>680 && mouseX<710) && (mouseY>175 && mouseY<205))
  {
    println(propertyowner[ppos-1]);
   if(propertyowner[ppos-1]==c+1)
    {
      p[c].updatenetworth();
      p[c].updatecreditlimit();
      pr[ppos-1].add_hotel();      
    }
  }
  
  // slider for stockamount in MPSE 
  if(e==14)
  if((mouseX>250 && mouseX<450) && (mouseY>530 && mouseY<580))
   pr[ppos-1].sliderpforstockpercentage=mouseX;
  
  
   // ok button code of e=7 which is the tradebox
   if(e==7)
   if((mouseX>800 && mouseX<900)&&(mouseY>500 && mouseY<550))
     e=6;
  
  // buy button code of e=7 which is the tradebox which opens when you click trade button on propertyonlick popup box
    if(e==7)
    if(pr[ppos-1].tradebox_view==1)
    if((mouseX>300 && mouseX<400)&&(mouseY>500 && mouseY<550))
    {
      p[c].money-=15*pr[ppos-1].value;
      propertyowner[ppos-1]=c+1;
      e=6;
    }
    
    
    
   // if the user clicks on stock graph shown on the the propertyonclick popupbox function  
    //if(e==6)
    //if((mouseX>750 && mouseX<1000) && (mouseY>500 && mouseY<745))
    // e=8;
    
   // yes button of bankloan popupbox i.e e=9 
   if(e==9)
    if((mouseX>360 && mouseX<460) && (mouseY>590 && mouseY<640))
    {
      e=10;
    }   
   
  // no button of bankloan popupbox   
  if(e==9)
   if((mouseX>710 && mouseX<810) && (mouseY>590 && mouseY<640))
   {
     e=6;
   }
   
  // if player is in the bank box 
   if(e==10)
   {
    
   // back button in the bank box  
    if((mouseX>850 && mouseX<950) && (mouseY>230 && mouseY<280))
      e=6;
    
     // slider of normal bank loan
     if((mouseX>250 && mouseX<450) && (mouseY>320 && mouseY<360))
    {
     b.sliderpositionof_taking_bankloan=mouseX;
    }
    
     
   // slider of billionare bank loan 
    if((mouseX>250 && mouseX<450) && (mouseY>530 && mouseY<580))
     b.sliderpositionof_taking_bankloan_forB=mouseX;
    
  // apply loan button for normal bank loans
    if((mouseX>770 && mouseX<955) && (mouseY>320 && mouseY<370))
     {
       b.applyloanbuttonpressed=true;
       if(b.loanAmount>p[c].creditlimit)
         e=12;
       else
          e=11;
        
     }  
     
  // apply loan button for billionaire loans   
   if((mouseX>770 && mouseX<955) && (mouseY>530 && mouseY<580))
   {
     b.applyloanbuttonpressedforB=true;
     if(b.loanAmountForB>p[c].creditlimit) 
       e=12;
     else
      e=11;
   }
   
   
  // deposit money button  
   if((mouseX>725 && mouseX<965) && (mouseY>670 && mouseY<720))
      e=13;
      
  }// end of if e=10
   
  //ok button in loan rejected box  
  if(e==12)
   if((mouseX>760 && mouseX<860) && (mouseY>510 && mouseY<560))
   {
     b.applyloanbuttonpressed=false;
     b.applyloanbuttonpressedforB=false;
     e=10;
   }
   

  // e=11 means loan accepted box
   if(e==11)
   {
     // cancel button in loan accepted button 
     if((mouseX>280 && mouseX<400) && (mouseY>510 && mouseY<560))
     {
        b.applyloanbuttonpressed=false;
        b.applyloanbuttonpressedforB=false;
        e=10;
     }
     // take loan button when loan is accepted 
     if((mouseX>760 && mouseX<860) && (mouseY>510 && mouseY<560))
     {
      if(b.applyloanbuttonpressed) 
      {
        b.updatebankmoney(0);
        p[c].addloan(b.loanAmount);
        p[c].updatenetworth();
        p[c].updatecreditlimit();
        println(p[c].money);
      }
      else if(b.applyloanbuttonpressedforB)
      {
        b.updatebankmoney(1);
        p[c].addloan(b.loanAmountForB);
      } 
      e=10;
       b.applyloanbuttonpressed=false;
        b.applyloanbuttonpressedforB=false;
     }
    
   }// end of e=11
   
  // e=13 means deposit money box 
   if(e==13)
   {
    if((mouseX>250 && mouseX<450) && (mouseY>320 && mouseY<360))
    {
       b.sliderpfor_moneydeposit=mouseX;
    }
    
   // cancel button in the deposit money box 
    if((mouseX>260 && mouseX<390) && (mouseY>520 && mouseY<570)) 
    {
      e=10;
    }
    
   //deposit button in the deposit money box  
    if((mouseX>770 && mouseX<900) && (mouseY>520 && mouseY<570))
    {
     if(p[c].money>b.depositamount) 
      p[c].deposit(b.depositamount);
     else
      popupbox.message("you dont have enough money!",e,0);
    }
    
    
    
   }// end of e=13
   
   // bank section that comes below player sections on the right hand hand side of the screen
   if((mouseX>1200 && mouseX<1600) && (mouseY>800 && mouseY<900))
    e=10;
    
  // buy button in the MPSE   
  if(e==14)
  if((mouseX>700 && mouseX<800) && (mouseY>530 && mouseY<570)) 
   {
    if(propertyowner[ppos-1]!=-1)
    {
     // this if condition checks if bank stocks of that property is lesser than what player was asking for 
     if(pr[ppos-1].stockownedbyplayer[4]<pr[ppos-1].stockamount)
       popupbox.message("There are not enough public stocks available\n to buy for this property",6,0);
     
    // if player owns less money than the equivalent amount of stocks he wants to buy 
    else if(pr[ppos-1].shareprice*pr[ppos-1].stockamount>p[c].money)
       popupbox.message("You dont have enough money to buy the amount \nof stocks selected");
     else 
     {
       pr[ppos-1].stockownedbyplayer[c]+=pr[ppos-1].stockamount;
       println("player no is"+c);
       p[c].money-=pr[ppos-1].stockamount*pr[ppos-1].shareprice;
       String temp2 = "you bought "+pr[ppos-1].stockamount+"% of stocks worth "+nf(pr[ppos-1].stockamount*pr[ppos-1].shareprice,1,2)+"M";
       popupbox.message(temp2);
        
     }
    }else{
      popupbox.message("Sorry this property completely belongs to \nbank you cant own its stock",6,1);
    }
   }
   
   // sell button in MPSE
   if(e==14)
   if((mouseX>850 && mouseX<950) && (mouseY>530 && mouseY<570))
   {
      // if stocks owned by player is greater than stocks he is trying to sell
      if(pr[ppos-1].stockownedbyplayer[c]>pr[ppos-1].stockamount)   
      {
        p[c].money+=pr[ppos-1].stockamount*pr[ppos-1].shareprice;
        pr[ppos-1].stockownedbyplayer[c]-=pr[ppos-1].stockamount;
        pr[ppos-1].stockownedbyplayer[4]+=pr[ppos-1].stockamount;
        popupbox.message("you sold "+pr[ppos-1].stockamount+"% of stocks worth"+pr[ppos-1].stockamount*pr[ppos-1].shareprice+"M");
      }
      else
      {
        popupbox.message("looks like you are trying to sell more\n stocks than you own",6,1);
      }
   }
   
 // payloan button in bank box
  if(e==10)
  if((mouseX>250 && mouseX<400) && (mouseY>670 && mouseY<720))
    e=15;
    
 // slider in the pay loan box 
  if(e==15)
  if((mouseX>350 && mouseX<550) && (mouseY>320 && mouseY<360))
    b.sliderpfor_payingbankloan=mouseX;
   
 // pay loan button in the pay loan box-----------------------------------------------------------------------------------------------------
 if(e==15)
 if((mouseX>490 && mouseX<660) && (mouseY>450 && mouseY<500))
 {
   // if the payloanamount is greater than the loan player owns to the bank
   //**************************************************************************************************
   if(p[c].money>b.payloanamount)
   {
     if(b.payloanamount>p[c].bankloan)
      {
        
        p[c].money-=p[c].bankloan;
        p[c].bankloan=0;
        popupbox.message("All your loan is paid",10,1);
      }
      else{
        p[c].bankloan-=b.payloanamount;
        p[c].money-=b.payloanamount;
        popupbox.message("You have paid "+b.payloanamount+"M"+"to the bank");
      }     
  }//********************************************************************************************************
  else
  {
    popupbox.message("The loan amount you are trying to pay is greater than your cash",10,1);
  }
 }// pay loan button in the payloan box
 
 // cancel button in the pay loan box
 if(e==15)
 if((mouseX>490 && mouseX<660) && (mouseY>520 && mouseY<570))
   e=10;  
//-------------------------------------------------------------------------------------------------------------------------------------------------    
  
 if(e==10) 
 if((mouseX>485 && mouseX<635) && (mouseY>670 && mouseY<720))
  e=16;

// slider for withdrawing money in the withdrawbox
 if(e==16)
 if((mouseX>350 && mouseX<550) && (mouseY>320 && mouseY<360))
   b.sliderpfor_withdrawingmoney=mouseX;
 
 // withdraw button in the withdraw money box
 if(e==16)
 if((mouseX>490 && mouseX<660) && (mouseY>450 && mouseY<500))
 {
   if(b.withdrawamount<p[c].depositmoney)
   {
     p[c].money+=b.withdrawamount;
     p[c].depositmoney-=b.withdrawamount;
     popupbox.message("You have withdrawn "+b.withdrawamount+"M"+" from the bank",10,0);
   }
   else
    popupbox.message("You cannot withdraw more money than you\n own in the bank",10,0);
 }
 
 // cancel button in the withdraw money box
  if(e==16)
  if((mouseX>490 && mouseX<660) && (mouseY>520 && mouseY<570))
   e=10;
  
}//end of mouse pressed function

//FUNCTION 8
void rentbox(int playerno,int propertyposition)

{
  //println("testing");
 
    int n=propertyowner[propertyposition-1];
  
     p[playerno].money -= pr[propertyposition-1].currentrent;
     println("player money inside rentbox");
     println(p[playerno].money);
     println(n);

   // this code part to make sure that every player gets the rent according to the stockthey own of that property  
     for(int i=0;i<4;i++)
       if(pr[propertyposition-1].stockownedbyplayer[i]>0)
        p[i].money+=pr[propertyposition-1].currentrent*pr[propertyposition-1].stockownedbyplayer[i]*0.01;  
       
   // this code part ensures that if the stock owned by bank is greater than zero the bank gets his fair share of rent    
    if(pr[propertyposition-1].stockownedbyplayer[4]>0)
      b.money+=pr[propertyposition-1].stockownedbyplayer[4]*pr[propertyposition-1].currentrent;
    
  // updating the networth of each player after the payment of rent.  
      for(int i=0;i<4;i++)
       p[c].updatenetworth();
     
}
//FUNCTION 9
void showpayrentbutton(float rent)
{
  //fill(255,0,0);
  //rect(300,300,100,50);
  
    textSize(40);
   fill(0); 
   text("PAY RENT",760,200);
  
   text("RENT",760,300);
   String temp = nf(rent,2,2)+"M$";
   text(temp,870,300);
   
   fill(255,0,0);
   rect(800,350,100,50);
   fill(0);
   text("Pay",810,390); 
}
//FUNCTION 10
void paint_properties()
{
  //println("the function paint_properties is being called");
  for(int i=0;i<24;i++)
  {
   if(propertyowner[i]!=-1)
    {
      switch(propertyowner[i])
      {
       case 1:
       fill(255,0,0,63);
       break;
       
       case 2:
       fill(0,255,0,63);
       break;
       
       case 3:
       fill(0,0,255,63);
       break;
       
       case 4:
       fill(255,255,0,63);
       break;
       
       default:
        noFill();
        break;
      }//end of switch
    }else
      noFill();
      
     //noStroke();
    if(i+1>=1 && i+1<9)
     rect(150*(i),0,150,150);
      //println(propertyowner[i]);
      
    if(i+1>=9 && i+1<14)
     rect(1050,150*((i+1)-8),150,150);
     
    if(i+1>=14 && i+1<21)
      rect(1200-(i+2-13)*150,750,150,150);
      
    if(i+1>=21 && i+1<=24)
     rect(0,height-(i+2-20)*150,150,150);
    

  }//end of for loop
}

void showhotel()
{
   
}

//calculating property position function  with given mouse coordinates 
//---------------------------------------------------------------------------------------------------------------------------------------------------------
int propertyposition(int x,int y)
{
   int position =25; 
  for(int i=0;i<=8;i++)
     if( (x>i*150 && x<150*(i+1)) && (y>0 && y<150) )
     {
        position= i+1;
        break;
     }
   
   for(int i=0;i<=5;i++)
     if( (x>1050 && x<1200) && (y>i*150 && y<(i+1)*150) )
     {
       position= i+8;
       break;
     }
     
   for(int i=0;i<=7;i++)
     if( (x>(1200-150*(i+1)) && x<(1200-150*i) ) && (y>750 && y<900) )
     {
       position= i+13;
       break;
     }
     
   for(int i=0;i<=4;i++)
    if((x>0 && x<150) && (y>height-(i+1)*150 && y<height-i*150) )
    {
      position= i+20;
      break;
    }
     
   
    return position;
 
}
//end of propertyposition
//-----------------------------------------------------------------------------------------------------------------------------------------------------------
