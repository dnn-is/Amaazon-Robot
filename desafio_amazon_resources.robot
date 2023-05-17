*** Settings ***
Library    SeleniumLibrary

*** Variables ***    #Caso de Teste 01
${BROWSER}                    chrome
${URL}                        https://amazon.com.br
${LOCATOR_HOME}               nav-logo-sprites 
${LOCATOR_MUSICAS}            //a[contains(text(), 'Música')]
${LOCATOR_IMG_MUSIC}          //img[@alt='de música digital']
${LOCATOR_MUSIC_UNLIMITED}    //span[contains(text(), 'Amazon Music Unlimited')]
${LOCATOR_MUSIC_PRIME}        //span[contains(text(), 'Amazon Music Prime')]
${LOCATOR_MUSIC_FREE}         //span[contains(text(), 'Amazon Music Free')]
${LOCATOR_LOJA_MUSICA}        //span[contains(text(), 'Loja de música')]   

*** Variables ***    #Caso de Teste 02
${LOCATOR_ATENDIMENTO}                      //a[contains(text(), 'Atendimento ao Cliente')]
${LOCATOR_TITLE_WAIT}                       //h2[contains(text(), 'Algumas coisas que você pode fazer aqui')]
${LOCATOR_AJUDA}                            //h1[contains(text(), ' Olá. Como podemos ajudar você?')]
#Locators da página de atendimento
${LOCATOR_PEDIDOS}                          //h3[contains(text(), 'Seus pedidos')]
${LOCATOR_DEVOLUCOES}                       (//h3[contains(text(), 'Devoluções e reembolsos')])[1]
${LOCATOR_SUPORTE}                          //h3[contains(text(), 'Suporte para dispositivos e serviços digitais')]
${LOCATOR_CONFIGURACOES_PAGAMENTO}          //h3[contains(text(), 'Configurações de pagamento')]
${LOCATOR_GERENCIAR_ENEDERECO}              //h3[contains(text(), 'Gerenciar endereços')]
${LOCATOR_SUA_CONTA}                        //h3[contains(text(), 'Sua conta')]
${LOCATOR_COVID}                            //h3[contains(text(), 'Amazon e COVID-19')]
${LOCATOR_DENUNCIAR}                        //h3[contains(text(), 'Denunciar algo suspeito')]

*** Variables ***    #Caso de Teste 03
${LOCATOR_OFERTAS_DIA}    //a[contains(text(), 'Ofertas do Dia')]
${LOCATOR_MSG_OFERTAS}    //h1[contains(text(), 'Ofertas e Promoções')]
${LOCATOR_CATEGORIAS}     //ol[@class='a-carousel']

*** Variables ***    #Caso de Teste 04
${LOCATOR_INPUT}                //input[@id='twotabsearchtextbox']
${LOCATOR_PESQUISAR}            //input[@id='nav-search-submit-button']  
${LOCATOR_CONSOLE}              (//span[contains(text(), 'Console PlayStation 5')])[2]
${LOCATOR_ADD_CARRINHO}         //input[@id='add-to-cart-button']
${LOCATOR_IR_PARA_CARRINHO}     //a[contains(text(), 'Ir para o carrinho')]
${LOCATOR_CONSOLE_CARRINHO}     //img[@alt='Console PlayStation 5, Abre em uma nova aba']

*** Variables ***    #Caso de Teste 05
${LOCATOR_EXCLUIR}           //input[@value='Excluir']
${LOCATOR_CARRINHO_VAZIO}    //h1[contains(text(), 'Seu carrinho de compras da Amazon está vazio.')]




*** Keywords ***
Abrir Navegador  
    Open Browser  browser=${BROWSER}
    Maximize Browser Window

Fechar Navegador
    Capture Page Screenshot
    Close Browser

DADO que estou na home page Amazon.com.br
    Go To    url=${URL}
    WHILE    $LOCATOR_HOME == $null
        Fechar Navegador
        Abrir Navegador
    END
    Wait Until Element Is Visible    locator=${LOCATOR_HOME}
    
QUANDO entro no menu Músicas
    Click Element    locator=${LOCATOR_MUSICAS}

 Então o título da página deve ser "Amazon Music Unlimited"
     Wait Until Element Is Visible    locator=${LOCATOR_IMG_MUSIC}
     Title Should Be    title=Amazon Music Unlimited

E deve aparecer os menus Amazon Music Unlimited, Amazon Music Prime, Amazon Music Free, Loja de música
    Wait Until Element Is Visible    locator=${LOCATOR_MUSIC_UNLIMITED}
    Wait Until Element Is Visible    locator=${LOCATOR_MUSIC_PRIME}
    Wait Until Element Is Visible    locator=${LOCATOR_MUSIC_FREE}
    Wait Until Element Is Visible    locator=${LOCATOR_LOJA_MUSICA}

QUANDO entro no menu Atendimento ao Cliente
    Click Element    locator=${LOCATOR_ATENDIMENTO} 

ENTAO o título da página deve ser "Amazon Music Unlimited"
    Wait Until Element Is Visible    locator=${LOCATOR_TITLE_WAIT}
    Title Should Be    title=Amazon Music Unlimited 

E deve aparecer a mensagem " Olá. Como podemos ajudar você?"
    Wait Until Element Is Visible    locator=${LOCATOR_AJUDA}

E deve aparecer os elementos Seus pedidos, Devoluções e reembolsos, Suporte para disposistos e serviços digitais, Configurações de pagamento, Gerenciar endereços, Sua conta, Amazon e COVID-19, Denunciar algo suspeito
    Wait Until Element Is Visible    locator=${LOCATOR_PEDIDOS}
    Wait Until Element Is Visible    locator=${LOCATOR_DEVOLUCOES}
    Wait Until Element Is Visible    locator=${LOCATOR_SUPORTE}
    Wait Until Element Is Visible    locator=${LOCATOR_CONFIGURACOES_PAGAMENTO}
    Wait Until Element Is Visible    locator=${LOCATOR_GERENCIAR_ENEDERECO}
    Wait Until Element Is Visible    locator=${LOCATOR_SUA_CONTA}
    Wait Until Element Is Visible    locator=${LOCATOR_COVID}
    Wait Until Element Is Visible    locator=${LOCATOR_DENUNCIAR}

QUANDO entro no menu Ofertas do Dia 
    Click Element    locator=${LOCATOR_OFERTAS_DIA}

E deve aparecer a mensagem "Ofertas e Promoções"
    Wait Until Element Is Visible    locator=${LOCATOR_MSG_OFERTAS}

 E deve aparecer o menu com as categorias das ofertas
     Wait Until Element Is Visible    locator=${LOCATOR_CATEGORIAS}    
ENTAO o título da página deve ser "Ajuda - Serviço de atendimento ao cliente da Amazon"
    Title Should Be    title=Ajuda - Serviço de atendimento ao cliente da Amazon   
    
ENTAO o título da página deve ser "Ofertas e Promoções | Amazon.com.br"
    Title Should Be    title=Ofertas e Promoções | Amazon.com.br

QUANDO adiciono o produto "${PRODUTO}" ao carrinho
    Input Text    locator=${LOCATOR_INPUT}    text=${PRODUTO}
    Click Element    locator=${LOCATOR_PESQUISAR}
    Wait Until Element Is Visible    locator=${LOCATOR_CONSOLE}
    Click Element    locator=${LOCATOR_CONSOLE}
    Wait Until Element Is Visible    locator=${LOCATOR_ADD_CARRINHO}
    Click Element    locator=${LOCATOR_ADD_CARRINHO}
    Click Element    locator=${LOCATOR_IR_PARA_CARRINHO}

ENTAO o produto "Console PlayStation 5" deve ser mostrado no carrinho
    Wait Until Element Is Visible    locator=${LOCATOR_CONSOLE_CARRINHO}

QUANDO clicar em excluir o produto do carrinho
    Click Element    locator=${LOCATOR_EXCLUIR}

 ENTAO o carrinho deve ficar vazio
     Wait Until Element Is Visible    locator=${LOCATOR_CARRINHO_VAZIO}
    

