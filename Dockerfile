FROM ubuntu:24.04

RUN apt-get update && apt-get install -y \
    curl \
    unzip \
    git \
    python3 \
    virtualenv \
    python-is-python3 \
    software-properties-common \
    jq \
    nodejs \
    npm \
    groff \
    && apt-get clean \
    && rm -rf /var/lib/aptlists/*

# Install AWS CLI v2
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "/tmp/awscliv2.zip" \
    && unzip /tmp/awscliv2.zip -d /tmp \
    && /tmp/aws/install \
    && rm -rf /tmp/aws /tmp/awscliv2.zip

# Session Manager Plugin
RUN curl "https://s3.amazonaws.com/session-manager-downloads/plugin/latest/ubuntu_64bit/session-manager-plugin.deb" -o "/tmp/session-manager-plugin.deb" \
    && dpkg -i /tmp/session-manager-plugin.deb \
    && rm -f /tmp/session-manager-plugin.deb

# Docker CE setup
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
RUN apt-get update && apt-get install -y \
    docker-ce-cli \
    && apt-get clean \
    && rm -rf /var/lib/aptlists/*

# Install Elastic Beanstalk CLI
RUN git clone https://github.com/aws/aws-elastic-beanstalk-cli-setup.git /tmp/aws-elastic-beanstalk-cli-setup \
    && python3 /tmp/aws-elastic-beanstalk-cli-setup/scripts/ebcli_installer.py \
    && rm -rf /tmp/aws-elastic-beanstalk-cli-setup
ENV PATH /root/.ebcli-virtual-env/executables:$PATH

# Install AWS Amplify CLI (Gen 1)
RUN npm install -g @aws-amplify/cli

COPY bash_profile /root/.bash_profile
CMD [ "/bin/bash", "--login" ]
WORKDIR /app
