do{
    sleep 1
    write-host "================================================="
    write-host "@@@@@            @"
    write-host "@    @     @@@         @@@   @@@     @@@    @@@@"
    write-host "@     @   @   @  @     @  @@@   @   @   @  @"
    write-host "@     @  @   @   @     @   @    @   @   @   @@@"
    write-host "@    @    @@     @     @   @    @   @   @      @"
    write-host "@@@@@      @@@@   @@@  @   @    @    @@@   @@@@"
    write-host "================================================="
    sleep 1

    write-host "1)  BIOS"
    write-host "2)  PROCESADOR"
    write-host "3)  ARQUITECTURA"
    write-host "4)  DISCOS DUROS"
    write-host "5)  REVISIONES Y ACTUALIZACIONES INSTALADAS"
    write-host "6)  VERSION Y SERVICE PACK"
    write-host "7)  IP´s"
    write-host "8)  PERFILES DE FIREWALL"
    write-host "9)  ADAPTADORES DE RED"
    write-host "10) CUENTAS DE USUARIOS"
    write-host "11) SALIR"
    $opcion = 100
    write-host "================================================="
    [int]$opcion = Read-Host "Introduce una opcion"

    if($opcion -ne 'int')
    {
        write-host "introduce un numero de la lista de opciones"
    }

    switch($opcion)
    {
        1 {Get-CimInstance -ClassName Win32_BIOS;break}
        2 {Get-CimInstance -ClassName Win32_Processor | Select-Object -ExcludeProperty "CIM*";break}
        3 {Get-CimInstance -ClassName Win32_ComputerSystem | Select-Object -Property SystemType;break}
        4 {Get-CimInstance -ClassName Win32_LogicalDisk;break}
        5 {Get-CimInstance -ClassName Win32_QuickFixEngineering;break}
        6 {Get-CimInstance -ClassName Win32_OperatingSystem | Select-Object -Property Build*,OSType,ServicePack*;break}
        7 {Get-NetIPAddress;break}
        8 {Get-NetFirewallProfile;break}
        9 {Get-NetAdapter;break}
        10 {Get-WmiObject Win32_UserAccount}
        11 {write-host "Saliendo....";break}
        default{"introduce un numero valido....";break}
    }

    sleep 2

}while($opcion -ne 11)
