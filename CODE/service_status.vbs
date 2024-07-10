Contenido service_status.vbs
' service_status.vbs
' Devuelve el estado de uno o varios servicios.
' Para varios servicios pondremos en la consulta varios condicionales separados por OR
' por ejemplo: SELECT State, Caption FROM Win32_Service Where Name='RtkAudioUniversalService' OR Name='uvnc_service' OR Name='XboxGipSvc'
' --------------------------------------
'PandoraFMSAgent
'
strComputer = "."
Set objSWbemServices = GetObject("winmgmts:\\" & strComputer & "\root\cimv2")
Set colServices = objSWbemServices.ExecQuery("SELECT State, Caption FROM Win32_Service Where Name='RtkAudioUniversalService' OR Name='uvnc_service' OR Name='XboxGipSvc'")

For Each objService In colServices
	
	Wscript.StdOut.WriteLine "<module>"
	Wscript.StdOut.WriteLine "    <name><![CDATA[Servicio " & objService.Name & "]]></name>"
	Wscript.StdOut.WriteLine "    <description><![CDATA[Estado del Servicio " & objService.Caption &"]]></description>"
	Wscript.StdOut.WriteLine "    <type><![CDATA[generic_data_string]]></type>"
	Wscript.StdOut.WriteLine "    <data><![CDATA[" & objService.State & "]]></data>"
	Wscript.StdOut.WriteLine "    <str_critical><![CDATA[Running]]></str_critical>"
	Wscript.StdOut.WriteLine "    <critical_inverse><![CDATA[1]]></critical_inverse>"
	Wscript.StdOut.WriteLine "</module>" 
    
Next
Wscript.StdOut.flush
