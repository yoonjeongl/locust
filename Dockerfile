FROM locustio/locust
ADD locust-tasks /locust-tasks
# COPY locust-tasks /locust-tasks
USER root
COPY --from=https://kqk51456.live.dynatrace.com/linux/oneagent-codemodules:all / /
ENV LD_PRELOAD /opt/dynatrace/oneagent/agent/lib64/liboneagentproc.so
RUN chmod +x /locust-tasks/run.sh
# CMD ["/bin/bash", "/locust-tasks/run.sh"]

USER locust
ENTRYPOINT ["/locust-tasks/run.sh"]
# RUN ["chmod", "+x", "/locust-tasks/run.sh"]
EXPOSE 5557 5558 8089
