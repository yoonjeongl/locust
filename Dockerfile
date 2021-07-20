FROM locustio/locust
ADD locust-tasks /locust-tasks
RUN chmod 755 /locust-tasks/run.sh
EXPOSE 5557 5558 8089

ENTRYPOINT ["/locust-tasks/run.sh"]
