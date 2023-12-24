function fn() {
  var env = karate.env; // get java system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev'; // a custom 'intelligent' default
  }
  var config = { // base config JSON
    appId: 'petStore',
    appSecret: 'tokenExample',
    baseUrl: '',
    petsPath: '/v2/pet/',
    petId: 0
  };
  //we are not using this at the moment
  if (env == 'stage') {
    // over-ride only those that need to be
    config.baseUrl = 'https://petstore.swagger.io';
    config.petsPath = '/v2/pet/';
    config.petId = 5555
  } else if (env == 'e2e') {
    config.someUrlBase = 'https://e2e-host/v1/auth';
  }
  // don't waste time waiting for a connection or if servers don't respond within 5 seconds
  karate.configure('connectTimeout', 5000);
  karate.configure('readTimeout', 5000);
  return config;
}