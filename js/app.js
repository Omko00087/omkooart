var $ = Dom7;


var app = new Framework7({
  name: 'Evallstore', // App name
  theme: 'ios', // Automatic theme detection
  el: '#app', // App root element


  // App store
  store: store,
  // App routes
  routes: routes,
  // Register service worker
  serviceWorker: {
    path: '/service-worker.js',
  },
});

  // Alert username and password
  app.dialog.alert('Username: ' + username + '<br/>Password: ' + password);


 //Swiper Speed
var swiper = new Swiper('.swiper-container', {
      effect: 'fide',
      grabCursor: true,
      pagination: {
        el: '.swiper-pagination',
      },
      autoplay: {
    delay: 3500,
  },
    });