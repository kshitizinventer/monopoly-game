class popupbox
{
  int view;
  int finalorprev;
  String store;
  popupbox()
  {
    view=0;
    // if finalorprev=0 it means value of e is for final view else for previous view
    finalorprev=0;
    store="something";
  }
  void message(String message,int view,int finalorprev)
  {
    store=message;
    this.view=view;
    this.finalorprev=finalorprev;
   //fill(0,0,255,63);
   fill(240,240,240,240);
   rect(200,180,800,550);
   fill(0);
   textSize(35);
   text(message,220,220);
   e=20;
   button();
  }
   void message(String message)
  {
    store=message;
   //fill(0,0,255,63);
   //rect(150,150,900,600);
    fill(240,240,240,240);
   rect(200,180,800,550);
   fill(0);
   textSize(35);
   text(message,220,220);
   e=20;
   button();
  }
  void button()
  {
    noFill();
    rect(880,670,100,50);
    text("OK",900,708);
  }
  
}
