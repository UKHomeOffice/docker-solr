FROM solr:6.6-alpine

ENV SOLR_USER="solr" \
    SOLR_UID="8983"

USER $SOLR_UID
ENTRYPOINT ["/opt/solr/entrypoint.sh"]
