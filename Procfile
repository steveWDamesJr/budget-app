web: bundle exec puma -t 5:5 -p ${PORT:-3000} -e ${RACK_ENV:-development}

web: bundle exec puma -C config/puma.rb

web: bin/rails server -p $5000

css: yarn build:css --watch
