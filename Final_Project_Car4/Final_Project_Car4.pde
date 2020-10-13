import org.gicentre.utils.stat.*;

Guage g1= new Guage();
Guage g2= new Guage();
Guage g3= new Guage();

car[] c1= new car[0];

TripComputer TC1 = new TripComputer();

SensorDataProvider SDP1 = new SensorDataProvider();

int z = 0;
int sel;
int i;

float bbq;
float GCF;
float [] FEcon = {0};

float TDist;
float AFuelEcon;
float R1;
float FE;
float CF;

BarChart Bar1;
BarChart Bar2;
float [] Store;
float [] CHR1 = {0};
float [] CHR2 = {0};

void setup()
{
  size(1600, 1000);  
  Bar1 = new BarChart(this);
  Bar2 = new BarChart(this);
}

void draw()
{
  PImage front;
  front = loadImage("g1925.png");
  image (front, 0, 0);
  PFont mono;
  mono = createFont ("BlackOpsOne-Regular.ttf",20);
  textFont(mono);   
  fill(255);
  text("CLICK ON THE SCREEN TO CALIBRATE", 600, 900);  

  if(z==0)
  {
    if(keyPressed)
    {
      if(key == '1')
      {
        sel=0;
        i=0;
        z=1;
      } else if (key == '2')
      {
          sel=1;
          i=0;
          z=1;
      }
      else
      {
        z = 0;
        System.exit(0);
      }

      SDP1.Initialize(sel);
      c1= new car[SDP1.dataTable.getRowCount()];

    }
  }
  else
  {
    c1[i]= new car (sel,i);
    
    //Background_DashBoard
    if(sel == 0)
    {
    PImage backc;
    backc = loadImage("CarD.png");
    image (backc, 0, 0);
    }
    else
    {
    PImage backt;
    backt = loadImage("TruckD.png");
    image (backt, 0, 0);
    }
  
    g1.FuelBar(c1[i].fuelLevel,80);
    g1.txt(c1[i].speed,c1[i].RPM,c1[i].fuelLevel);
  
    bbq = c1[i].TC.updateTotalDistance(bbq);
    println("TDIST: " + bbq);
  
    TDist = c1[i].TC.updateTotalDistance(TDist);
    println(i+" total Dist"+TDist);
  
    fill(#2DFAF8);
    textAlign(CORNER,CORNER);
    text("Odometer: " +TDist +" KM", 810,240);
    
    text("Range: " +R1 +" KM", 810,220);
    
    text("Fuel Economy: " + FE +"(KM/L)",810,200);
    
    text("Fuel Consumption: " +CF+ "(L/100KM)", 810, 180);
    
    
          
  if(i!=0)
  {  
  GCF = c1[i].FT.getConsumedFuel(c1[i-1].FT.FLevel);
  c1[i].fC.fuelConsum = GCF;
  c1[i].fC = new FComputer (GCF , i, c1[i].FT.FLevel); 
  println("FL" + c1[i].FT.FLevel);
  
  println( c1[i].fC.fuelConsum);
  FEcon = c1[i].fC.CfEconH(FEcon, (c1[i].speed/3600));
  
  c1[i].GXY(c1[i-1].GX, c1[i-1].GY);
  c1[i].DIR();
  c1[i].GetDi();
  c1[i].fC.AveFuelEcon();
  AFuelEcon = c1[i].fC.AveEcon;
  
  c1[i].fC.GRD();//function call
  R1 = c1[i].fC.range;
  println("Range: " + R1);

  println("AVE_Economy: " + AFuelEcon);
  
  FE = FEcon[i];
  println("fuelEcon: " + FE );
  
  CF = 1/AFuelEcon*100;
  println("Consumed Fuel: " +CF);    
  
  textSize(12);
  text("Average Fuel Economy (KM/Litre) over time (sec)", 360,940);
  text("Fuel Consumption (Litre) over time (sec)", 1250,940);
  
  CHR1 = splice(CHR1, c1[i].fC.AveEcon,i);
  CHR2 = splice(CHR2, CF,i);
  
    if(i<40)
    {
      Store = new float[40];
      for(int j = 0; j < CHR1.length; j++)
      {
        Store[j] = CHR1[j];
        
      }
      Bar1.setData(Store);
    }
    
    else
    {
      Store= new float [40];
      
      int I = 0;
      for(int a = CHR1.length-40; a < CHR1.length; a++, I++)
      {
        Store[I] = CHR1[a];
      }
      Bar1.setData(Store);
    }
    Bar1.setMinValue(0);
    Bar1.setMaxValue(20);
    textFont(createFont("Serif", 5), 10);
    Bar1.showValueAxis(true);
    Bar1.setValueFormat("#");
    Bar1.showCategoryAxis(true);

    Bar1.setBarColour(color(255));
    Bar1.setBarGap(4);
    Bar1.draw(100, 750, 500, 180);
    
   
    if(i<40)
    {
      Store = new float[40];
      for(int j= 0; j < CHR2.length; j++)
      {
        Store[j] = CHR2[j];
      }
      Bar2.setData(Store);
    }
    
    else
    {
      Store= new float [40];
      
      int I = 0;
      for(int a = CHR2.length-40; a < CHR2.length; a++, I++)
      {
        Store[I] = CHR2[a];
      }
      Bar2.setData(Store);
    }
    Bar2.setMinValue(0);
    Bar2.setMaxValue(40);
    textFont(createFont("Serif", 5), 10);
    Bar2.showValueAxis(true);
    Bar2.setValueFormat("#");
    Bar2.showCategoryAxis(true);

    Bar2.setBarColour(color(255));
    Bar2.setBarGap(4);
    Bar2.draw(1000, 750, 500, 180);
  
  }
    i++;

  if (i == c1.length)
  {
    z=0;
    c1= new car[0];
    CHR1 = new float[0];
    CHR2 = new float[0];
  }
  delay(50);
  }
}
