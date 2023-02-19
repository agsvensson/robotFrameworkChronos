*** Settings ***
Documentation  Robot Framework Sem Complicação
Library  SeleniumLibrary  timeout=500

*** Variables ***
${url}                               https://demoblaze.com/
${navegador}                         chrome

*** Keywords ***
Adicionar item carrinho de compra
    Open Browser                     ${url}    ${navegador}
    Maximize Browser Window
    Click Link                       Laptops
    Wait Until Element Is Visible    Link=MacBook Pro
    Click Link                       MacBook Pro
    Wait Until Element Is Visible    xpath=//div[2]//a
    Click Element                    xpath=//div[2]//a
    Alert Should Be Present

Preencher dados compra
    Click Link                       Cart
    Click Button                     css=.btn-success
    Wait Until Element Is Visible    id=name
    Input Text                       id=name    Arthur Svensson
    Input Text                       id=country    Brasil
    Input Text                       id=city    Porto Alegre
    Input Text                       id=card    0123456789
    Input Text                       id=month    07
    Input Text                       id=year    2031
Finalizar compra
    Click Element                    xpath=//button[text()='Purchase']
    Wait Until Element Is Visible    css=.confirm
    Element Text Should Be           css=.sweet-alert > h2    Thank you for your purchase!
    Click Button                     css=.confirm



Não finalizar compra
    Click Element                    xpath=//*[@id="orderModal"]/div/div/div[3]/button[1]

Excluir item carrinho
    Click Link                       Cart
    Sleep                            3s
    Click Link                       Delete


*** Test Cases ***
Adicionar item no carrinho e finalizar compra
    Adicionar item carrinho de compra
    Preencher dados compra
    Finalizar compra

Adicionar item no carrinho e não finalizar a compra
    Adicionar item carrinho de compra
    Preencher dados compra
    Não finalizar compra

Adicionar item no carrinho e removê-lo
    Adicionar item carrinho de compra
    Excluir item carrinho