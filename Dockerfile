FROM locustio/locust
ADD locust-tasks /locust-tasks
#COPY locust-tasks /locust-tasks
# RUN chmod +x /locust-tasks/run.sh
CMD ["/bin/bash", "/locust-tasks/run.sh"]
ENTRYPOINT ["/locust-tasks/run.sh"]
EXPOSE 5557 5558 8089
