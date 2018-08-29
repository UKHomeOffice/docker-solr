FROM solr:6.6.2-alpine

ENV SOLR_USER="solr" \
    SOLR_UID="8983"

USER $SOLR_UID

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["solr-foreground"]
