object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 335
  Width = 438
  object Conn: TFDConnection
    Params.Strings = (
      'User_Name=SYSDBA'
      'Password=masterkey'
      'Server=LOCALHOST'
      'Port=3050'
      'CharacterSet=WIN1252'
      'Database=C:\DataBase\Firebird\DADOS.FDB'
      'DriverID=FB')
    LoginPrompt = False
    Left = 56
    Top = 32
  end
  object FDGUIxWaitCursor: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 247
    Top = 32
  end
  object FDPhysFBDriverLink: TFDPhysFBDriverLink
    VendorLib = 'C:\Program Files (x86)\Firebird\Firebird_2_5\bin\fbclient.dll'
    Left = 144
    Top = 32
  end
  object RESTClient1: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'utf-8, *;q=0.8'
    BaseURL = 'http://viacep.com.br/ws'
    Params = <>
    RaiseExceptionOn500 = False
    Left = 56
    Top = 104
  end
  object RESTRequest1: TRESTRequest
    Client = RESTClient1
    Params = <>
    Resource = '01001000/json/'
    Response = RESTResponse1
    SynchronizedEvents = False
    Left = 160
    Top = 104
  end
  object RESTResponse1: TRESTResponse
    ContentType = 'application/json'
    Left = 264
    Top = 104
  end
  object RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter
    Dataset = MemTable
    FieldDefs = <>
    Response = RESTResponse1
    Left = 160
    Top = 168
  end
  object MemTable: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    Left = 48
    Top = 240
  end
  object Qrymanut: TFDQuery
    Connection = Conn
    Left = 328
    Top = 240
  end
end
