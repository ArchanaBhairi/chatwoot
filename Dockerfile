FROM chatwoot/chatwoot:latest

ENV RAILS_ENV=production
ENV NODE_ENV=production

# Memory optimizations for 512MB free tier
ENV WEB_CONCURRENCY=1
ENV RAILS_MAX_THREADS=2
ENV MALLOC_ARENA_MAX=2
ENV RUBY_GC_HEAP_GROWTH_FACTOR=1.1
ENV RUBY_GC_MALLOC_LIMIT=4000100
ENV RUBY_GC_MALLOC_LIMIT_MAX=16000100

EXPOSE 10000

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

CMD ["/entrypoint.sh"]
