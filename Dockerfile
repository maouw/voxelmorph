FROM tensorflow/tensorflow:2.7.1-jupyter

# create unprivileged user for container, make directories
RUN adduser --disabled-password --gecos "App" app && \
     mkdir -p /home/app/src && \
     mkdir -p /home/app/work && \
		 mkdir -p /home/app/bin

# set ownership of everything
RUN chown -R app:app /home/app

RUN apt-get update && \
    apt-get install emacs maven -y && \
    rm -rf /var/lib/apt/lists/*

# Switch to unprivileged user
USER app

# add path used by pip to PATH
ENV PATH $PATH:/home/app/.local/bin

# ADD --chown=app:app requirements.txt  /home/app/voxelmorph/requirements.txt
# RUN pip install --user --find-links=/home/app/wheels --cache-dir=/home/app/wheels -r /home/app/voxelmorph/requirements.txt

ADD --chown=app:app . /home/app/voxelmorph
RUN pip install --user -e /home/app/voxelmorph/

RUN pip install --user antspyx

# unnecessary as tensorflow is the default backend but if you want to use another backend, this is the place
ENV VXM_BACKEND tensorflow

WORKDIR /home/app
