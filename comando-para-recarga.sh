#!/bin/bash

read -p "Telefone: " telefone

read -p "Valor em centavos: " valor

data_hora=$(date +"%Y%m%d%H%M%S")

messageseq="${data_hora}"

echo -e "\n Request:\n " 

endpoint="http://12345"

request_body='<?xml version="1.0" encoding="UTF-8"?>
<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ars="http://www.server.com" xmlns:server="http://www.server.com/" xmlns:arc="http://server.server.com/">
    <soapenv:Header/>
    <soapenv:Body>
        <ars:RequestMsg>
            <RequestHeader>
                <cbs:Version>1</cbs:Version>
                <cbs:MessageSeq>'"$messageseq"'</cbs:MessageSeq>
                <cbs:AccessSecurity>
                    <cbs:LoginSystemCode>OPERADORAPDV</cbs:LoginSystemCode>
                    <cbs:Password>123456</cbs:Password>
                </cbs:AccessSecurity>
            </RequestHeader>
            <Request>
                <ars:ChannelID>00</ars:ChannelID>
                <ars:Obj>
                    <ars:SubAccessCode>
                        <arc:PrimaryIdentity>'"$telefone"'</arc:PrimaryIdentity>
                    </ars:SubAccessCode>
                </ars:Obj>
                <ars:Info>
                    <ars:CashPayment>
                        <ars:PaymentMethod>00</ars:PaymentMethod>
                        <ars:Amount>'"$valor"'</ars:Amount>
                        <ars:BankInfo>
                            <arc:BankCode/>
                            <arc:CreditCardType/>
                        </ars:BankInfo>
                    </ars:CashPayment>
                </ars:Info>
                <ars:AdditionalProperty>
                    <arc:Code>BALANCE</arc:Code>
                    <arc:Value/>
                </ars:AdditionalProperty>
                <ars:AdditionalProperty>
                    <arc:Code>C_OPERADORA_DOBRO</arc:Code>
                    <arc:Value/>
                </ars:AdditionalProperty>
            </Request>
        </ars:RequestMsg>
    </soapenv:Body>
</soapenv:Envelope>'

echo "$request_body"

response=$(curl -s -X POST -H "Content-Type: text/xml" -d "$request_body" "$endpoint")

echo -e "\n Response: \n"

echo "$response" | xmllint --format -
