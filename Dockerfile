FROM locustio/locust
ADD locust-tasks /locust-tasks
EXPOSE 5557 5558 8089
RUN chmod +x /locust-tasks/run.sh

ENTRYPOINT ["/locust-tasks/run.sh"]
