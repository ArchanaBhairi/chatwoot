FROM chatwoot/chatwoot:latest

ENV RAILS_ENV=production
ENV NODE_ENV=production
ENV WEB_CONCURRENCY=0
ENV RAILS_MAX_THREADS=1
ENV MALLOC_ARENA_MAX=2

EXPOSE 3000

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0", "-p", "3000"]
