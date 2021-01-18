# lessson_ansible_8_2

lessson_ansible_8_2 - это механизм подготовки к автоматическому развертыванию ELK для вашей организации с помощью docker и ansible.

## Основные характеристики

- Создает 2 docker контейнера из образа centos:7:
  - elstic
  - logstash
- Устанавливает пакеты JDK (tags: java) на оба контейнера
- На контейнер elastic устанавливает пакеты:
  - Elasticsearch (tags: elastic)
  - Kibana (tags: kibana)
- На контейнер logstash ставим Logstash (tags: logstash)  

##Переменные


kibana_version - номер версии

kibana_home - папка установки Kibana

elastic_version - номер версии

elastic_home - папка установки Elasticsearch

java_jdk_version - номер версии

java_oracle_jdk_package - имя файла для установки

## Как использовать
* Прочтите всю документацию.
* Клонируйте репозиторий к себе на компьютер.
* Отредактируйте файлы под себя(docker-compose, dokerfile, playbook/inventory/prod.yml)
* Читайте пункт Запуск

## Запуск
Подготовка:

Создадим сеть
>docker network create sirius-network

Подготовим докер-контейнеры

>docker-compose build

Запускаем контейнеры
>docker-compose up -d

Загружаем роли из папки playbook
>ansible-galaxy install -r requirements.yml

Переписываем java роль под себя. Не стал делать еще один репозиторий. Убрать become, изменить переменную jdk_distr_name под себя

Запускаем playbook - будут установлены пакеты и созданы папки для их хранения локально.
>ansible-playbook -i playbook/inventory/prod.yml playbook/site.yml

Logstash пока в работе. Столкнулся с проблемой - docker контейнеры не работают с systemd, который нужен для запуска logstash, надо мудрить, либо переходить на виртуальную машину.

