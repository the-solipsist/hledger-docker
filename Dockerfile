FROM haskell:8

RUN stack install --resolver=lts-12 \
    cassava-megaparsec-1.0.0 \
    hledger-lib-1.11 \
    hledger-1.11 \
    hledger-ui-1.11 \
    hledger-web-1.11 \
    hledger-api-1.11 \
    hledger-diff-0.2.0.14 \
    hledger-iadd-1.3.6 \
    hledger-interest 
    
RUN mkdir /journals

VOLUME [ "/journals" ]

ENTRYPOINT [ "hledger" ]

EXPOSE 5000

CMD [ "hledger-web", "--serve", "--host", "0.0.0.0" ]
