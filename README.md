# RAGE:MP Server Docker Container

Этот Docker-контейнер предназначен для запуска сервера RAGE:MP с конфигурацией, которая задается через переменные окружения. Контейнер автоматически генерирует файл конфигурации `conf.json` на основе переданных переменных окружения и затем запускает сервер RAGE:MP с этой конфигурацией.

## Как Это Работает

Контейнер запускает сервер RAGE:MP, используя конфигурацию, сформированную из переменных окружения. Файл `conf.json` генерируется автоматически перед запуском сервера на основе переданных переменных, что обеспечивает гибкость и удобство в настройке сервера.

## Поддерживаемые Параметры Конфигурации

Ниже приведены поддерживаемые параметры конфигурации, с указанием их соответствующих переменных окружения и типов данных:

| Параметр                              | Имя Переменной Окружения                  | Тип     | Описание                                                                                          |
|---------------------------------------|-------------------------------------------|---------|---------------------------------------------------------------------------------------------------|
| `announce`                            | `RAGEMP_ANNOUNCE`                         | boolean | Анонсировать сервер на мастер-сервере, чтобы люди могли видеть его в браузере серверов (`true` или `false`). |
| `bind`                                | `RAGEMP_BIND`                             | string  | IP-адрес, к которому сервер должен привязаться. По умолчанию `127.0.0.1`.                         |
| `gamemode`                            | `RAGEMP_GAMEMODE`                         | string  | Режим игры на сервере (например, `Freeroam`, `roleplay`).                                         |
| `encryption`                          | `RAGEMP_ENCRYPTION`                       | boolean | Включить или отключить шифрование для соединений с сервером.                                      |
| `maxplayers`                          | `RAGEMP_MAXPLAYERS`                       | number  | Максимальное количество игроков, которое сервер сможет принять. По умолчанию `100`.               |
| `name`                                | `RAGEMP_NAME`                             | string  | Имя сервера, отображаемое для игроков.                                                            |
| `stream-distance`                     | `RAGEMP_STREAM_DISTANCE`                  | number  | Дистанция, на которой объекты сервера будут появляться для подключенных игроков (в единицах). По умолчанию `500.0`. |
| `port`                                | `RAGEMP_PORT`                             | number  | Порт, который будет использовать сервер. По умолчанию `22005`.                                    |
| `disallow-multiple-connections-per-ip`| `RAGEMP_DISALLOW_MULTIPLE_CONNECTIONS_PER_IP` | boolean | Запретить или разрешить несколько подключений с одного IP (`true` или `false`).                    |
| `limit-time-of-connections-per-ip`    | `RAGEMP_LIMIT_TIME_OF_CONNECTIONS_PER_IP` | number  | Максимальное время, за которое игрок может попытаться переподключиться, прежде чем произойдет таймаут. |
| `url`                                 | `RAGEMP_URL`                              | string  | URL-адрес сайта, связанного с сервером.                                                           |
| `language`                            | `RAGEMP_LANGUAGE`                         | string  | Код языка сервера (например, `us`).                                                               |
| `sync-rate`                           | `RAGEMP_SYNC_RATE`                        | number  | Интервал в миллисекундах для синхронизации объектов сервера. По умолчанию `40`.                   |
| `resource-scan-thread-limit`          | `RAGEMP_RESOURCE_SCAN_THREAD_LIMIT`       | number  | Максимальное количество потоков, используемых для сканирования ресурсов.                         |
| `max-ping`                            | `RAGEMP_MAX_PING`                         | number  | Максимально допустимый пинг для сервера.                                                          |
| `min-fps`                             | `RAGEMP_MIN_FPS`                          | number  | Минимально допустимый FPS для сервера.                                                            |
| `max-packet-loss`                     | `RAGEMP_MAX_PACKET_LOSS`                  | number  | Максимально допустимая потеря пакетов на сервере.                                                 |
| `allow-cef-debugging`                 | `RAGEMP_ALLOW_CEF_DEBUGGING`              | boolean | Разрешить отладку страниц CEF на стороне клиента.                                                 |
| `enable-nodejs`                       | `RAGEMP_ENABLE_NODEJS`                    | boolean | Включить NodeJS для серверных скриптов. По умолчанию `true`.                                      |
| `csharp`                              | `RAGEMP_CSHARP`                           | string  | Включить плагин C# (`true` для включения, `disabled` для отключения).                             |
| `enable-http-security`                | `RAGEMP_ENABLE_HTTP_SECURITY`             | boolean | Включить дополнительный уровень безопасности для предотвращения флуда фальшивыми HTTP-запросами.  |
| `voice-chat`                          | `RAGEMP_VOICE_CHAT`                       | boolean | Включить голосовой чат (`true` или `false`).                                                      |
| `voice-chat-sample-rate`              | `RAGEMP_VOICE_CHAT_SAMPLE_RATE`           | number  | Частота дискретизации для голосового чата. Допустимые значения: `8000`, `16000`, `24000`, `48000`.|
| `fastdl-host`                         | `RAGEMP_FASTDL_HOST`                      | string  | Внешний URL для загрузки клиентами необходимых пакетов на клиентской стороне.                     |
| `server-side-weapons-only-mode`       | `RAGEMP_SERVER_SIDE_WEAPONS_ONLY_MODE`    | boolean | Если установлено в `true`, синхронизируются только оружия, выданные сервером.                     |
| `api-threading-debugging`             | `RAGEMP_API_THREADING_DEBUGGING`          | boolean | Включить отладку потоков API.                                                                     |
| `fqdn`                                | `RAGEMP_FQDN`                             | string  | Полностью квалифицированное доменное имя для сервера (например, `game-srv.rage.mp`).              |
| `resources-compression-level`         | `RAGEMP_RESOURCES_COMPRESSION_LEVEL`      | number  | Уровень сжатия ресурсов. Используйте `0` для локального сервера, более высокие значения для оптимизации полосы пропускания. |
| `node-commandline-flags`              | `RAGEMP_NODE_COMMANDLINE_FLAGS`           | string  | Флаги командной строки для NodeJS (например, `--inspect`).                                        |
| `synchronization-extrapolation-multiplier` | `RAGEMP_SYNCHRONIZATION_EXTRAPOLATION_MULTIPLIER` | number | Множитель для прогнозирования синхронизации транспортных средств.                                  |
| `http-threads`                        | `RAGEMP_HTTP_THREADS`                     | number  | Количество одновременных HTTP-соединений, которые может обрабатывать сервер. По умолчанию `50`.   |
| `trigger-compression-logging`         | `RAGEMP_TRIGGER_COMPRESSION_LOGGING`      | boolean | Включить логирование уровней сжатия исходящих триггеров событий клиента.                          |
| `trigger-compression-training`        | `RAGEMP_TRIGGER_COMPRESSION_TRAINING`     | boolean | Включить обучение словаря сжатия для триггеров.                                                   |
| `trigger-compression-dictionary`      | `RAGEMP_TRIGGER_COMPRESSION_DICTIONARY`   | string  | Путь к файлу для загрузки/сохранения словаря сжатия.                                              |
| `create-fastdl-snapshot`              | `RAGEMP_CREATE_FASTDL_SNAPSHOT`           | boolean | Генерация файлов клиентских пакетов для FastDL.                                                   |
| `disable-client-packages-ram-cache`   | `RAGEMP_DISABLE_CLIENT_PACKAGES_RAM_CACHE`| boolean | Отключить кеширование пакетов в оперативной памяти.                                               |
| `client-packages-shared-folder`       | `RAGEMP_CLIENT_PACKAGES_SHARED_FOLDER`    | string  | Общая папка для клиентских ресурсов на разных серверах.                                           |


