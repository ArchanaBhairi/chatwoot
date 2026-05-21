FROM chatwoot/chatwoot:latest

EXPOSE 3000

CMD ["sh", "-c", "bundle exec rails db:chatwoot_prepare && bundle exec rails server -b 0.0.0.0 -p 3000"]
