FROM debian:bookworm

COPY entrypoint.sh /entrypoint.sh

RUN apt-get update && apt-get install -y rsync postfix libsasl2-modules && \
  chmod 755 /entrypoint.sh && \
  ls -alh /entrypoint.sh

EXPOSE 25

ENTRYPOINT ["/entrypoint.sh"]
CMD ["start"]