## Пример Использования

Пример использования этого скрипта в файле `docker-compose` для запуска сервера RAGE:MP:

```yaml
services:
  ragemp-server:
    image: kirillshakhov/ragemp-net8:latest
    build:
      context: .
    container_name: ragemp-server
    environment:
      - RAGEMP_MAXPLAYERS=100
      - RAGEMP_NAME="RAGE:MP Neoficial servir"
      - RAGEMP_URL=https://rage.mp
      - RAGEMP_GAMEMODE=roleplay
      - RAGEMP_STREAM_DISTANCE=300.0
      - RAGEMP_ANNOUNCE=false
      - RAGEMP_CSHARP=enabled
      - RAGEMP_LANGUAGE=ru
      - RAGEMP_VOICE_CHAT=true
      - RAGEMP_VOICE_CHAT_SAMPLE_RATE=48000
      - RAGEMP_ALLOW_CEF_DEBUGGING=true
    ports:
      - "22005:22005/udp"
      - "22005:22005/tcp"
      - "22006:22006/tcp"
    restart: unless-stopped
```

В этом примере переменные окружения задают различные параметры сервера. Контейнер автоматически сгенерирует файл `conf.json` на основе этих настроек и запустит сервер с этой конфигурацией.

## Примечания

- Убедитесь, что все переменные окружения заданы корректно перед запуском контейнера.
- Если переменная не задана, соответствующий параметр не будет включен в файл `conf.json`.
- Скрипт выводит содержимое сгенерированного файла `conf.json` и код завершения сервера для целей отладки.
