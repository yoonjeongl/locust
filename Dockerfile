FROM locustio/locust
ADD locust-tasks /locust-tasks
# COPY locust-tasks /locust-tasks
USER root
ARG DT_API_URL="https://kqk51456.live.dynatrace.com/api"
ARG DT_API_TOKEN="dt0c01.VJJWPO2IEIXX2BUTUW5GEDNJ.L4USS6LDB5Z5JRKUR65YKKFVTH7FWY6KLHL63WPC3J6ETCWGPJCMETA2TETDO4MD"
ARG DT_ONEAGENT_OPTIONS="flavor=default"
ENV DT_HOME="/opt/dynatrace/oneagent"
RUN mkdir -p "$DT_HOME" && \
    wget -O "$DT_HOME/oneagent.zip" "$DT_API_URL/v1/deployment/installer/agent/unix/paas/latest?Api-Token=$DT_API_TOKEN&$DT_ONEAGENT_OPTIONS" && \
    unzip -d "$DT_HOME" "$DT_HOME/oneagent.zip" && \
    rm "$DT_HOME/oneagent.zip"
ENTRYPOINT [ "/opt/dynatrace/oneagent/dynatrace-agent64.sh" ]
CMD [ "executable", "param1", "param2" ] # the command of your application, for example, Java
RUN chmod +x /locust-tasks/run.sh
# CMD ["/bin/bash", "/locust-tasks/run.sh"]

USER locust
ENTRYPOINT ["/locust-tasks/run.sh"]
# RUN ["chmod", "+x", "/locust-tasks/run.sh"]
EXPOSE 5557 5558 8089
