object DataModule1: TDataModule1
  Height = 279
  Width = 336
  PixelsPerInch = 115
  object fdConnection: TFDConnection
    Params.Strings = (
      'Database=ArecoDB1'
      'User_Name=sa'
      'Password=@Areco123'
      'Server=LAPTOP-E45FJV75\SQLEXPRESS'
      'DriverID=MSSQL')
    ResourceOptions.AssignedValues = [rvAutoReconnect]
    ResourceOptions.AutoReconnect = True
    LoginPrompt = False
    Left = 96
    Top = 48
  end
end
