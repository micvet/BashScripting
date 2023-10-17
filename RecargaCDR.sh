#!/bin/bash

read -p "Telefone: " telefone

read -p "Valor em centavos: " valor

data_hora=$(date +"%Y%m%d%H%M%S")

messageseq="${data_hora}T55R873"

echo -e "\n Request:\n " 

endpoint="http://12345"

request_body='<?xml version="1.0" encoding="UTF-8"?>
<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ars="http://www.server.com" xmlns:server="http://www.server.com/" xmlns:arc="http://server.server.com/">
    <soapenv:Header/>
    <soapenv:Body>
        <ars:RechargeRequestMsg>
            <RequestHeader>
                <cbs:Version>1</cbs:Version>
                <cbs:MessageSeq>'"$messageseq"'</cbs:MessageSeq>
                <cbs:AccessSecurity>
                    <cbs:LoginSystemCode>OPERADORAPDV</cbs:LoginSystemCode>
                    <cbs:Password>xz9Cxl2UC8QHfzY70hLV3X7TuoRksktr3lPIwl7KLuU=</cbs:Password>
                </cbs:AccessSecurity>
            </RequestHeader>
            <RechargeRequest>
                <ars:RechargeChannelID>30</ars:RechargeChannelID>
                <ars:RechargeObj>
                    <ars:SubAccessCode>
                        <arc:PrimaryIdentity>'"$telefone"'</arc:PrimaryIdentity>
                    </ars:SubAccessCode>
                </ars:RechargeObj>
                <ars:RechargeInfo>
                    <ars:CashPayment>
                        <ars:PaymentMethod>2001</ars:PaymentMethod>
                        <ars:Amount>'"$valor"'</ars:Amount>
                        <ars:BankInfo>
                            <arc:BankCode/>
                            <arc:CreditCardType/>
                        </ars:BankInfo>
                    </ars:CashPayment>
                </ars:RechargeInfo>
                <ars:AdditionalProperty>
                    <arc:Code>BALANCE_TYPE</arc:Code>
                    <arc:Value/>
                </ars:AdditionalProperty>
                <ars:AdditionalProperty>
                    <arc:Code>C_OPERADORA_DOBRO</arc:Code>
                    <arc:Value/>
                </ars:AdditionalProperty>
            </RechargeRequest>
        </ars:RechargeRequestMsg>
    </soapenv:Body>
</soapenv:Envelope>'

echo "$request_body"

response=$(curl -s -X POST -H "Content-Type: text/xml" -d "$request_body" "$endpoint")

echo -e "\n Response: \n"

echo "$response" | xmllint --format -
