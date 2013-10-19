var exposeRequestCount = function(newCount){
    window.AngularRequestCount = newCount;
};

Blang.config(['$httpProvider', function ($httpProvider) {
    var $http,
        interceptor = ['$q', '$injector', function ($q, $injector) {
            var notificationChannel;

            function success(response) {
                // get $http via $injector because of circular dependency problem
                $http = $http || $injector.get('$http');

                exposeRequestCount($http.pendingRequests.length);

                return response;
            }

            function error(response) {
                // get $http via $injector because of circular dependency problem
                $http = $http || $injector.get('$http');

                exposeRequestCount($http.pendingRequests.length);

                return $q.reject(response);
            }

            return function (promise) {
                // get $http via $injector because of circular dependency problem
                $http = $http || $injector.get('$http');

                exposeRequestCount($http.pendingRequests.length);

                return promise.then(success, error);
            };
        }];

    $httpProvider.responseInterceptors.push(interceptor);
}]);
