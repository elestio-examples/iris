#set env vars
set -o allexport; source .env; set +o allexport;

IRIS_SECRET_KEY=$(openssl rand -hex 64)
IRIS_SECURITY_PASSWORD_SALT=$(openssl rand -hex 64)
IRIS_ADM_API_KEY=$(openssl rand -hex 64)

cat << EOT >> ./.env

IRIS_SECRET_KEY="${IRIS_SECRET_KEY}"
IRIS_SECURITY_PASSWORD_SALT="${IRIS_SECURITY_PASSWORD_SALT}"
IRIS_ADM_API_KEY="${IRIS_ADM_API_KEY}"
EOT

cat <<EOT > ./servers.json
{
    "Servers": {
        "1": {
            "Name": "local",
            "Group": "Servers",
            "Host": "172.17.0.1",
            "Port": 29094,
            "MaintenanceDB": "postgres",
            "SSLMode": "prefer",
            "Username": "postgres",
            "PassFile": "/pgpass"
        }
    }
}
EOT