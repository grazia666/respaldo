# respaldo_windows.ps1

# Ruta local que se desea respaldar
$origen = "C:\Users\$env:USERNAME\Documents"

# Ruta remota compartida (Samba)
$destino = "\\localhost\Respaldo\windows_$env:USERNAME"

# Crear carpeta de usuario en destino si no existe
if (!(Test-Path -Path $destino)) {
    New-Item -ItemType Directory -Path $destino
}

# Copiar archivos (puedes usar -Recurse si quieres incluir subcarpetas)
Copy-Item -Path "$origen\*" -Destination $destino -Recurse -Force
