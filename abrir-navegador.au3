; Script AutoIt para abrir o Google Chrome e interagir com a página
#include <Constants.au3>

; Caminho para o executável do navegador
Local $sBrowserPath = "C:\Program Files\Google\Chrome\Application\chrome.exe"

; URL para abrir
Local $sURL = "https://front.serverest.dev/login"

; Função para abrir o navegador
Func OpenBrowser($sBrowserPath, $sURL)
    If FileExists($sBrowserPath) Then
        Run('"' & $sBrowserPath & '" ' & $sURL)
    Else
        MsgBox($MB_ICONERROR, "Erro", "O navegador não foi encontrado no caminho especificado.")
        Exit
    EndIf
EndFunc

; Chama a função para abrir o navegador
OpenBrowser($sBrowserPath, $sURL)

; Aguarda o navegador carregar completamente
Sleep(3000)

; Maximiza a janela do navegador (garantindo que esteja em foco)
WinWaitActive("[CLASS:Chrome_WidgetWin_1]")
WinSetState("[CLASS:Chrome_WidgetWin_1]", "", @SW_MAXIMIZE)

; Clica no centro da tela
MouseClick("left", @DesktopWidth / 2, @DesktopHeight / 2)

; Aguarda um pouco para garantir que o clique seja registrado
Sleep(6000)

; Pressiona Tab
Send("{TAB}")

; Escreve o segundo texto
Send("fulano@qa.com")

; Pressiona Tab novamente
Send("{TAB}")

Send("teste")

; Pressiona Enter
Send("{ENTER}")
