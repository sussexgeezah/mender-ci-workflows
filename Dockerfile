ARG GOLANG_VERSION=1.19
ARG MENDER_CLI_VERSION=master
ARG MENDER_ARTIFACT_VERSION=master
ARG MENDER_CLIENT_VERSION=master

FROM golang:${GOLANG_VERSION} as cli-builder
WORKDIR /go/src/github.com/mendersoftware/mender-cli
ARG MENDER_CLI_VERSION
RUN git clone -b $MENDER_CLI_VERSION https://github.com/mendersoftware/mender-cli.git . && \
    make get-deps && \
    make build

FROM golang:${GOLANG_VERSION} as artifact-builder
WORKDIR /go/src/github.com/mendersoftware/mender-artifact
ARG MENDER_ARTIFACT_VERSION
RUN git clone -b $MENDER_ARTIFACT_VERSION https://github.com/mendersoftware/mender-artifact.git . && \
    make get-build-deps && \
    make build

FROM golang:${GOLANG_VERSION} as client-builder
WORKDIR /go/src/github.com/mendersoftware/mender
ARG MENDER_CLIENT_VERSION
RUN git clone -b $MENDER_CLIENT_VERSION https://github.com/mendersoftware/mender.git . && \
    DESTDIR=/install-modules-gen make install-modules-gen

FROM alpine
COPY --from=cli-builder /go/src/github.com/mendersoftware/mender-cli /usr/bin/
COPY --from=artifact-builder /go/src/github.com/mendersoftware/mender-artifact/mender-artifact /usr/bin/
COPY --from=client-builder /install-modules-gen/usr/bin/ /usr/bin/
ARG MENDER_ARTIFACT_VERSION
# The --mount instead of COPY is used to decrease the image layer size. Requires: 'export DOCKER_BUILDKIT=1'
RUN --mount=type=bind,source=apk-requirements.txt,target=/apk-requirements.txt \
    wget https://raw.githubusercontent.com/mendersoftware/mender-artifact/${MENDER_ARTIFACT_VERSION}/apk-run-requirements.txt && \
    apk --no-cache add $(cat apk-requirements.txt apk-run-requirements.txt) && \
    rm apk-run-requirements.txt
