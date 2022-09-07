FROM ubuntu:jammy
RUN apt update && apt -y upgrade && apt -y install curl unzip git python3 virtualenv nodejs npm groff
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "/tmp/awscliv2.zip"
RUN unzip /tmp/awscliv2.zip -d /tmp
RUN /tmp/aws/install
RUN ln -s /usr/bin/python3 /usr/bin/python
RUN git clone https://github.com/aws/aws-elastic-beanstalk-cli-setup.git /tmp/aws-elastic-beanstalk-cli-setup
RUN python /tmp/aws-elastic-beanstalk-cli-setup/scripts/ebcli_installer.py
RUN ln -s /root/.ebcli-virtual-env/executables/eb /usr/bin/eb
RUN npm install -g @aws-amplify/cli
