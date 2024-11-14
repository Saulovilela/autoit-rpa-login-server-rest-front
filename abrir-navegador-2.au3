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

; Aumenta o tempo de espera para garantir o carregamento completo
Sleep(5000)

; Aguarda e maximiza a janela do navegador
WinWaitActive("[CLASS:Chrome_WidgetWin_1]", "", 10)
WinSetState("[CLASS:Chrome_WidgetWin_1]", "", @SW_MAXIMIZE)

; Força o foco na janela do navegador antes de prosseguir
WinActivate("[CLASS:Chrome_WidgetWin_1]")

; Aguarda mais um pouco para garantir que o navegador esteja focado
Sleep(2000)

; Pressiona Tab para alcançar o campo de e-mail
Send("{TAB}")
Sleep(1000)

; Digita o e-mail
Send("fulano@qa.com")
Sleep(1000)

; Pressiona Tab para ir para o próximo campo
Send("{TAB}")
Sleep(500)

; Digita a senha
Send("teste")
Sleep(1000)

; Pressiona Enter para submeter
Send("{ENTER}")

