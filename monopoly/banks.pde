class bank
{
  float money;
  int sliderpositionof_taking_bankloan;
  int sliderpositionof_taking_bankloan_forB;
  float loanAmount;
  float loanAmountForB;
  boolean applyloanbuttonpressed;
  boolean applyloanbuttonpressedforB;
  int sliderpfor_moneydeposit;
  float depositamount;
  int sliderpfor_payingbankloan;
  float payloanamount;
  int sliderpfor_withdrawingmoney;
  float withdrawamount;
  bank(float money)
  {
    this.money=money;
    sliderpositionof_taking_bankloan=250;
    sliderpositionof_taking_bankloan_forB=250;
    loanAmount=0;
    loanAmountForB=0;
    applyloanbuttonpressed=false;
    applyloanbuttonpressedforB=false;
    sliderpfor_moneydeposit=250;
    depositamount=0;
    sliderpfor_payingbankloan=350;
    payloanamount=0;
    sliderpfor_withdrawingmoney=350;
    withdrawamount=0;
  }
  
  
  void showbankloan_popupbox()
 {
   fill(240,240,240,240); 
   rect(300,200,600,500);
   
   textSize(32);
   fill(0);
   text("You dont have enough money to\n buy any more assets do you \nrequire a bank loan",320,240);
   
  // yes button of e=9 box i.e do you want a bank loan box 
   if((mouseX>360 && mouseX<460) && (mouseY>590 && mouseY<640))
    fill(200);
   else
    noFill();
    rect(360,590,100,50);
    fill(0);
    text("YES",380,630);
   
  // no button of e=9 box i.e do you want a bank loan box 
   if((mouseX>710 && mouseX<810) && (mouseY>590 && mouseY<640))
    fill(200);
   else
    noFill();
    rect(710,590,100,50);
    fill(0);
    text("NO",730,630);
 }
 
 void showbank()
 {
   fill(240,240,240,240);
   rect(180,155,800,590);
   
   textSize(36);
   fill(0);
   text("BANK",500,200);
   
   textSize(32);
  if((mouseX>850 && mouseX<950) && (mouseY>230 && mouseY<280))
   fill(200);
  else
   noFill();
   rect(850,230,100,50);
   fill(0);
   text("Back",860,265);
   
   textSize(32);
   fill(0);
   text("Your bank credit limit is",250,280);
   text(p[c].creditlimit+"M",640,280);
   
  // drawing a blank rectangle 
   noFill();
   rect(250,320,200,40);
   
  // drawing a red rectangle over the blank rectangle  
   fill(255,0,0);
   rect(250,320,sliderpositionof_taking_bankloan-250,40);
   
  // drawing the slider 
   fill(0,0,255);
   rect(sliderpositionof_taking_bankloan,320,10,40);
   
   fill(0);
   text((sliderpositionof_taking_bankloan-250)/2+"M",500,360);
   loanAmount=(sliderpositionof_taking_bankloan-250)/2;
   
   
  // apply loan button in the bank display box for normal loans
  if((mouseX>770 && mouseX<955) && (mouseY>320 && mouseY<370))
   fill(200);
  else
   noFill();
   rect(770,320,185,50);
   fill(0);
   text("Apply Loan",775,355);
   
  //bank for billionares subsection inside the bankshow function
  //#########################################################################################################
   text("Bank for Billionaires ",215,450);
   textSize(25);
   text("(for people with credit limit>100 M)",530,450);
   
   textSize(32);
   // drawing a blank rectangle 
   noFill();
   rect(250,530,200,40);
   
  // drawing a red rectangle over the blank rectangle  
   fill(255,0,0);
   rect(250,530,sliderpositionof_taking_bankloan_forB-250,40);
   
  // drawing the slider 
   fill(0,0,255);
   rect(sliderpositionof_taking_bankloan_forB,530,10,40);
   
   fill(0);
   text((sliderpositionof_taking_bankloan_forB-250)*6+"M",500,560);
   loanAmountForB=(sliderpositionof_taking_bankloan_forB-250)*6;
   
  if((mouseX>770 && mouseX<955) && (mouseY>530 && mouseY<580))
   fill(200);
  else
   noFill();
   rect(770,530,185,50);
   fill(0);
   text("Apply Loan",775,565);
 //##############################################################################################################################  
   
 // pay loan button  
  if((mouseX>250 && mouseX<400) && (mouseY>670 && mouseY<720))
   fill(200);
  else
   noFill();
   rect(250,670,150,50);
   fill(0);
   text("Pay Loan",255,705);
   
 // deposit money button  
  if((mouseX>725 && mouseX<965) && (mouseY>670 && mouseY<720)) 
   fill(200);
  else
   noFill();
   rect(725,670,240,50);
   fill(0);
   text("Deposit Money",730,705);
  
  // withdraw button 
  if((mouseX>485 && mouseX<635) && (mouseY>670 && mouseY<720)) 
   fill(200);
  else
   noFill();
   rect(485,670,170,50);
   fill(0);
   text("Withdraw",498,705);
 }

 
 // showbankreject your loan box function
 void showbankreject_yourloan_box()
 {
   fill(240,240,240);
   rect(230,200,700,400);
   textSize(40);
   fill(0);
   text("Loan Rejected",390,240);
    
   textSize(32);
   
  if(applyloanbuttonpressed) 
  {
    fill(0);
    if(loanAmount>p[c].creditlimit)
     text("Your credit limit is "+p[c].creditlimit+"M"+" you cannot ask \n for a loan greater than that.",240,300);
  }
  else if(applyloanbuttonpressedforB)
  {
    fill(0);
    if( p[c].creditlimit<loanAmountForB && p[c].creditlimit>=100)
     text("Your credit limit is "+p[c].creditlimit+"M"+" you cannot ask \n for a loan greater than that.",240,300);
    else if(p[c].creditlimit<100)
      text("You are not eligible for this line of credit \n you creditlimit should be greater than 100m,",240,300);
     
  }
  
  if((mouseX>760 && mouseX<860) && (mouseY>510 && mouseY<560))
   fill(200);
  else
   noFill();
   rect(760,510,100,50);
   fill(0);
   text("OK",780,545);
 }
 
// the following function is e=12 
 void loanacceptedbox()
 {
    fill(240,240,240);
   rect(230,200,700,400);
   textSize(40);
   fill(0);
   text("Loan Accepted",390,240);
   textSize(32);
   text("You are taking a loan of "+loanAmount+"M"+"\n Your interest rate per dice roll is "+nf(loanAmount*0.05,1,2)+"M",240,300);
   
  // cancel button when loan is accepted 
  if((mouseX>280 && mouseX<400) && (mouseY>510 && mouseY<560)) 
   fill(200);
  else
   noFill();
   rect(280,510,120,50);
   fill(0);
   text("Cancel",290,545);
   
  // take button when loan is accepted  
  if((mouseX>760 && mouseX<860) && (mouseY>510 && mouseY<560))
   fill(200);
  else
   noFill();
   rect(760,510,100,50);
   fill(0);
   text("Take",780,545);
 }
 
 void updatebankmoney(int whichloan)
 {
   if(whichloan==0)
    money-=loanAmount;
   else if(whichloan==1)
    money-=loanAmountForB;
 }
 
 void depositmoneybox()
 {
   fill(240,240,240);
   rect(230,200,700,400);
   textSize(40);
   fill(0);
   text("Deposit Money",390,240);
   
 // drawing a blank rectangle 
   noFill();
   rect(250,320,200,40);
   
  // drawing a red rectangle over the blank rectangle  
   fill(255,0,0);
   rect(250,320,sliderpfor_moneydeposit-250,40);
   
  // drawing the slider 
   fill(0,0,255);
   rect(sliderpfor_moneydeposit,320,10,40);
   fill(0);
   text((sliderpfor_moneydeposit-250)*5+"M",500,360);
   depositamount=(sliderpfor_moneydeposit-250)*5;
   textSize(30);
   text("For each dice roll you will get a simple interest \nof 3% on yout money",250,400);
   
 // deposit button in the deposit money in the bank box  
  if((mouseX>770 && mouseX<900) && (mouseY>520 && mouseY<570))
   fill(200);
  else
   noFill();
   rect(770,520,130,50);
   fill(0);
   text("Deposit",780,555);
   
 // cancel button in the deposit money in bank box  
  if((mouseX>260 && mouseX<390) && (mouseY>520 && mouseY<570)) 
   fill(200);
  else
   noFill();
   rect(260,520,130,50);
   fill(0);
   text("Cancel",270,555);
     
 }
 //-----------------------------------------------------------------------------------------------------------------------------------
 void paybankloanbox()
 {
   fill(240,240,240);
   rect(230,200,700,400);
   textSize(40);
   fill(0);
   text("Pay Bank Loan",390,240);
   
   
 // drawing a blank rectangle 
   noFill();
   rect(350,320,200,40);
   
  // drawing a red rectangle over the blank rectangle  
   fill(255,0,0);
   rect(350,320,sliderpfor_payingbankloan-350,40);
   
  // drawing the slider bankloan
   fill(0,0,255);
   rect(sliderpfor_payingbankloan,320,10,40);
   fill(0);
   text((sliderpfor_payingbankloan-350)*5+"M",600,360);
   payloanamount=(sliderpfor_payingbankloan-350)*5;
   
 // Payloan button inside payloan section of the bank  
  if((mouseX>490 && mouseX<660) && (mouseY>450 && mouseY<500))
   fill(200);
  else
   noFill();
   rect(490,450,170,50);
   fill(0);
   textSize(36);
   text("Pay Loan",500,485);
   
  // cancel button in the payloan section of the bank 
  if((mouseX>490 && mouseX<660) && (mouseY>520 && mouseY<570))
   fill(200);
  else
   noFill();
   rect(490,520,170,50);
   fill(0);
   text("Cancel",515,555);
 }
 //--------------------------------------------------------------------------------------------------------------------------------------------
 void withdrawmoney()
 {
   fill(240,240,240);
   rect(230,200,700,400);
   textSize(40);
   fill(0);
   text("Pay Bank Loan",390,240);
   
   
 // drawing a blank rectangle 
   noFill();
   rect(350,320,200,40);
   
  // drawing a red rectangle over the blank rectangle  
   fill(255,0,0);
   rect(350,320,sliderpfor_withdrawingmoney-350,40);
   
  // drawing the withdraw money slider  
   fill(0,0,255);
   rect(sliderpfor_withdrawingmoney,320,10,40);
   fill(0);
   text((sliderpfor_withdrawingmoney-350)*5+"M",600,360);
   withdrawamount=(sliderpfor_withdrawingmoney-350)*5;
   
 // Withdraw button inside payloan section of the bank  
  if((mouseX>490 && mouseX<660) && (mouseY>450 && mouseY<500))
   fill(200);
  else
   noFill();
   rect(490,450,170,50);
   fill(0);
   textSize(36);
   text("Withdraw",500,485);
   
  // cancel button in the withdraw section of the bank 
  if((mouseX>490 && mouseX<660) && (mouseY>520 && mouseY<570))
   fill(200);
  else
   noFill();
   rect(490,520,170,50);
   fill(0);
   text("Cancel",515,555);
 }
 
}// end of bank class
