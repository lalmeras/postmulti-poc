# Postfix / postmulti POC

Le projet démontre la mise en place d'une instance postmulti pour réaliser la remise
des mails selon 2 files de priorité.

Les mails avec un header `X-Priority: slow` sont remis avec une queue dont le débit
est paramétré par `default_destination_rate_delay` (configuration postfix-slow).

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
# Priorité normale
msmtp -C msmtprc -a docker -t <<EOF
To: lalmeras@gmail.com
Subject: test

test
EOF

# Priorité lente
msmtp -C msmtprc -a docker -t <<EOF
To: lalmeras@gmail.com
Subject: test
X-Priority: slow

test
EOF
```

## Consultation des mails

```shell
xdg-open http://localhost:8035/
```