FROM chatwoot/chatwoot:latest

ENV RAILS_ENV=production
ENV NODE_ENV=production
ENV WEB_CONCURRENCY=1
ENV RAILS_MAX_THREADS=2
ENV DATABASE_POOL=2
ENV DB_POOL=2
ENV MALLOC_ARENA_MAX=2
ENV RUBY_GC_HEAP_GROWTH_FACTOR=1.1

EXPOSE 10000

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

CMD ["/entrypoint.sh"]
