FROM node:lts-alpine

RUN apk --no-cache add \ 
            bash \
            curl \
            less \
            groff \
            jq \
            git \
            python3 \
            py3-pip \
            py-pip && \
            python3 -m venv s3deploy && \
            source ./s3deploy/bin/activate && \
            pip install --upgrade pip awscli s3cmd && \
            mkdir /root/.aws

LABEL "com.github.actions.name"="React Deploy to S3"
LABEL "com.github.actions.description"="Build a React.js web app and sync to an AWS S3 repository"
LABEL "com.github.actions.icon"="upload-cloud"
LABEL "com.github.actions.color"="green"

LABEL repository="https://github.com/BeautyIndustryGroup/react-deploy-to-s3-action"

ENV PATH /github/workspace/node_modules/.bin:$PATH
ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
