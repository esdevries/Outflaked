## Usage

Massively insprired from
[Easy Self Host](https://www.youtube.com/watch?v=ycmn4D_fWrs&t=50s)

On your vps/home-server,

```bash
apt update
apt install docker.io docker-compose-v2
```

In config.yaml make sure the server_url points to your actual server's ip.

```bash
docker compose up -d

# To check they're running
docker compose logs -f

# Example headscale command
docker exec headscale headscale users create USERNAME
```

## Headscale

Full list of [headscale documentation](https://headscale.net/stable/)
