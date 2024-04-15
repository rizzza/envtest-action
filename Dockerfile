FROM golang

ENV KUBERNETES_VERSION="1.27"
ENV ARGS="./..."

COPY scripts/envtest.sh /envtest.sh

RUN chmod +x /envtest.sh && \
    go install sigs.k8s.io/controller-runtime/tools/setup-envtest@latest && \
    setup-envtest use ${KUBERNETES_VERSION}

ENTRYPOINT [ "/envtest.sh" ]
