#!/bin/sh

echo "Generate conf.json"

CONFIG_PARAMS="announce:RAGEMP_ANNOUNCE
bind:RAGEMP_BIND
gamemode:RAGEMP_GAMEMODE
encryption:RAGEMP_ENCRYPTION
maxplayers:RAGEMP_MAXPLAYERS
name:RAGEMP_NAME
stream-distance:RAGEMP_STREAM_DISTANCE
port:RAGEMP_PORT
disallow-multiple-connections-per-ip:RAGEMP_DISALLOW_MULTIPLE_CONNECTIONS_PER_IP
limit-time-of-connections-per-ip:RAGEMP_LIMIT_TIME_OF_CONNECTIONS_PER_IP
url:RAGEMP_URL
language:RAGEMP_LANGUAGE
sync-rate:RAGEMP_SYNC_RATE
resource-scan-thread-limit:RAGEMP_RESOURCE_SCAN_THREAD_LIMIT
max-ping:RAGEMP_MAX_PING
min-fps:RAGEMP_MIN_FPS
max-packet-loss:RAGEMP_MAX_PACKET_LOSS
allow-cef-debugging:RAGEMP_ALLOW_CEF_DEBUGGING
enable-nodejs:RAGEMP_ENABLE_NODEJS
csharp:RAGEMP_CSHARP
enable-http-security:RAGEMP_ENABLE_HTTP_SECURITY
voice-chat:RAGEMP_VOICE_CHAT
voice-chat-sample-rate:RAGEMP_VOICE_CHAT_SAMPLE_RATE
fastdl-host:RAGEMP_FASTDL_HOST
server-side-weapons-only-mode:RAGEMP_SERVER_SIDE_WEAPONS_ONLY_MODE
api-threading-debugging:RAGEMP_API_THREADING_DEBUGGING
fqdn:RAGEMP_FQDN
resources-compression-level:RAGEMP_RESOURCES_COMPRESSION_LEVEL
node-commandline-flags:NODE_COMMANDLINE_FLAGS
synchronization-extrapolation-multiplier:RAGEMP_SYNCHRONIZATION_EXTRAPOLATION_MULTIPLIER
http-threads:RAGEMP_HTTP_THREADS
trigger-compression-logging:RAGEMP_TRIGGER_COMPRESSION_LOGGING
trigger-compression-training:RAGEMP_TRIGGER_COMPRESSION_TRAINING
trigger-compression-dictionary:RAGEMP_TRIGGER_COMPRESSION_DICTIONARY
create-fastdl-snapshot:RAGEMP_CREATE_FASTDL_SNAPSHOT
disable-client-packages-ram-cache:RAGEMP_DISABLE_CLIENT_PACKAGES_RAM_CACHE
client-packages-shared-folder:RAGEMP_CLIENT_PACKAGES_SHARED_FOLDER"

{
  echo "{"
  first_item=true
  echo "$CONFIG_PARAMS" | while IFS=: read -r key var_name; do
    if [ -z "$key" ]; then
      continue  # Пропускаем пустые строки
    fi
    var_value=$(eval echo \$$var_name)
    
    if [ -n "$var_value" ]; then
      if [ "$first_item" = true ]; then
        first_item=false
      else
        echo ","
      fi

      if echo "$var_value" | grep -Eq '^[0-9]+$|^(true|false)$'; then
        echo "  \"$key\": $var_value"
      else
        echo "  \"$key\": \"$var_value\""
      fi
    fi
  done
  echo "}"
} > conf.json

echo "Содержимое сгенерированного файла conf.json:"
cat conf.json

echo "Server Start"
/server-files/ragemp-server > /server-files/server.log 2>&1

exit_code=$?
echo "Server has exited with code $exit_code"
