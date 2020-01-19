class property
{
  float value,rent;
  int available;
  int is_for_sale;
  int propertyno;
  int money_offering_slider;
  int offer_button_pressed;
  float offeramount;
  int home,hotel;
  float cost_of_home,cost_of_hotel;
  float sellprice_of_home,sellprice_of_hotel;
  float currentrent;
  int tradebox_view;
  int r=49;
  int r2=0;
  float stockp=0;
  int sliderpforstockpercentage=250;
  float stockamount=0;
  float shareprice=1;
  float currentvalue;
  float rentfrequency=0;
  
  float[] stockownedbyplayer = new float[5];
  float[] stock = new float[300];
  float[] stockprice = new float[50];
  
  property(float v,int flag,float rent,int propertyno)
  {
    value=v;
    available=flag;
    this.rent =rent;
    is_for_sale=1;
    this.propertyno=propertyno;
    money_offering_slider=250;
    offer_button_pressed=0;
    offeramount=0;
    home=0;
    hotel=0;
    cost_of_hotel=25*rent;
    cost_of_home=5*rent;
    sellprice_of_home=3*rent;
    sellprice_of_hotel=20*rent;
    currentrent=rent;
    tradebox_view=0;
    stockownedbyplayer[4]=100;
    currentvalue=value;
  
    for(int i=0;i<50;i++)
    {
      stockprice[i]=0;
      stock[i]=0;
    }
    for(int i=50;i<300;i++)
     stock[i]=0;
     
     r2=0;
  }
  
 // code for property onclick popupbox
 //--------------------------------------------------------------------------------------------------------------------------------------------------
  void property_onclick_popupbox()
  {
    fill(240,240,240,240);
    rect(200,155,800,590);

  // code for drawing the negative sign on the property onlcick popupbox
  if(propertyowner[ppos-1]==c+1)
  {
     strokeWeight(5);
   if((mouseX>230 && mouseX<260) && (mouseY>175 && mouseY<205))
   stroke(200,0,0);
   else
    stroke(0);
    line(230,190,260,190);
  }
  
  // code for drawing the positive sign on the property onclick popupbox
  if(propertyowner[ppos-1]==c+1)
  {
    strokeWeight(5);
    if((mouseX>680 && mouseX<710) && (mouseY>175 && mouseY<205))
     stroke(0,200,0);
    else
     stroke(0);
    line(680,190,710,190);
    line(695,175,695,205);
  }
  
    fill(0);
    textSize(40);
    text(propertyname.get(propertyno-1),395,200); 
    
    textSize(30);
    text("rent",230,250);
    text(nf(currentrent,1,2)+"M",610,250);
    
    text("With 1 home",230,300);
    text(nf(rent*2,1,2)+"M",610,300);
    
    text("With 2 home",230,350);
    text(nf(rent*4,1,2)+"M",610,350);
    
    text("With 3 home",230,400);
    text(nf(rent*8,1,2)+"M",610,400);
    
    text("With 4 home",230,450);
    text(nf(rent*14,1,2)+"M",610,450);
    
    text("With 1 hotel",230,500);
    text(nf(rent*18,1,2)+"M",610,500);
    
    text("With 2 hotel",230,550);
    text(nf(rent*26,1,2)+"M",610,550);
    
    text("With 3 hotel",230,600);
    text(nf(rent*34,1,2)+"M",610,600);
    
    
    //text("With 4 hotel",230,650);
    text("------------------------------",210,630);
    text("cost of home",230,680);
    text(nf(rent*5,1,2)+"M",610,680);
    text("cost of hotel",230,730);
    text(nf(rent*25,1,2)+"M",610,730);
   
   //seperating line between right and left hand side of the property_onclick_popupbox
    stroke(5);
    line(750,155,750,745);
    
 //if(propertyowner[propertyno]!=(c+1) && propertyowner[propertyno]!=-1) // to ensure trade button only shows where trading is possible
 // {
    if((mouseX>800 && mouseX<950) && (mouseY>200 && mouseY<250))
     fill(200);
    else
     noFill();
    rect(800,200,150,50);
     fill(0);
    text("Trade",835,235);
   //}
    
    if((mouseX>800 && mouseX<950) && (mouseY>300 && mouseY<350))
     fill(200);
    else
     noFill();
    rect(800,300,150,50);
    fill(0);
    text("Stock",835,335);
    
    
    if((mouseX>800 && mouseX<950) && (mouseY>400 && mouseY<450))
     fill(200);
    else
     noFill();
    rect(800,400,150,50);
     fill(0);
    text("Go Back",820,435);
    
  //seperating line between the trading stock and go back buttons and the stock graph
  //i.e seperating line between the top half and bottom half of the right hand hand side 
  //of the property_onlclick_popupbox
    stroke(0); 
   strokeWeight(3);
   line(750,500,1000,500);
   
 // code for showing stocks graphically
    show_stocks();
    
    e=6;
  }  
// end of property onclick popupbox        
//------------------------------------------------------------------------------------------------------------------------------------------------------------  

void tradingbox()
{
  //drawing the overall popupbox of trading
   fill(240,240,240,240);
   rect(200,205,800,400);
  
  // if the property can be traded normally
   if(propertyowner[propertyno-1]!=(c+1) && propertyowner[propertyno-1]!=-1)
   {
     tradebox_view=0;
     if(offer_button_pressed==0)
    {
     textSize(30);
     fill(0);
     text("offered by player",220,250);
     text(c+1,500,250);
     
     text(nf((money_offering_slider-250)/2,1,2)+"M",300,300);
     offeramount= (money_offering_slider-250)/2;
     
     //slider code for offering a amount for a given property owned by some other player
     strokeWeight(5);
     line(250,450,530,450);//line is 280 pixels long
     fill(255,0,0);
     rect(money_offering_slider,435,10,30);
     
     //offer button
    if((mouseX>330 && mouseX<430) && (mouseY>500 && mouseY<550))
     fill(200);
    else
     noFill();
     rect(330,500,100,50);
     fill(0);
     text("Offer",340,540);
    }
    else
    {
      fill(0);
      textSize(32);
      text("player "+(c+1)+" offered"+"\n         "+offeramount+"M",250,300);
      textSize(30);
    }
    
     //seperating lines between offerer and receiver
     strokeWeight(5);
     line(600,205,600,605);
     
    //right hand side of the separating line of trading box under normal trading condition*****************
    text("offered to player",620,250);
    text(propertyowner[propertyno-1]+" for",870,250);
 
   // accept button
   if((mouseX>630 && mouseX<760) && (mouseY>500 && mouseY<550))
    fill(200);
   else
    noFill();
    rect(630,500,130,50);
    fill(0);
    text("Accept",640,535);
    
   //reject button
   if((mouseX>820 && mouseX<950) && (mouseY>500 && mouseY<550))
    fill(200);
   else
    noFill();
    rect(820,500,130,50);
    fill(0);
    text("Reject",835,535);
   
     
     
   }
   else if(propertyowner[propertyno-1]==c+1)
   {
     tradebox_view=2;
      fill(0);
     textSize(32); 
     text("No kidding! \nthis property belongs to you ",230,250);
   
     
   // ok button code of e=7 which is the tradebox
    if((mouseX>800 && mouseX<900)&&(mouseY>500 && mouseY<550))
     fill(200);
    else
     noFill();
     rect(800,500,100,50);
     fill(0);
     text("OK",825,535);
     
   }
   else
   {
     tradebox_view=1;
     fill(0);
     textSize(32); 
     text("Sorry this property belongs to bank you cant \ntrade it for normal rate",230,250);
   
     
   // ok button code of e=7 which is the tradebox
    if((mouseX>800 && mouseX<900)&&(mouseY>500 && mouseY<550))
     fill(200);
    else
     noFill();
     rect(800,500,100,50);
     fill(0);
     text("OK",825,535);
     
   // buy button code of e=7 which is the tradebox
    if((mouseX>300 && mouseX<400)&&(mouseY>500 && mouseY<550))
     fill(200);
    else
     noFill();
     rect(300,500,100,50);
      fill(0);
     text("BUY",320,535);
   }
   
}//end of trade box

void add_hotel()
{
 if(p[c].money>0)
 {
  if(home<6)
  {
   home++;
   p[c].money-=cost_of_home;
   currentrent=2*rent*pow(1.5,home);
  }
  else if(home==6 && hotel<6)
  {
   p[c].money-=cost_of_home;
   hotel++;
   currentrent=1.5*rent*pow(1.5,hotel)*10;
  }
 }else{
   // this code will run when a person wants to
   // buy hotels or homes and does not have enough money
   e=9;
   
 }
 
}
// end of add hotel function
//------------------------------------------------------------------------------------------------------------------------------------
void sub_hotel()
{
   if(hotel>0)
   {
    hotel--;
    p[c].money+=sellprice_of_hotel;
   }
   else if(home>0)
   {
    home--;
    p[c].money+=sellprice_of_home;
   }
    
}



//start of draw hotels
//-------------------------------------------------------------------------------------------------------------------------------------------------
void draw_hotels()
{
 // condition for when there are no hotels and only homes  
 if(home>0 && hotel==0)
 {
  // for property 1 to 8 
  if(propertyno<=8)
   if(is_for_sale==1)
  { 
   fill(0);
    for(int i=1;i<=home;i++)
    {
     int x=150*(propertyno-1)+5+15*(i-1);
     rect(x,10,10,20);
    }
  }
  
 // for property 9 to 13 
  if(propertyno>8 && propertyno<=13)
  if(is_for_sale==1)
  {
    fill(0);
    for(int i=1;i<=home;i++)
    {
     int x=1055+15*(i-1);
     int y=150*(propertyno-8)+10;
     rect(x,y,10,20);
    }
  }
  
  // for propertyno 13 to 20
  
  if(propertyno>13 && propertyno<=20)
  if(is_for_sale==1)
  {
    fill(0);
    for(int i=1;i<=home;i++)
    {
     int x=1205-150*(propertyno-12)+15*(i-1);
     int y=height-25;
     rect(x,y,10,20);
    }
  }
  
  // for property no 21 to 24
  
  if(propertyno>20 && propertyno<=24)
  if(is_for_sale==1)
  {
    fill(0);
    for(int i=1;i<=home;i++)
    {
     int x=5+15*(i-1);
     int y=height-150*(propertyno-19)+10;
     rect(x,y,10,20);
    }
  }
  
  
 }//checking if we want draw hotels
 else if(hotel>0)
 {
  
   fill(255,0,0);
  if(propertyno<=8)
  if(is_for_sale==1)
   for(int i=1;i<=hotel;i++)
   {
     int x=150*(propertyno-1)+5+15*(i-1);
     rect(x,10,10,20);
   }
   
  if(propertyno>8 && propertyno<=13)
  if(is_for_sale==1)
  {
    for(int i=1;i<=hotel;i++)
    {
     int x=1055+15*(i-1);
     int y=150*(propertyno-8)+10;
     rect(x,y,10,20);
    }
  }  
  
   // for propertyno 13 to 20
  
  if(propertyno>13 && propertyno<=20)
  if(is_for_sale==1)
  {
    fill(0);
    for(int i=1;i<=hotel;i++)
    {
     int x=1205-150*(propertyno-12)+15*(i-1);
     int y=height-25;
     rect(x,y,10,20);
    }
  }
  
  // for property no 21 to 24
  
  if(propertyno>20 && propertyno<=24)
  if(is_for_sale==1)
  {
    fill(0);
    for(int i=1;i<=hotel;i++)
    {
     int x=5+15*(i-1);
     int y=height-150*(propertyno-19)+10;
     rect(x,y,10,20);
    }
  }
  
  
 }//end of else i.e drawing hotels
 
}//end of draw hotels
//--------------------------------------------------------------------------------------------------------------------------------------------------
//end of draw_hotels functions

void show_stocks()
{
 if((mouseX>750 && mouseX<1000) && (mouseY>500 && mouseY<745))
  fill(255,255,0,120);
 else
  noFill();
  rect(750,500,250,245);
  
  stroke(0,0,255);
  for(int i=0;i<49;i++)
   line(750+5*i,730-stockprice[i]*10,750+5*(i+1),730-stockprice[i+1]*10);
}

void stock_update()
{
  stockprice[r]=-random(0,1)+random(0,5);;
  if(r>0)
   r--;
  else if(r==0)
   r=49;
   
   stock[r2]=stockprice[r];
   if(r2<299)
    r2++;
    
    //println(stock[r2]);
}
void show_detailedstocks()
{
  
  // height of this box is 520 px
  //width if this box is 600 px
   strokeWeight(5);
   fill(240,240,240,240);
   rect(300,180,600,520);
   
   for(int i=1;i<=17;i++)
   {
     line(290,180+i*30,310,180+i*30);
     fill(0);
     textSize(20);
     text(30*(17-i),255,180+i*30+10);
   }
   
   for(int i=1;i<20;i++)
   {
     line(300+30*i,690,300+30*i,710);
   }
   
   stroke(0,0,255);
   strokeWeight(3);
   for(int i=48;i>0;i--)
   {
     line(300+5*i,700-stockprice[i]*5,300+5*(i+1),700-stockprice[i+1]*5);
     //println(stock[i]);
   }
   
}

// monopoly stock exchange market
void tradestockbox()
{
  fill(240,240,240,240);
  rect(200,180,800,550);
  textSize(36);
  fill(0);
  text("Monopoly Stock Exchange",350,220);
  textSize(32);
  text("Player 1 owns "+stockownedbyplayer[0]+"% of stocks",220,270);
  text("Player 2 owns "+stockownedbyplayer[1]+"% of stocks",220,310);
  text("Player 3 owns "+stockownedbyplayer[2]+"% of stocks",220,350);
  text("Player 4 owns "+stockownedbyplayer[3]+"% of stocks",220,390);
  text("BANK owns "+stockownedbyplayer[4]+"% of stocks",220,430);
  
   // drawing a blank rectangle 
   noFill();
   rect(250,530,200,40);
   
  // drawing a red rectangle over the blank rectangle  
   fill(255,0,0);
   rect(250,530,sliderpforstockpercentage-250,40);
   
  // drawing the slider 
   fill(0,0,255);
   rect(sliderpforstockpercentage,530,10,40);
  
  fill(0);
  text((sliderpforstockpercentage-250)/2+"%",500,555);
  stockamount=(sliderpforstockpercentage-250)/2;
  
 // buy stocks button in the MPSE
 if((mouseX>700 && mouseX<800) && (mouseY>530 && mouseY<570)) 
  fill(200);
 else
  noFill();
  rect(700,530,100,40);
  fill(0);
  text("BUY",710,560);
  
 // sell stock button in the MPSE 
 if((mouseX>850 && mouseX<950) && (mouseY>530 && mouseY<570)) 
  fill(200);
 else
  noFill();
  rect(850,530,100,40);
  fill(0);
  text("SELL",860,560); 
}
// end of monopoly stock exchange

void updatepropertyvalue()
{
  currentvalue=value;
  currentvalue+=currentrent*3+rentfrequency*5;
  sharepriceupdate();
}
void sharepriceupdate()
{
  shareprice=(currentvalue/100);
}

}// end of property class
