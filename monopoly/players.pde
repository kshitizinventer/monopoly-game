class player
{
  float money;
  int id,positionx,positiony;
  int position;
  float creditlimit;
  float bankloan=0;
  float depositmoney=0;
  float networth=60;
  float assetvalue=0;
  //int properties[]= new int[24];
  
  player(int idi,int px,int py,float m)
  {
    id=idi;
    positionx=px;
    positiony=py;
    position=1;
    money=m;
    creditlimit=30;
  }
  
  void show()
  {
    if(id==1)
    fill(255,0,0);
    if(id==2)
    fill(0,255,0);
    if(id==3)
    fill(0,0,255);
    if(id==4)
    fill(255,255,0);
    ellipse(positionx,positiony,20,20);
  }
  
  void move(int no)
  {  
     //position=position+no;
     //if(position<900)
     //{
     //  positionx=position;
     //  positiony=30;
     //}
     //if(position>1200 &&  position<1680)
     //{
     //  positionx=1080;
     //  positiony=positiony+position-780;
     //}
     //if(position>1530 && position<2430)
     //{
     // positionx=width-(position-1530)-30;
     // positiony=770;
     //}
     //if(position>2280 && position<3180)
     //{
     //  positionx=30;
     //  positiony=height-(position-2280);
     //}
     //if(po7sition>3180)
     // position=0;
     
     position=position+no;
     
     if(position>24)
      {
        position=position-24;
      }
      
     // for position between 1 and 9 
     if(position>=1 && position<9)
      {
        positionx=(position-1)*150+30;
        int count=0;  
        positiony=30;
        for(int x=0;x<4;x++)
          if(p[id-1].position==p[x].position && x!=(id-1))
          count++;
         if(count==1)
           positiony=70;
         else if(count==2)
          positionx=positionx+30;
        
      }
     // for position between 9 and 14 
      if(position>=9 && position<14)
      {
        positionx=1090;
        positiony=(position-8)*150+30;
        
        int count=0;
        for(int x=0;x<4;x++)
          if(p[id-1].position==p[x].position && x!=(id-1))
           count++;
           
          if(count==1)
           positionx=1140;
          else if(count==2)
           positiony+=40;
      }
      
      if(position>=14 && position<21)
       {
         positionx=1200-(position-13)*150-30;
         positiony=height-30;
         
         int count=0;
         for(int x=0;x<4;x++)
          if(p[id-1].position==p[x].position && x!=(id-1))
           count++;
           
          if(count==1)
           positiony=height-70;
          else if(count==2)
            positionx+=40;
       }
       
       
       if(position>=21 && position<=25)
       {
         positionx=30;
         positiony=height-(position-20)*150-30;
         
         for(int x=0;x<4;x++)
          if(p[id-1].position==p[x].position && x!=(id-1))
          positionx=70;
       }
  }
  
  void addloan(float loanamount)
  {
     p[c].money+=loanamount;
     bankloan+=loanamount;
  }
  
  void loanupdate()
  {
   bankloan+=bankloan*0.05;
  }
  
  void deposit(float depositmoney)
  {
    p[c].money-=depositmoney;
    this.depositmoney=depositmoney;
  }
  
  float  totalAssetvalue()
  {
    assetvalue=0;
    
    for(int i=0;i<24;i++)
     if(propertyowner[i]==id)
       assetvalue+=pr[i].currentvalue*pr[i].stockownedbyplayer[id-1]*0.01;
       
     return assetvalue;   
  }
  
  void updatecreditlimit()
  {
     creditlimit=p[c].money+totalAssetvalue()-bankloan;  
  }
  
  void updatenetworth()
  {
    networth=creditlimit+p[c].money+totalAssetvalue()-bankloan;
  }
     
}
