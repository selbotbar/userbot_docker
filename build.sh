#!/usr/bin/env bash

exit_script()
{
echo "Build was killed!"
sendTG "${ROM} Build for ${DEVICE} was killed!"
}

trap exit_script SIGINT SIGTERM

function sendTG() {
    curl -s "https://api.telegram.org/bot${TELEGRAM_TOKEN}/sendmessage" --data "text=${*}&chat_id=-1001372533112&parse_mode=Markdown"
}

sendTG "Docker image is being updated!"

docker build . -t baalajimaestro/userbot_python:latest
docker tag baalajimaestro/userbot_python:latest baalajimaestro/userbot_python:latest
echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
docker push baalajimaestro/userbot_python

sendTG "I have pushed new images to docker"
