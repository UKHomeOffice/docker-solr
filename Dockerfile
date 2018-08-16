FROM solr:6.6-alpine

ENV SOLR_USER="solr" \
    SOLR_UID="8983"

USER $SOLR_USER
ENTRYPOINT ["/opt/solr/entrypoint.sh"]