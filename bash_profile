
chmod 700 /root/.ssh
if ls /root/.ssh/* > /dev/null 2>&1
then
    chmod 600 /root/.ssh/*
fi

if [ "$BASH" ]; then
  if [ -f ~/.profile ]; then
    . ~/.profile
  fi
fi
