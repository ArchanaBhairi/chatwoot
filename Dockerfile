FROM chatwoot/chatwoot:latest

ENV RAILS_ENV=production
ENV NODE_ENV=production
ENV WEB_CONCURRENCY=1
ENV RAILS_MAX_THREADS=1

EXPOSE 3000

CMD ["sh", "-c", "bundle exec rails db:chatwoot_prepare && bundle exec puma -C config/puma.rb"]
