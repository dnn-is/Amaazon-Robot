*** Settings ***
Documentation    Essa swite servirá como teste desafio
Resource         desafio_amazon_resources.robot
Test Setup       Abrir Navegador 
Test Teardown    Fechar Navegador

*** Test Cases ***
Caso de Teste 01 - Acessar o menu Músicas
    [Documentation]    Esse teste deve verificar se a página de Música do site da Amazon aparece com os elementos
    ...                corretos
    [Tags]             elementos_musicas
    DADO que estou na home page Amazon.com.br
    QUANDO entro no menu Músicas
    Então o título da página deve ser "Amazon Music Unlimited"
    E deve aparecer os menus Amazon Music Unlimited, Amazon Music Prime, Amazon Music Free, Loja de música

Caso de Teste 02 - Acessar o menu Atendimento ao Cliente
    [Documentation]    Esse teste deve verificar a página de Atendimento ao Cliente e se seus elementos aparecem corretamente
    [Tags]             atendimento    
    DADO que estou na home page Amazon.com.br
    QUANDO entro no menu Atendimento ao Cliente
    E deve aparecer a mensagem " Olá. Como podemos ajudar você?"
    ENTAO o título da página deve ser "Ajuda - Serviço de atendimento ao cliente da Amazon"
    E deve aparecer os elementos Seus pedidos, Devoluções e reembolsos, Suporte para disposistos e serviços digitais, Configurações de pagamento, Gerenciar endereços, Sua conta, Amazon e COVID-19, Denunciar algo suspeito

Caso de Teste 03 - Acessar menu Ofertas do Dia 
    [Documentation]    Esse teste deve verificar se a página das ofertas do dia carrega corretamente
    [Tags]             verificar_objetos
    DADO que estou na home page Amazon.com.br
    QUANDO entro no menu Ofertas do Dia  
    E deve aparecer a mensagem "Ofertas e Promoções"
    ENTAO o título da página deve ser "Ofertas e Promoções | Amazon.com.br"
    E deve aparecer o menu com as categorias das ofertas

Caso de Teste 04 - Adicionar um PlayStation 5 ao carrinho
    [Documentation]    Esse teste adicionará um produto ao carrinho
    [Tags]             carrinho
    DADO que estou na home page Amazon.com.br
    QUANDO adiciono o produto "Console PlayStation 5" ao carrinho
    ENTAO o produto "Console PlayStation 5" deve ser mostrado no carrinho

Caso de Teste 05 - Remover o produto PlayStation 5 do carrinho
    [Documentation]    Esse teste irá verificar a remoção do produto do carrinho
    [Tags]             carrinho
    DADO que estou na home page Amazon.com.br
    QUANDO adiciono o produto "Console PlayStation 5" ao carrinho
    ENTAO o produto "Console PlayStation 5" deve ser mostrado no carrinho
    QUANDO clicar em excluir o produto do carrinho
    ENTAO o carrinho deve ficar vazio

