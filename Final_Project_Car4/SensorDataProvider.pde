class SensorDataProvider
{
  String filePath;
  Table dataTable;
  int currentIndex = 0;
  TableRow row;

  void Initialize( int a )
  {
    if (a == 0)
    {
      filePath = "car_status_BMW_323i.csv";
    }
    else
    {
      filePath = "car_status_Truck_F150.csv";
    }
    dataTable = loadTable (filePath, "header");
  }
  
  void readNext(int a)
  {
    currentIndex=a;
    row = dataTable.getRow(currentIndex);
  }
  
  int readRPM()
  {
    return row.getInt ("RPM");
  }
  
  float readRatio ()
  {
    return row.getFloat("Gear Ratio");
  }
  float readFuelLevel()
  {
    return row.getFloat( "Fuel Level (liter)");
  }
  
  float readX()
  {
    return row.getFloat( "X" );
  }
  
  float readY()
  {
    row = dataTable.getRow(currentIndex);
    return row.getFloat( "Y" );
  }

}  
