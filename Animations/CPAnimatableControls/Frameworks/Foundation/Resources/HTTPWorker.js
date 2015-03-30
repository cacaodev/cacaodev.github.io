
self.addEventListener('message', function(e)
{
    var methods = e.data;

    methods.forEach(function(method)
    {
        var command = method.command,
            args = method.args;

        self[command].apply(this, args);
    });
});

self.start = function(method, url, async, credentials, headers, body)
{
    var request = new XMLHttpRequest();
    request.withCredentials = credentials;
    request.open(method, url, async);

    for (var key in headers)
        request.setRequestHeader(key, headers[key]);

    request.onreadystatechange = function()
    {
        post("readyState", {state:request.readyState , data:request.responseText, status:request.status, headers:request.getAllResponseHeaders()});
    };

    request.send(body);
};

self.create = function()
{
    self.httpRequest = new XMLHttpRequest();
};

self.withCredentials = function(withCredentials)
{
    self.httpRequest.withCredentials = withCredentials;
};

self.open = function(method, url, async)
{
    self.httpRequest.open(method, url, async);
};

self.setHeaders = function (headers)
{
    for (var key in headers)
        self.httpRequest.setRequestHeader(key, headers[key]);
};

self.send = function(body)
{
    try
    {
        self.httpRequest.onreadystatechange = self.readyStateDidChange;
        self.httpRequest.send(body);
    }
    catch (anException)
    {
        post("error", anException.toString());
    }
};

self.abort = function()
{
    self.httpRequest.abort();
}

self.readyStateDidChange = function()
{
    var request = self.httpRequest;
    post("readyState", {state:request.readyState , data:request.responseText, status:request.status, headers:request.getAllResponseHeaders()});
};

var post = function(type, value)
{
    self.postMessage({type:type, value:value});
};
