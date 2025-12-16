#!/bin/bash
rm -rf public/
hugo --minify
rsync -avz --delete public/ root@knupan.com:/var/www/blog

