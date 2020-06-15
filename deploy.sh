#!/bin/bash

npm run build

aws s3 sync --delete ./dist s3://$(cd ./terraform && terraform output bucket_prod)