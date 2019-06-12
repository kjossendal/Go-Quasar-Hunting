#!/bin/bash
command -v docker > /dev/null
if ! [ $? -eq 0 ] ; then
    boldecho '\033[31mRequired developer tooling is missing!'
    echo "This project depends on Docker for environment management."
    echo "https://docker.com"
    exit 1
else
    echo -e "\033[32mFound Docker!\033[0m"
fi

echo -e "\033[32mRunning devserver...\033[0m"

docker build -t jossendal-go-hunt-app .

docker run -v$(pwd):/app -it -p 8080:8080 --rm --name jossendal-go-hunt-app-1 jossendal-go-hunt-app
