#!/bin/sh

echo "Generate conf.json"

CONFIG_PARAMS="announce:RAGEMP_ANNOUNCE:boolean
bind:RAGEMP_BIND:string
gamemode:RAGEMP_GAMEMODE:string
encryption:RAGEMP_ENCRYPTION:boolean
maxplayers:RAGEMP_MAXPLAYERS:number
name:RAGEMP_NAME:string
stream-distance:RAGEMP_STREAM_DISTANCE:number
port:RAGEMP_PORT:number
disallow-multiple-connections-per-ip:RAGEMP_DISALLOW_MULTIPLE_CONNECTIONS_PER_IP:boolean
limit-time-of-connections-per-ip:RAGEMP_LIMIT_TIME_OF_CONNECTIONS_PER_IP:number
url:RAGEMP_URL:string
language:RAGEMP_LANGUAGE:string
sync-rate:RAGEMP_SYNC_RATE:number
resource-scan-thread-limit:RAGEMP_RESOURCE_SCAN_THREAD_LIMIT:number
max-ping:RAGEMP_MAX_PING:number
min-fps:RAGEMP_MIN_FPS:number
max-packet-loss:RAGEMP_MAX_PACKET_LOSS:number
allow-cef-debugging:RAGEMP_ALLOW_CEF_DEBUGGING:boolean
enable-nodejs:RAGEMP_ENABLE_NODEJS:boolean
csharp:RAGEMP_CSHARP:string
enable-http-security:RAGEMP_ENABLE_HTTP_SECURITY:boolean
voice-chat:RAGEMP_VOICE_CHAT:boolean
voice-chat-sample-rate:RAGEMP_VOICE_CHAT_SAMPLE_RATE:number
fastdl-host:RAGEMP_FASTDL_HOST:string
server-side-weapons-only-mode:RAGEMP_SERVER_SIDE_WEAPONS_ONLY_MODE:boolean
api-threading-debugging:RAGEMP_API_THREADING_DEBUGGING:boolean
fqdn:RAGEMP_FQDN:string
resources-compression-level:RAGEMP_RESOURCES_COMPRESSION_LEVEL:number
node-commandline-flags:RAGEMP_NODE_COMMANDLINE_FLAGS:string
synchronization-extrapolation-multiplier:RAGEMP_SYNCHRONIZATION_EXTRAPOLATION_MULTIPLIER:number
http-threads:RAGEMP_HTTP_THREADS:number
trigger-compression-logging:RAGEMP_TRIGGER_COMPRESSION_LOGGING:boolean
trigger-compression-training:RAGEMP_TRIGGER_COMPRESSION_TRAINING:boolean
trigger-compression-dictionary:RAGEMP_TRIGGER_COMPRESSION_DICTIONARY:string
create-fastdl-snapshot:RAGEMP_CREATE_FASTDL_SNAPSHOT:boolean
disable-client-packages-ram-cache:RAGEMP_DISABLE_CLIENT_PACKAGES_RAM_CACHE:boolean
client-packages-shared-folder:RAGEMP_CLIENT_PACKAGES_SHARED_FOLDER:string"

{
  echo "{"
  first_item=true
  echo "$CONFIG_PARAMS" | while IFS=: read -r key var_name var_type; do
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

      # Обработка значения в зависимости от его типа
      case $var_type in
        number)
          printf "  \"$key\": $var_value"
          ;;
        boolean)
          printf "  \"$key\": $var_value"
          ;;
        string)
          printf "  \"$key\": \"$var_value\""
          ;;
        *)
          echo "Unknown type for $key: $var_type"
          ;;
      esac
    fi
  done
  echo
  echo "}"
} > conf.json

echo "Содержимое сгенерированного файла conf.json:"
cat conf.json

echo "Server Start"
chmod +x /server-files/ragemp-server
/server-files/ragemp-server
