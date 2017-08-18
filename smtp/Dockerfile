FROM python:2.7

## This allows changing port when invoked but must rebuild each time.
ARG SMTPPORT=2025
ENV SMTPPORT $SMTPPORT

CMD [ "/bin/bash","-c","/usr/local/bin/python -m smtpd -d -n -c DebuggingServer localhost:${SMTPPORT}" ]

#end
