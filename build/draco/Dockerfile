FROM ging/fiware-draco:2.1.0

LABEL maintainer="Manfredi G. Pistone & Walter D. Vergara for Engineering Ingegneria Informatica"

USER root

RUN apt-get update && \
    apt-get install -y nano && \
    apt-get install -y python3 && \
    apt-get install -y python3-pip 
    # requirements for opencv
    # apt-get install -y ffmpeg libsm6 libxext6

# python libraries
# RUN pip3 install opencv-python
# RUN pip3 install torch
# RUN pip3 install tensorflow
# RUN pip3 install matplotlib

COPY ./custom-init.sh /opt/nifi/scripts/custom-init.sh
COPY ./inject.sh /opt/nifi/scripts/inject.sh

# make useful directories
# RUN mkdir /opt/nifi/nifi-current/algorithms && chmod 755 -R /opt/nifi/nifi-current/algorithms

RUN chown nifi /opt/nifi/scripts/custom-init.sh  && \
    chgrp nifi /opt/nifi/scripts/custom-init.sh

RUN chown nifi /opt/nifi/scripts/inject.sh  && \
    chgrp nifi /opt/nifi/scripts/inject.sh

RUN chmod 775 /opt/nifi/scripts/custom-init.sh
RUN chmod 775 /opt/nifi/scripts/inject.sh

RUN mkdir /test_input
# COPY test_input /test_input
RUN chmod -R 777 /test_input

WORKDIR /opt/nifi/nifi-current


ENTRYPOINT ["/opt/nifi/scripts/custom-init.sh"]