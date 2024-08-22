# Postfix / postmulti POC

Le projet démontre la mise en place d'une instance postmulti pour réaliser la remise
des mails selon 2 files de priorité.

## Démarrer le service

```shell
docker-compose up
```

## Shell dans le docker postfix

```shell
docker exec -ti postfix-postmulti /bin/bash
```

## Envoi d'un mail

```shell
msmtp -C msmtprc -a docker -t <<EOF
To: lalmeras@gmail.com
Subject: test

test
EOF
```

## Consultation des mails

```shell
xdg-open http://localhost:8035/
```