# HUBBLE

- POC using nginx as reverse-proxy and to protect endpoint with mTLS
- Node (Express) + NGINX

- [HUBBLE](#hubble)
  - [Requisitos](#requisitos)
  - [Instalação](#instalação)
  - [Acesso](#acesso)
    - [Aplicação](#aplicação)

## Requisitos

- [Docker](https://www.docker.com/get-started) (Windows)
- [Docker Compose](https://docs.docker.com/compose/install/) (Linux)

## Instalação

- Clone este repositório

```bash
$ git clone https://github.com/faxina-projects/hubble.git
```

- Acesse a pasta do projeto

```bash
$ cd hubble
```

- Generate certificates

```bash
$ sh ./certs/generate.sh
```

- Build da imagem e criação do container

```bash
$ docker-compose up --build
```

## Acesso

### Aplicação

- app: http://localhost
- app protected endpoint: http://localhost/protected

## Teste mTLS

```bash
$ curl https://localhost/protected --cacert ./certs/ca.crt --key ./certs/client.key --cert ./certs/client.crt
```
