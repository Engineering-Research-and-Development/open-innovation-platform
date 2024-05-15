FROM ging/fiware-draco:2.1.0

LABEL maintainer="Manfredi G. Pistone & Walter D. Vergara for Engineering Ingegneria Informatica"

USER root

RUN apt-get update && \
    apt-get install -y nano

COPY /custom-init.sh /opt/nifi/scripts/custom-init.sh
COPY /inject.sh /opt/nifi/scripts/inject.sh

RUN chown nifi /opt/nifi/scripts/custom-init.sh  && \
    chgrp nifi /opt/nifi/scripts/custom-init.sh

RUN chown nifi /opt/nifi/scripts/inject.sh  && \
    chgrp nifi /opt/nifi/scripts/inject.sh

RUN chmod 775 /opt/nifi/scripts/custom-init.sh
RUN chmod 775 /opt/nifi/scripts/inject.sh

WORKDIR /opt/nifi/nifi-current

ENTRYPOINT ["/opt/nifi/scripts/custom-init.sh"]