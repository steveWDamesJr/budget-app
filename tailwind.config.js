module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js','./*.html', './ecommerce/*.html', './assets/**/*.js',
    './src/**/*.{html,js}', './node_modules/tw-elements/dist/js/**/*.js'
  ],
  theme: {
    extend: {
      colors: {
        main: '#3778c2',
        second: '#5fb523',
        text: '#434b54',
      fontFamily: {
        'proxima-nova-bold': ['"Proxima Nova"','hover', 'focus' ],
        'sans': ['ui-sans-serif', 'system-ui', 'hover', 'focus'],
        'lobster':['lobster', 'cursive'],
        },
      },
    },
  },
  plugins: [
    require("tailgrids/plugin"),
    require('tw-elements/dist/plugin'),
  ],
};
